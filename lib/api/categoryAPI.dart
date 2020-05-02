import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_open_cart/model/categoryModel.dart';
import 'package:flutter_open_cart/utilities/api_utilities.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoryAPI{

  Future<List<CategoryModel>> fetchAllCategories() async {
    List<CategoryModel> category = List<CategoryModel>();
    String allAuthorsApi = base_api + category_api;

    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String session =  prefs.getString('session');

    Map<String, String> headers = {
      "Accept": "application/json",
      "X-Oc-Session": session,
      "X-Oc-Merchant-Id": "123"
    };
    var response = await http.get(allAuthorsApi,headers: headers);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var item in data) {
        CategoryModel categoryModel = CategoryModel(
          item['category_id'].toString(),item['name'].toString(),item['image'].toString(),
          item['original_image'].toString());
        category.add(categoryModel);
      }
    }
    return category;
  }
}