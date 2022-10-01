// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../constantStyles.dart';
import '../../domain/models/company.dart';

class ShowDetailsCompany extends StatelessWidget {
  const ShowDetailsCompany({super.key});

  @override
  Widget build(BuildContext context) {
    final company = ModalRoute.of(context)!.settings.arguments as Company;
    return Scaffold(
      appBar: AppBar(
      title: Text("Просмотр ${company.title}"),
    ),
      body: showDetailsForm(company),
    );
  }

  Widget showDetailsForm(Company company) {
    return Container(decoration: const BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.green, Colors.blue])
  ),
      child: ListView(children: [
      Text("Название: ${company.title}",
          style: ConstantStyles.textStyle),
      Text("ФИО конт.лица: ${company.fioContact}",
          style: ConstantStyles.textStyle),
      Text("Телефон: ${company.phone.toString()}",
          style: ConstantStyles.textStyle),
      Text("Электронная почта: ${company.email}",
          style: ConstantStyles.textStyle),
      Text("Сайт: ${company.site}",
          style: ConstantStyles.textStyle),
      Text("Почтовый индекс: ${company.postcode.toString()}",
          style: ConstantStyles.textStyle),
      Text("Город: ${company.city}",
          style: ConstantStyles.textStyle),
      Text("Улица: ${company.street}",
          style: ConstantStyles.textStyle),
      Text("Дом: ${company.house.toString()}",
          style: ConstantStyles.textStyle),
      Text("Географическая широта: ${company.latitude.toString()}",
          style: ConstantStyles.textStyle),
      Text("Географическая долгота:${company.longitude.toString()}",
          style: ConstantStyles.textStyle),
  ],
      ),
    );
  }
}
