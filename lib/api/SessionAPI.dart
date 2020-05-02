import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_open_cart/utilities/api_utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionAPI{
  Future<String> Session() async{

    String authApi = base_api + session_api;
    Map<String, String> headers = {
      "Accept": "application/json",
      "X-Oc-Merchant-Id": "123"
    };
    var response = await http.get(authApi, headers: headers);

    if (response.statusCode == 200) {
      try {
        var jsonData = jsonDecode(response.body);
        var data = jsonData["data"];
        print(data['session']);

        WidgetsFlutterBinding.ensureInitialized();
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('session', data['session']);
        //go to login

        return data['session'];
      } catch (Exception) {
        print(Exception.toString());
      }
    } else {
      print("failed");

    }
  }
}