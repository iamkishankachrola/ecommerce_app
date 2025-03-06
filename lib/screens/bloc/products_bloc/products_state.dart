import 'package:ecommerce_app/data/local/model/products_model.dart';

abstract class ProductsState{}
class ProductsInitialState extends ProductsState{}
class ProductsLoadingState extends ProductsState{}
class ProductsLoadedState extends ProductsState{
  List<DataModel> productsList;
  ProductsLoadedState({required this.productsList});
}
class ProductsErrorState extends ProductsState{
  String errorMsg;
  ProductsErrorState({required this.errorMsg});
}