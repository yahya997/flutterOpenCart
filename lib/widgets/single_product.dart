import 'package:flutter/material.dart';
import 'package:flutter_open_cart/model/product_model.dart';
import 'package:flutter_open_cart/screens/detailsProduct.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SingleProduct extends StatefulWidget {
  ProductModel productModel;

  SingleProduct(this.productModel);

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 220,
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailsProduct(widget.productModel);
          }));
        },
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    child: Image.network(
                      widget.productModel.thumb,
                      fit: BoxFit.cover,
                    ),
                    width: 150,
                    height: 150,
                  ),
                  Transform.translate(
                    child: IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          size: 25,
                        ),
                        onPressed: () {}),
                    offset: Offset(100, 0),
                  ),
                ],
              ),
              Text(
                widget.productModel.name,
                maxLines: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    widget.productModel.price,
                    maxLines: 1,
                    style: TextStyle(color: Colors.blue),
                  ),
                  RatingBar(
                    ignoreGestures: true,
                    itemSize: 15,
                    initialRating: double.parse(widget.productModel.rating),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
