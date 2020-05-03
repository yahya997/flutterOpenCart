import 'package:equatable/equatable.dart';
import 'package:flutter_open_cart/model/product_latest_model.dart';
import 'package:meta/meta.dart';

abstract class ProductLatestState extends Equatable{}

class ProductLatestLoading extends ProductLatestState{
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ProductLatestLoaded extends ProductLatestState {
  final List<ProductLatestModel> products;

  ProductLatestLoaded({@required this.products});

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ProductLatestLoadFailure extends ProductLatestState {
  final String message;

  ProductLatestLoadFailure({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class NoProductLatestFound extends ProductLatestState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}