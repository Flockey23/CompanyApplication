import 'package:flutter/material.dart';
import 'package:myapp/domain/state/home/home_state.dart';
import 'package:myapp/presentation/ui/pages/Company/home.dart';

class DeleteCompanies {
  showDeleteDialog(HomeState homeState, BuildContext context) {
    if (homeState.deleteCompanies.isNotEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Удаление"),
              content: const Text(
                  "Вы уверены что хотите удалить выделенные компании?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Отмена")),
                ElevatedButton(
                    onPressed: () {
                      deleteSelectedCompanies(homeState, context);
                    },
                    child: const Text("Подтвердить")),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text("Ошибка!"),
                content: const Text("Выберите компании для удаления"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Продолжить"))
                ]);
          });
    }
  }

  deleteSelectedCompanies(HomeState homeState, BuildContext context) async {
    await homeState.deleteSelectedCompanies().then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home())));
  }
}
