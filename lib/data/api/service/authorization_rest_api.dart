import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/domain/models/user.dart';
import 'config.dart';

class AuthorizationRestApi{
  final String baseUrl = Config.baseUrl;
  final String additionUrl = Config.additionUrlAuthorization;

  Future<int> authorize(User user) async{
    try{
      var response = await http.post(
        Uri.http(baseUrl,additionUrl),
        body: json.encode(user),
        headers: { HttpHeaders.contentTypeHeader: 'application/json'}
      );
      return response.statusCode;
    }
    catch(error){
      debugPrint(error.toString());
      rethrow;
    }
  }
}