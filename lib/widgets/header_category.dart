import 'package:flutter/material.dart';

class HeaderCategory extends StatefulWidget {
  @override
  _HeaderCategoryState createState() => _HeaderCategoryState();
}

class _HeaderCategoryState extends State<HeaderCategory> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        /*MediaQuery.of(context).size.height * 0.3,*/
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Category',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
              Text(
                'See All',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
