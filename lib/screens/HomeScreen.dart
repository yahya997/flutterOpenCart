import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_open_cart/api/categoryAPI.dart';
import 'package:flutter_open_cart/api/productLatestAPI.dart';
import 'package:flutter_open_cart/bloc/product_latest_bloc/product_latest_bloc.dart';
import 'package:flutter_open_cart/bloc/product_latest_bloc/product_latest_event.dart';
import 'package:flutter_open_cart/bloc/product_latest_bloc/product_latest_state.dart';
import 'package:flutter_open_cart/model/categoryModel.dart';
import 'package:flutter_open_cart/model/product_latest_model.dart';
import 'package:flutter_open_cart/shared_ui/navigation_drawer.dart';
import 'package:flutter_open_cart/utilities/Common.dart';
import 'package:flutter_open_cart/widgets/header_category.dart';
import 'package:flutter_open_cart/widgets/header_product.dart';
import 'package:flutter_open_cart/widgets/single_category.dart';
import 'package:flutter_open_cart/widgets/single_product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double scrHeight, scrWidth;
  CategoryAPI categoryAPI = CategoryAPI();
  //ProductLatestAPI productLatestAPI = ProductLatestAPI();
  ProductLatestBloc productLatestBloc;

  @override
  void initState() {
    super.initState();
    productLatestBloc = BlocProvider.of<ProductLatestBloc>(context);
    productLatestBloc.add(FetchProductLatest());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Shop"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderCategory(),
            SizedBox(height: 10),
            _drawCategory(),
            _buildProductLatest(),
          //  _drawPopularProducts(),
          ],
        ),
      ),
    );
  }

  Widget _drawCategory() {
    return FutureBuilder(
        future: categoryAPI.fetchAllCategories(),
        // ignore: missing_return
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return loading();
              break;
            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.none:
              return connectionError();
              break;
            case ConnectionState.done:
              if (snapShot.error != null) {
                return error(snapShot.error);
              } else {
                List<CategoryModel> categoryList = snapShot.data;
                return Container(
                  width: double.infinity,
                  height: 150,
                  child: ListView.builder(
                    itemBuilder: (context, position) {
                      return SingleCategory(categoryList[position]);
                    },
                    itemCount: categoryList.length,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
              break;
          }
        });
  }

  Widget _buildProductLatest() {
    return BlocBuilder<ProductLatestBloc,ProductLatestState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is ProductLatestLoading) {
          return loading();
        } else if (state is ProductLatestLoaded) {
          return drawProductLatest(state.products);
        } else if (state is ProductLatestLoadFailure) {
          return buildErrorUi(state.message);
        }
      },

    );
  }

  Widget drawProductLatest(List<ProductLatestModel> products) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderProduct("Special Products"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SingleProduct(products[9]),
              SingleProduct(products[8]),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SingleProduct(products[7]),
              SingleProduct(products[6]),
            ],
          ),
        ],
      ),
    );
  }



  /*Widget _drawPopularProducts() {
    return FutureBuilder(
      future: productLatestAPI.fetchAllLatestProduct(),
      // ignore: missing_return
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return connectionError();
            break;
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.done:
            if (snapshot.error != null) {
              return error(snapshot.error);
            } else {
              List<ProductModel> latestList = snapshot.data;
              print(latestList.length);
              ProductModel productModel = snapshot.data[6];
              ProductModel productMode2 = snapshot.data[5];
              ProductModel productMode3 = snapshot.data[7];
              ProductModel productMode4 = snapshot.data[9];
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HeaderProduct("Popular Products"),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SingleProduct(productModel),
                        SingleProduct(productMode2),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SingleProduct(productMode3),
                        SingleProduct(productMode4),
                      ],
                    ),
                  ],
                ),
              );
            }
            break;
        }
      },
    );
  }*/


}
