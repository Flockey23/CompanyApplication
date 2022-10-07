import 'package:flutter/material.dart';
import 'package:myapp/domain/state/createCompany/create_company_state.dart';
import 'package:myapp/internal/dependencies/createCompany_module.dart';
import 'package:myapp/presentation/ui/widgets/create_company_form.dart';



class CompanyAdd extends StatefulWidget{
  const CompanyAdd({super.key});
  @override
  State<CompanyAdd> createState() => _CompanyAddState();
}

class _CompanyAddState extends State<CompanyAdd>{
  late CreateCompanyState _createCompanyState;

  @override
  void initState() {
    super.initState();
    _createCompanyState = CreateCompanyModule.addCompanyState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text("Добавление новой компании"),
          toolbarHeight: MediaQuery.of(context).size.height/10,
        ),
        body: CreateCompanyForm(createCompanyState: _createCompanyState),
    );
  }
}