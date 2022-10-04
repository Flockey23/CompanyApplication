import 'package:flutter/material.dart';
import 'package:myapp/presentation/constantStyles.dart';
import 'package:myapp/presentation/pages/Authorization/authorization.dart';
import 'package:myapp/domain/state/home/home_state.dart';
import 'package:myapp/internal/dependencies/home_module.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'create.dart';
import 'update.dart';
import 'showDetails.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeState _homeState;

  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState();
    getCompany();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Data'),
        toolbarHeight: MediaQuery.of(context).size.height/10,
        leading: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Authorization()));
            }),
        actions: [
          IconButton(
              onPressed: showDeleteDialog,
              icon: const Icon(Icons.delete)),
        ],
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add_circle),
          onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CompanyAdd()));
      }),
      body: companyInformation(context),
    );
  }

  Widget companyInformation(BuildContext context) {
    return Observer(builder: (context) {
      if (_homeState.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
          itemCount: _homeState.companies.length,
          itemBuilder: (context, i) {
            final company = _homeState.companies[i];
            return ListTile(
              tileColor: _homeState.selectedCompanies[i].selected == true
                  ? Colors.grey
                  : Colors.black12,
              onTap: () => setState(() {
                _homeState.setStateSelectedCompanies(index: i);
              }),
              onLongPress: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => const ShowDetailsCompany(),
                        settings: RouteSettings(arguments: company)));
              },
              title: Text("Название:${company.title}"),
              subtitle: Text("Сайт:${company.site}"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: ConstantStyles.iconSize,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const CompanyUpdate(),
                          settings: RouteSettings(arguments: company)));
                },
              ),
            );
          });
    });
  }

  getCompany() async {
    await _homeState.getAllCompanies();
  }

  showDeleteDialog() {
    if (_homeState.deleteCompanies.isNotEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Удаление"),
              content: const Text(
                  "Вы уверены что хотите удалить выделенные компании?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Отмена")),
                ElevatedButton(
                    onPressed: deleteSelectedCompanies,
                    child: const Text("Подтвердить")),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text("Ошибка!"),
                content: const Text("Выберите компании для удаления"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Продолжить"))
                ]);
          });
    }
  }

  deleteSelectedCompanies() async {
    await _homeState.deleteSelectedCompanies();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }
}
