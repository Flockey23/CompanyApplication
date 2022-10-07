import 'package:flutter/material.dart';
import 'package:myapp/domain/state/home/home_state.dart';
import 'package:myapp/internal/dependencies/home_module.dart';
import 'package:myapp/presentation/controllers/delete_companies.dart';
import 'package:myapp/presentation/ui/pages/Authorization/authorization.dart';
import 'package:myapp/presentation/ui/widgets/company_information.dart';
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

  final DeleteCompanies deleteCompanies = DeleteCompanies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Data'),
        toolbarHeight: MediaQuery.of(context).size.height / 10,
        leading: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Authorization()));
            }),
        actions: [
          IconButton(
              onPressed: () {
                deleteCompanies.showDeleteDialog(_homeState, context);
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle),
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
}
