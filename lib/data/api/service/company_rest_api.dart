import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../../../domain/models/company.dart';
import '../model/api_company.dart';
import 'config.dart';

class CompanyRestApi{
  final String baseUrl = Config.baseUrl;
  final String additionUrl = Config.additionUrlCompanies;

  Future<int> createCompany (Company company) async {
    try {
      var response = await http.post(
          Uri.http(baseUrl, additionUrl),
          body: json.encode(company),
          headers: { HttpHeaders.contentTypeHeader: 'application/json'});
      return response.statusCode;
    }
    catch(error){
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future<int> updateCompany(Company company) async {
    try {
      var response = await http.put(
          Uri.http(baseUrl, "$additionUrl/${company.id.toString()}"),
          body: json.encode(company),
          headers: { HttpHeaders.contentTypeHeader: 'application/json'});
      return response.statusCode;
    }
    catch(error){
      debugPrint(error.toString());
      rethrow;
    }
  }

  deleteSelectedCompanies(company) async{
    try {
      await http.delete(
          Uri.http(baseUrl, "$additionUrl/${company.id}"));
    }
    catch(error){
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future<List<Company>> getCompanyData() async {
    try {
      var response = await http.get(
          Uri.http(baseUrl, additionUrl),
          headers: {'Content-Type': 'application/json'});
      debugPrint(response.body.toString());
      var companies = json.decode(response.body);
      var companiesList = (companies as List).map((company) =>
          ApiCompany.fromJson(company)).toList();
      return companiesList;
    }
    catch(error){
      debugPrint(error.toString());
      rethrow;
    }
  }
}