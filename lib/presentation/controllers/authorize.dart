import 'package:flutter/material.dart';
import 'package:myapp/data/api/model/api_user.dart';
import 'package:myapp/domain/state/authorization/authorization_state.dart';
import 'package:myapp/presentation/ui/pages/Company/home.dart';

class Authorize{
  authorize(TextEditingController loginController,
      TextEditingController passwordController,
      AuthorizationState authorizationState,
      BuildContext context) async {
    if (loginController.text != '' && passwordController.text != '') {
      authorizationState.user = ApiUser(
        login: loginController.text,
        password: passwordController.text,
      );
      await authorizationState.authorize().then((value) => showResponse(authorizationState,context));
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

  showResponse(AuthorizationState authorizationState,BuildContext context) {
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