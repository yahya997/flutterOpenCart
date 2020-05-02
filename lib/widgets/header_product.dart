import 'package:flutter/material.dart';

class HeaderProduct extends StatefulWidget {
  String title;

  HeaderProduct(this.title);

  @override
  _HeaderProductState createState() => _HeaderProductState();
}

class _HeaderProductState extends State<HeaderProduct> {
  TextStyle headerTitle =
  TextStyle(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.title,
                style: headerTitle,
              ),
              Text(
                "See All",
                style: headerTitle,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
