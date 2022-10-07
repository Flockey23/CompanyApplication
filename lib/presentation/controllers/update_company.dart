import 'package:flutter/material.dart';
import 'package:myapp/data/api/model/api_company.dart';
import 'package:myapp/domain/state/updateCompany/update_company_state.dart';
import 'package:myapp/presentation/ui/pages/Company/home.dart';

class UpdateCompany {
  void updateCompany(
      UpdateCompanyState updateCompanyState,
      int id,
      String title,
      String fioContact,
      String phone,
      String email,
      String site,
      int postcode,
      String city,
      String street,
      int house,
      int latitude,
      int longitude,
      BuildContext context) async {
    updateCompanyState.companyForUpdate = ApiCompany(
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
    await updateCompanyState
        .updateCompany()
        .then((value) => showResponse(updateCompanyState, context));
  }

  showResponse(UpdateCompanyState updateCompanyState, BuildContext context) {
    int responseStatusCode = updateCompanyState.responseStatusCode;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          if (responseStatusCode == 200) {
            return AlertDialog(
                title: const Text("Успешно!"),
                content: const Text("Компания успешно обновлена!"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Home(),
                        ));
                      },
                      child: const Text("ОК!"))
                ]);
          } else if (responseStatusCode == 400) {
            return AlertDialog(
                title: const Text("Ошибка!"),
                content: const Text("Не получилось обновить данную компанию!"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("ОК!"))
                ]);
          } else {
            return AlertDialog(
                title: const Text("Ошибка!"),
                content: const Text("Произошла ошибка!"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("ОК!"))
                ]);
          }
        });
  }
}
