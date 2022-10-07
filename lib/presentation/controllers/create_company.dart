import 'package:flutter/material.dart';
import 'package:myapp/data/api/model/api_company.dart';
import 'package:myapp/domain/state/createCompany/create_company_state.dart';
import 'package:myapp/presentation/ui/pages/Company/home.dart';

class CreateCompanyController {
  createCompany(
      CreateCompanyState createCompanyState,
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
    createCompanyState.companyForCreate = ApiCompany(
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
    await createCompanyState
        .createCompany()
        .then((value) => showResponse(createCompanyState, context));
  }

  showResponse(CreateCompanyState createCompanyState, BuildContext context) {
    int responseStatusCode = createCompanyState.responseStatusCode;
    debugPrint(responseStatusCode.toString());
    showDialog(
        context: context,
        builder: (BuildContext context) {
          if (responseStatusCode == 200) {
            return AlertDialog(
                title: const Text("Успешно!"),
                content: const Text("Компания успешно создана!"),
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
                content: const Text("Не получилось создать компанию!"),
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
