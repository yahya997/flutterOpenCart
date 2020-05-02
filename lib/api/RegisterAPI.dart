
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_open_cart/utilities/api_utilities.dart';

class RegisterAPI {

  Future<bool> register(String userName, String email , String password ) async {
    String authApi = base_api + register_api;
    Map<String,String> headers = {
      "Accept" : "application/json",
      "X-Oc-Session" : "9c8bc70a8d727d8ec7427997aab296dd",
      "X-Oc-Merchant-Id":"123"
    };
    Map<String,String> data = {
      "firstname": userName,
      "lastname": "User",
      "email": email,
      "password": password,
      "confirm": password,
      "telephone": "1-541-754-3010",
      "fax": "1-541-754-3010",
      "company_id": "string",
      "company": "string",
      "city": "Berlin",
      "address_1": "Demo",
      "address_2": "Demo",
      "country_id": "81",
      "postcode": "3333",
      "zone_id": "1256",
      "tax_id": "1",
      "customer_group_id": "1",
      "agree": "1"
    };
    var body = json.encode(data);
    var response = await http.post( authApi , headers: headers , body: body );

    if( response.statusCode == 200 ){
      try{
        var jsonData = jsonDecode( response.body);
        var data = jsonData['success'];
        bool token =false;
       /* if(data == 1)
          token = true;*/
       /* WidgetsFlutterBinding.ensureInitialized();
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setBool('token', token);*/
        print(data);


        return true;
      }catch( Exception ){
        return false;
      }

    }

    return false;
  }

}