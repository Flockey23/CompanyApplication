import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/domain/models/company.dart';
import 'package:myapp/domain/state/updateCompany/update_company_state.dart';
import 'package:myapp/presentation/util/constant_styles.dart';
import 'package:myapp/presentation/controllers/update_company.dart';
import 'package:myapp/presentation/util/constant_expressions.dart';


class UpdateCompanyForm extends StatefulWidget {
  const UpdateCompanyForm(
      {super.key, required this.company, required this.updateCompanyState});

  final UpdateCompanyState updateCompanyState;
  final Company company;

  @override
  State<StatefulWidget> createState() => _UpdateCompanyFormState();
}

class _UpdateCompanyFormState extends State<UpdateCompanyForm> {
  late final Company company;
  late final UpdateCompanyState updateCompanyState;
  final UpdateCompany updateCompanyClass = UpdateCompany();

  final formKey = GlobalKey<FormState>();

  int id = 0;
  String title = '';
  String fioContact = '';
  String phone = '';
  String email = '';
  String site = '';
  int postcode = 0;
  String city = '';
  String street = '';
  int house = 0;
  int latitude = 0;
  int longitude = 0;

  final ConstantExpressions constantExp = ConstantExpressions();

  @override
  void initState() {
    super.initState();
    company = widget.company;
    updateCompanyState = widget.updateCompanyState;
    id = company.id;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    TextFormField(
                        initialValue: company.title,
                        onSaved: (value) => setState(() => title = value!),
                        validator: (value) => constantExp.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "?????????????? ???????????????? ????????????????",
                            labelText: "????????????????",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        initialValue: company.fioContact,
                        onSaved: (value) => setState(() => fioContact = value!),
                        validator: (value) => constantExp.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "?????????????? ?????? ?????????????????????? ????????",
                            labelText: "?????? ?????????????????????? ????????",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        initialValue: company.phone.toString(),
                        onSaved: (value) => setState(() => phone = value!),
                        validator: (value) => constantExp.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "?????????????? ??????????????",
                            labelText: "??????????????",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        initialValue: company.email,
                        onSaved: (value) => setState(() => email = value!),
                        validator: (value) => constantExp.checkEmail(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "?????????????? ??????????",
                            labelText: "Email",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        initialValue: company.site,
                        onSaved: (value) => setState(() => site = value!),
                        validator: (value) => constantExp.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "?????????????? ????????",
                            labelText: "????????",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        initialValue: company.postcode.toString(),
                        onSaved: (value) =>
                            setState(() => postcode = int.parse(value!)),
                        validator: (value) => constantExp.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "?????????????? ???????????????? ????????????",
                            labelText: "???????????????? ????????????",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        initialValue: company.city.toString(),
                        onSaved: (value) => setState(() => city = value!),
                        validator: (value) => constantExp.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "?????????????? ??????????",
                            labelText: "??????????",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        initialValue: company.street.toString(),
                        onSaved: (value) => setState(() => street = value!),
                        validator: (value) => constantExp.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "?????????????? ??????????",
                            labelText: "??????????",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        initialValue: company.house.toString(),
                        onSaved: (value) =>
                            setState(() => house = int.parse(value!)),
                        validator: (value) => constantExp.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "?????????????? ??????",
                            labelText: "??????",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        initialValue: company.latitude.toString(),
                        onSaved: (value) =>
                            setState(() => latitude = int.parse(value!)),
                        validator: (value) => constantExp.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "?????????????? ????????????",
                            labelText: "????????????",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        initialValue: company.longitude.toString(),
                        onSaved: (value) =>
                            setState(() => longitude = int.parse(value!)),
                        validator: (value) => constantExp.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "?????????????? ??????????????",
                            labelText: "??????????????",
                            labelStyle: ConstantStyles.labelStyle)),
                       ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState?.save();
                            updateCompanyClass.updateCompany(
                                updateCompanyState,
                                id,
                                title,
                                fioContact,
                                phone,
                                email,
                                site,
                                postcode,
                                city,
                                street,
                                house,
                                latitude,
                                longitude,
                                context);
                          }
                        },
                        style: ConstantStyles.buttonStyle,
                        child: const Text("??????????????????"),
                    ),
                  ]),
            ]),
          ),
        ),
      );
    });
  }
}
