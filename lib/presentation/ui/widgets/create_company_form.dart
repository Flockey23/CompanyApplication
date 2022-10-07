import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/domain/state/createCompany/create_company_state.dart';
import 'package:myapp/presentation/controllers/create_company.dart';
import 'package:myapp/presentation/util/constant_expressions.dart';
import 'package:myapp/presentation/util/constant_styles.dart';

class CreateCompanyForm extends StatefulWidget {
  const CreateCompanyForm({super.key, required this.createCompanyState});

  final CreateCompanyState createCompanyState;

  @override
  State<StatefulWidget> createState() => _CreateCompanyFormState();
}

class _CreateCompanyFormState extends State<CreateCompanyForm> {
  late final CreateCompanyState _createCompanyState;
  final CreateCompanyController _createCompanyController =
      CreateCompanyController();

  final Constants constants = Constants();
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

  @override
  void initState() {
    super.initState();
    _createCompanyState = widget.createCompanyState;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
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
                        onSaved: (value) => setState(() => title = value!),
                        validator: (value) => constants.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите название компании",
                            labelText: "Название",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        onSaved: (value) => setState(() => fioContact = value!),
                        validator: (value) => constants.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите ФИО контактного лица",
                            labelText: "ФИО контактного лица",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        onSaved: (value) => setState(() => phone = value!),
                        validator: (value) => constants.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите телефон",
                            labelText: "Телефон",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        onSaved: (value) => setState(() => email = value!),
                        validator: (value) => constants.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите почту",
                            labelText: "Email",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        onSaved: (value) => setState(() => site = value!),
                        validator: (value) => constants.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите сайт",
                            labelText: "Сайт",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        onSaved: (value) =>
                            setState(() => postcode = int.parse(value!)),
                        validator: (value) => constants.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите почтовый индекс",
                            labelText: "Почтовый индекс",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        onSaved: (value) => setState(() => city = value!),
                        validator: (value) => constants.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите город",
                            labelText: "Город",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        onSaved: (value) => setState(() => street = value!),
                        validator: (value) => constants.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите улицу",
                            labelText: "Улица",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        onSaved: (value) =>
                            setState(() => house = int.parse(value!)),
                        validator: (value) => constants.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите дом",
                            labelText: "Дом",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        onSaved: (value) =>
                            setState(() => latitude = int.parse(value!)),
                        validator: (value) => constants.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите широту",
                            labelText: "Широта",
                            labelStyle: ConstantStyles.labelStyle)),
                    TextFormField(
                        onSaved: (value) =>
                            setState(() => longitude = int.parse(value!)),
                        validator: (value) => constants.checkIsEmpty(value!),
                        style: ConstantStyles.textFormFieldStyle,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Введите долготу",
                            labelText: "Долгота",
                            labelStyle: ConstantStyles.labelStyle)),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState?.save();
                          _createCompanyController.createCompany(
                              _createCompanyState,
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
                      child: const Text("Сохранить"),
                    ),
                  ]),
            ]),
          ),
        ),
      );
    });
  }
}
