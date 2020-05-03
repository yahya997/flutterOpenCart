import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_open_cart/model/product_latest_model.dart';
import 'package:flutter_open_cart/utilities/api_utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductLatestAPI {
  Future<List<ProductLatestModel>> getAllLatestProduct() async {
  //  List<ProductModel> latestList = List<ProductModel>();
    String allAuthorsApi = base_api + latest_api;

    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String session = prefs.getString('session');

    Map<String, String> headers = {
      "Accept": "application/json",
      "X-Oc-Session": session,
      "X-Oc-Merchant-Id": "123"
    };
    var response = await http.get(allAuthorsApi, headers: headers);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      print(response.statusCode);
      List<ProductLatestModel> latestList =ProductLatestModelList.fromJson(data).products;
      return latestList;
    }else{
      throw Exception();
    }
  }
}
