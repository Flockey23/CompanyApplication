import 'package:flutter/material.dart';
import 'package:myapp/domain/state/authorization/authorization_state.dart';
import 'package:myapp/presentation/util/constant_styles.dart';
import 'package:myapp/presentation/controllers/authorize.dart';

class AuthorizationForm extends StatefulWidget{
  const AuthorizationForm({super.key, required this.authorizationState});

  final AuthorizationState authorizationState;

  @override
  State<StatefulWidget> createState() => _AuthorizationFormState();

}

class _AuthorizationFormState extends State<AuthorizationForm> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final Authorize authorizeClass = Authorize();
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
                  authorizeClass.authorize(_loginController,
                      _passwordController,
                      widget.authorizationState,
                      context);
                },
                style: ConstantStyles.buttonStyle,
                child: const Text("Войти"),
              ),
            ])
      ])
      );
  }
}