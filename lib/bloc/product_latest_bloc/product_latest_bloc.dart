import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_open_cart/bloc/product_latest_bloc/product_latest_event.dart';
import 'package:flutter_open_cart/bloc/product_latest_bloc/product_latest_state.dart';
import 'package:flutter_open_cart/model/product_latest_model.dart';
import 'package:flutter_open_cart/repositories/product_repository.dart';
import 'package:meta/meta.dart';

class ProductLatestBloc extends Bloc<ProductLatestEvent,ProductLatestState>{
  ProductRepository productRepository;


  ProductLatestBloc({@required this.productRepository});

  List<ProductLatestModel> list;

  @override
  // TODO: implement initialState
  ProductLatestState get initialState => ProductLatestLoading();

  @override
  Stream<ProductLatestState> mapEventToState(ProductLatestEvent event) async*{
    if (event is FetchProductLatest) {
      yield* mapFetchProductsToEvent(event);
    }
  }

  Stream<ProductLatestState> mapFetchProductsToEvent(FetchProductLatest event) async* {
    yield ProductLatestLoading();
    try {
      list = await productRepository.fetchAllLatestProduct();
      yield ProductLatestLoaded(products: list);
    } catch (e) {
      yield ProductLatestLoadFailure(message: e.toString());
    }
  }

}