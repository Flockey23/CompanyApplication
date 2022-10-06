import 'package:flutter/material.dart';
import 'package:myapp/presentation/pages/Authorization/authorization.dart';
import 'package:myapp/domain/state/home/home_state.dart';
import 'package:myapp/internal/dependencies/home_module.dart';
import 'package:myapp/presentation/widgets/company_information.dart';
import 'create.dart';

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
      body: CompanyInformation(homeState: _homeState),
    );
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
  }
}
