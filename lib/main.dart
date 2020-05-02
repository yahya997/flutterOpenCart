
import 'package:flutter/material.dart';
import 'package:flutter_open_cart/api/SessionAPI.dart';
import 'package:flutter_open_cart/utilities/AppTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/HomeScreen.dart';
import 'screens/Login.dart';

void main() async {
  Widget _screen;

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String session = prefs.getString('session');
  bool isLogin = prefs.getBool('isLogin');

  print(session);

  if (isLogin != null && isLogin) {
    // go to home
    print("1");
    _screen = HomeScreen();
  } else if (session != null) {
    // go to login
    _screen = Login();
    print("2");
  } else if (session == null) {
    // get session
    SessionAPI sessionAPI = new SessionAPI();
    sessionAPI.Session();
    print("3");
    _screen = Login();
  }

  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
  Widget _screen;

  MyApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: _screen,
    );
  }
}
