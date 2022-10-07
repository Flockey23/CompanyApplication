import 'package:flutter/material.dart';
import 'package:myapp/domain/models/company.dart';
import 'package:myapp/domain/state/updateCompany/update_company_state.dart';
import 'package:myapp/internal/dependencies/updateCompany_module.dart';
import 'package:myapp/presentation/ui/widgets/update_company_form.dart';

class CompanyUpdate extends StatefulWidget {
  const CompanyUpdate({super.key});

  @override
  State<CompanyUpdate> createState() => _CompanyUpdateState();
}

class _CompanyUpdateState extends State<CompanyUpdate> {
  late UpdateCompanyState _updateCompanyState;

  @override
  void initState() {
    super.initState();
    _updateCompanyState = UpdateCompanyModule.updateCompanyState();
  }

  @override
  Widget build(BuildContext context) {
    final company = ModalRoute.of(context)!.settings.arguments as Company;
    return Scaffold(
        appBar: AppBar(
          title: Text("Обновление ${company.title}"),
          toolbarHeight: MediaQuery.of(context).size.height / 10,
        ),
        body: UpdateCompanyForm(company: company,updateCompanyState: _updateCompanyState)
    );
  }
}
