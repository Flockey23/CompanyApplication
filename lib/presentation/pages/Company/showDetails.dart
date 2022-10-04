import 'package:flutter/material.dart';
import 'package:myapp/domain/models/company.dart';
import 'package:myapp/presentation/constantStyles.dart';

class ShowDetailsCompany extends StatelessWidget {
  const ShowDetailsCompany({super.key});

  @override
  Widget build(BuildContext context) {
    final company = ModalRoute.of(context)!.settings.arguments as Company;
    return Scaffold(
      appBar: AppBar(
        title: Text("Просмотр ${company.title}"),
        toolbarHeight: MediaQuery.of(context).size.height / 10,
      ),
      body: showDetailsForm(company),
    );
  }

  Widget showDetailsForm(Company company) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black54, Colors.black12]),
      ),
      child: ListView(
        children: [
          Wrap(runSpacing: 20,spacing: 20,
              direction: Axis.vertical,
              children: [
            Text("Название: ${company.title}", style: ConstantStyles.textStyle),
            Text("ФИО конт.лица: ${company.fioContact}",
                style: ConstantStyles.textStyle),
            Text("Телефон: ${company.phone.toString()}",
                style: ConstantStyles.textStyle),
            Text("Электронная почта: ${company.email}",
                style: ConstantStyles.textStyle),
            Text("Сайт: ${company.site}", style: ConstantStyles.textStyle),
            Text("Почтовый индекс: ${company.postcode.toString()}",
                style: ConstantStyles.textStyle),
            Text("Город: ${company.city}", style: ConstantStyles.textStyle),
            Text("Улица: ${company.street}", style: ConstantStyles.textStyle),
            Text("Дом: ${company.house.toString()}",
                style: ConstantStyles.textStyle),
            Text("Географическая широта: ${company.latitude.toString()}",
                style: ConstantStyles.textStyle),
            Text("Географическая долгота:${company.longitude.toString()}",
                style: ConstantStyles.textStyle),
          ]),
        ],
      ),
    );
  }
}
