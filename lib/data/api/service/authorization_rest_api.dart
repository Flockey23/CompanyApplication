import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/domain/models/user.dart';


class AuthorizationRestApi{
  String baseURL = '192.168.31.218:8080';
  String additionURL = 'api/auth/signin';

  Future<int> authorize(User user) async{
    try{
      var response = await http.post(
        Uri.http(baseURL,additionURL),
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