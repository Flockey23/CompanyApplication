import 'package:flutter/material.dart';
import 'package:myapp/domain/state/authorization/authorization_state.dart';
import 'package:myapp/internal/dependencies/authorization_module.dart';
import 'package:myapp/presentation/ui/widgets/authorization_form.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  late AuthorizationState _authorizationState;

  @override
  void initState() {
    super.initState();
    _authorizationState = AuthorizationModule.authorizationState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Авторизация CompanyApp"),
        toolbarHeight: MediaQuery.of(context).size.height/10,
        automaticallyImplyLeading: false,
      ),
      body: AuthorizationForm(authorizationState: _authorizationState),
    );
  }
}
