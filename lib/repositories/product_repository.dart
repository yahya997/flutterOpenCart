import 'package:flutter_open_cart/api/productLatestAPI.dart';
import 'package:flutter_open_cart/model/product_latest_model.dart';
import 'package:meta/meta.dart';

class ProductRepository{
  ProductLatestAPI productLatestAPI;

  ProductRepository({@required this.productLatestAPI});

  Future<List<ProductLatestModel>> fetchAllLatestProduct() async{
    return await productLatestAPI.getAllLatestProduct();
  }

}