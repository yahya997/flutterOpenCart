import 'package:flutter/material.dart';


Widget connectionError() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text('Connection Error!!!!'),
  );
}

Widget error(var error) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text(error.toString()),
  );
}

Widget noData() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text('No Data Available!'),
  );
}

Widget loading() {
  return Container(
    padding: EdgeInsets.only(top: 16, bottom: 16),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}


// build Error UI
Widget buildErrorUi(String message) {
  return Center(
    child: Text(
      message,
      style: TextStyle(color: Colors.red),
    ),
  );
}


