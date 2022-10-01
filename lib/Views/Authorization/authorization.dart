import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/Views/Company/home.dart';
import 'package:myapp/Views/constantStyles.dart';
import 'package:myapp/data/api/model/api_user.dart';

import 'package:myapp/domain/state/authorization/authorization_state.dart';
import 'package:myapp/internal/dependencies/authorization_module.dart';

class Authorization extends StatefulWidget{
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

bool isValueEmpty(value) => (value == null || value.isEmpty);

class _AuthorizationState extends State<Authorization> {
  late AuthorizationState _authorizationState;

  @override
  void initState() {
    super.initState();
    _authorizationState = AuthorizationModule.authorizationState();
  }

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Авторизация CompanyApp"),
      ),
      body: authorizationForm(),
    );
  }

  Widget authorizationForm() {
    return Observer(
      builder: (context) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    TextField(
                    controller: _loginController,
                    style: ConstantStyles.textFormFieldStyle,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Введите логин",
                      labelText: "Логин",
                      labelStyle: ConstantStyles.labelStyle,
                    )),
                    TextField(
                      controller: _passwordController,
                        style: ConstantStyles.textFormFieldStyle,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Введите пароль",
                          labelText: "Пароль",
                          labelStyle: ConstantStyles.labelStyle,
                        )
                    ),
                    ElevatedButton(
                      onPressed: authorize,
                      style: ConstantStyles.buttonStyle,
                      child: const Text("Войти"),
                    )
                  ])
              ]),
        );
      }
    );
  }

  authorize() async {
    if (_loginController.text != '' && _passwordController.text != '') {
      _authorizationState.user = ApiUser(
        login: _loginController.text,
        password: _passwordController.text,
      );
      await _authorizationState.authorize();
      showResponse();
    } else{
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
            title: const Text("Ошибка!"),
            content: const Text("Заполните все значения!"),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: const Text("ОК!"))
            ]
        );
      });
    }
  }

  showResponse(){
    int responseStatusCode = _authorizationState.statusCode;
    showDialog(context: context, builder: (BuildContext context) {
      if (responseStatusCode == 404) {
        return AlertDialog(
            title: const Text("Ошибка!"),
            content: const Text("Пользователь не найден!"),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: const Text("ОК!"))
            ]);
      } else if (responseStatusCode == 401) {
        return AlertDialog(
            title: const Text("Ошибка!"),
            content: const Text("Неправильный пароль!"),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: const Text("ОК!"))
            ]);
      }else if(responseStatusCode == 500){
        return AlertDialog(
          title: const Text("Ошибка!"),
          content: const Text("Внутренняя ошибка!"),
          actions: [
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Home(),));
            }, child: const Text("OK!"))
          ],
        );
      }else {
        return AlertDialog(
          title: const Text("Успешно!"),
          content: const Text("Успешная авторизация!"),
          actions: [
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Home(),));
            }, child: const Text("OK!"))
          ],
        );
      }
    });
  }
}
