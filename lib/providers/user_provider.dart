import 'package:flutter/material.dart';
import 'package:flutter_many_functions/models/responses/bad_response.dart';
import 'package:flutter_many_functions/models/responses/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UserProvider extends ChangeNotifier {

  UserProvider();

  String _domain = 'utadeo-apps-load-balancing-2034895534.us-east-1.elb.amazonaws.com';

  final Map<String, String> _headers = {
    "Content-Type" : "application/json", 
    "Accept": "application/json"
  };

  User userCreated = User();
  BadResponse error = BadResponse();

  User userLogged = User();



  login(Map<String, String> user) async {

    Uri url = Uri.http(_domain, '/v1/user/login');

    final response = await http.post(
      url, 
      body: json.encode(user), 
      headers: _headers
    );

    print(response.statusCode);

    if(response.statusCode == 200){

      Response data = Response.fromJson(json.decode(response.body));
      userLogged = data.data!;
      userCreated = User();
      
      error = BadResponse();

    }else{

      error = BadResponse.fromJson(json.decode(response.body));

    }

    notifyListeners();

  }

  createUser(Map<String, String> user) async {

    Uri url = Uri.http(_domain, '/v1/user/sign-up');

    final response = await http.post(url, body: user);

    Response data = Response.fromJson(json.decode(response.body));

    userCreated = data.data!;

    notifyListeners();

  }
}