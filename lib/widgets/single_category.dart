import 'package:flutter/material.dart';
import 'package:flutter_open_cart/model/categoryModel.dart';

class SingleCategory extends StatefulWidget {
  CategoryModel categoryModel;


  SingleCategory(this.categoryModel);

  @override
  _SingleCategoryState createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue,
              ),
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(widget.categoryModel.image)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              widget.categoryModel.name,
              style: new TextStyle(fontSize: 14.0, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
