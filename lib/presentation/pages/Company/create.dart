import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/presentation/pages/Company/home.dart';
import 'package:myapp/data/api/model/api_company.dart';
import 'package:myapp/domain/state/createCompany/createCompany_state.dart';
import 'package:myapp/internal/dependencies/createCompany_module.dart';

import 'package:myapp/presentation/constantStyles.dart';


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

  bool isValueEmpty(value) => (value == null || value.isEmpty);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text("Добавление новой компании"),
        ),
        body: createCompanyForm()
    );
  }

  Observer createCompanyForm() {
    return Observer(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            child: Form(key: formKey,
            child: Column(children: [
              Wrap(runSpacing: 20,
                  spacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    TextFormField(onSaved: (value) =>
                        setState(() => title = value!),
                        validator: (value) {
                          if (isValueEmpty(value)) {
                            return 'Введите значение';
                          }
                          return null;
                        },
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Введите название компании",
                            labelText: "Название",
                            labelStyle: ConstantStyles.labelStyle
                        )),
                    TextFormField(onSaved: (value) =>
                        setState(() => fioContact = value!),
                        validator: (value) {
                          if (isValueEmpty(value)) {
                            return 'Введите значение';
                          }
                          return null;
                        },
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Введите ФИО контактного лица",
                            labelText: "ФИО контактного лица",
                            labelStyle: ConstantStyles.labelStyle
                        )),
                    TextFormField(onSaved: (value) =>
                        setState(() => phone = value!),
                        validator: (value) {
                          if (isValueEmpty(value)) {
                            return 'Введите значение';
                          }
                          return null;
                        },
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [FilteringTextInputFormatter
                            .digitsOnly
                        ],
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Введите телефон",
                            labelText: "Телефон",
                            labelStyle: ConstantStyles.labelStyle
                        )),
                    TextFormField(onSaved: (value) =>
                        setState(() => email = value!),
                        validator: (value) {
                          if (isValueEmpty(value)) {
                            return 'Введите значение';
                          }
                          return null;
                        },
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Введите почту",
                            labelText: "Email",
                            labelStyle: ConstantStyles.labelStyle
                        )),
                    TextFormField(onSaved: (value) =>
                        setState(() => site = value!),
                        validator: (value) {
                          if (isValueEmpty(value)) {
                            return 'Введите значение';
                          }
                          return null;
                        },
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Введите сайт",
                            labelText: "Сайт", labelStyle: ConstantStyles.labelStyle
                        )),
                    TextFormField(onSaved: (value) =>
                        setState(() => postcode = int.parse(value!)),
                        validator: (value) {
                          if (isValueEmpty(value)) {
                            return 'Введите значение';
                          }
                          return null;
                        },
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [FilteringTextInputFormatter
                            .digitsOnly
                        ],
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Введите почтовый индекс",
                            labelText: "Почтовый индекс",
                            labelStyle: ConstantStyles.labelStyle
                        )),
                    TextFormField(onSaved: (value) =>
                        setState(() => city = value!),
                        validator: (value) {
                          if (isValueEmpty(value)) {
                            return 'Введите значение';
                          }
                          return null;
                        },
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Введите город",
                            labelText: "Город",
                            labelStyle: ConstantStyles.labelStyle
                        )),
                    TextFormField(onSaved: (value) =>
                        setState(() => street = value!),
                        validator: (value) {
                          if (isValueEmpty(value)) {
                            return 'Введите значение';
                          }
                          return null;
                        },
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Введите улицу",
                            labelText: "Улица",
                            labelStyle: ConstantStyles.labelStyle
                        )),
                    TextFormField(onSaved: (value) =>
                        setState(() => house = int.parse(value!)),
                        validator: (value) {
                          if (isValueEmpty(value)) {
                            return 'Введите значение';
                          }
                          return null;
                        },
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [FilteringTextInputFormatter
                            .digitsOnly
                        ],
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Введите дом",
                            labelText: "Дом", labelStyle: ConstantStyles.labelStyle
                        )),
                    TextFormField(onSaved: (value) =>
                        setState(() => latitude = int.parse(value!)),
                        validator: (value) {
                          if (isValueEmpty(value)) {
                            return 'Введите значение';
                          }
                          return null;
                        },
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [FilteringTextInputFormatter
                            .digitsOnly
                        ],
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Введите широту",
                            labelText: "Широта",
                            labelStyle: ConstantStyles.labelStyle
                        )),
                    TextFormField(onSaved: (value) =>
                        setState(() => longitude = int.parse(value!)),
                        validator: (value) {
                          if (isValueEmpty(value)) {
                            return 'Введите значение';
                          }
                          return null;
                        },
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [FilteringTextInputFormatter
                            .digitsOnly
                        ],
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Введите долготу",
                            labelText: "Долгота",
                            labelStyle: ConstantStyles.labelStyle
                        )),
                    ElevatedButton(onPressed: sendCompany,
                      style: ConstantStyles.buttonStyle,
                      child: const Text("Сохранить"),
                    ),
                  ]),
            ]),
          ),
          ),
        );
      });
  }

  sendCompany() async{
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      _createCompanyState.companyForCreate = ApiCompany(
          id: id,
          title: title,
          fioContact: fioContact,
          phone: phone,
          email: email,
          site: site,
          postcode: postcode,
          city: city,
          street: street,
          house: house,
          latitude: latitude,
          longitude: longitude);
      await _createCompanyState.createCompany();
      showResponse();
    }
  }

  showResponse(){
    int responseStatusCode = _createCompanyState.responseStatusCode;
    debugPrint(responseStatusCode.toString());
    showDialog(context: context, builder: (BuildContext context)
    {
      if (responseStatusCode == 200) {
        return AlertDialog(
            title: const Text("Успешно!"),
            content: const Text("Компания успешно создана!"),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Home(),));
              }, child: const Text("ОК!"))
            ]);
      } else if(responseStatusCode == 400){
        return AlertDialog(
            title: const Text("Ошибка!"),
            content: const Text("Не получилось создать компанию!"),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: const Text("ОК!"))
            ]);
      }else{
        return AlertDialog(
            title: const Text("Ошибка!"),
            content: const Text("Произошла ошибка!"),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: const Text("ОК!"))
            ]);
      }
    });
  }
}