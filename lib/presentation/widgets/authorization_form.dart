import 'package:flutter/material.dart';
import 'package:myapp/data/api/model/api_user.dart';
import 'package:myapp/domain/state/authorization/authorization_state.dart';
import 'package:myapp/presentation/constantStyles.dart';
import 'package:myapp/presentation/pages/Company/home.dart';

class AuthorizationForm extends StatefulWidget{
  final AuthorizationState authorizationState;
  const AuthorizationForm({super.key, required this.authorizationState});

  @override
  State<StatefulWidget> createState() => _AuthorizationFormState();

}

class _AuthorizationFormState extends State<AuthorizationForm> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  late final AuthorizationState authorizationState;

  @override
  void initState(){
    super.initState();
    authorizationState = widget.authorizationState;
  }

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Wrap(
              runSpacing: 20,
              spacing: 20,
              alignment: WrapAlignment.center,
              children: [
                TextField(
                    controller: _loginController,
                    style: ConstantStyles.textFormFieldStyle,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Введите логин",
                      labelText: "Логин",
                      labelStyle: ConstantStyles.labelStyle,
                    )),
                TextField(
                    controller: _passwordController,
                    style: ConstantStyles.textFormFieldStyle,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Введите пароль",
                      labelText: "Пароль",
                      labelStyle: ConstantStyles.labelStyle,
                    )),
                ElevatedButton(
                  onPressed: () {
                    _authorize(context);
                  },
                  style: ConstantStyles.buttonStyle,
                  child: const Text("Войти"),
                ),
              ])
        ]),
      );
  }

  _authorize(BuildContext context) async {
    if (_loginController.text != '' && _passwordController.text != '') {
      authorizationState.user = ApiUser(
        login: _loginController.text,
        password: _passwordController.text,
      );
      await authorizationState.authorize();
      showResponse();
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text("Ошибка!"),
                content: const Text("Заполните все значения!"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("ОК!"))
                ]);
          });
    }
  }

  showResponse() {
    int responseStatusCode = authorizationState.statusCode;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          if (responseStatusCode == 404) {
            return AlertDialog(
                title: const Text("Ошибка!"),
                content: const Text("Пользователь не найден!"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("ОК!"))
                ]);
          } else if (responseStatusCode == 401) {
            return AlertDialog(
                title: const Text("Ошибка!"),
                content: const Text("Неправильный пароль!"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("ОК!"))
                ]);
          } else if (responseStatusCode == 500) {
            return AlertDialog(
              title: const Text("Ошибка!"),
              content: const Text("Внутренняя ошибка!"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
                    },
                    child: const Text("OK!"))
              ],
            );
          } else {
            return AlertDialog(
              title: const Text("Успешно!"),
              content: const Text("Успешная авторизация!"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
                    },
                    child: const Text("OK!"))
              ],
            );
          }
        });
  }
}