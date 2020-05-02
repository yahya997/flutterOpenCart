import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_open_cart/utilities/api_utilities.dart';

class AuthenticationAPI {
  Future<bool> login(String email, String password) async {
    String authApi = base_api + auth_api;

    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String session =  prefs.getString('session');

    Map<String, String> headers = {
      "Accept": "application/json",
      "X-Oc-Session": session,
      "X-Oc-Merchant-Id": "123"
    };
    Map<String, String> data = {"email": email, "password": password};
    var body = json.encode(data);
    var response = await http.post(authApi, headers: headers, body: body);

    if (response.statusCode == 200) {
      try {

        WidgetsFlutterBinding.ensureInitialized();
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setBool('isLogin', true);


        print(response.statusCode.toString());

        return true;
      } catch (Exception) {
        return false;
      }
    } else {
      print("failed");
    }

    return false;
  }
}
