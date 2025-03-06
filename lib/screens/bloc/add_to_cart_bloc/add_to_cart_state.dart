abstract class CartState{}
class CartInitialState extends CartState{}
class CartLoadingState extends CartState{}
class CartLoadedState extends CartState{
  Map<String,dynamic> productStatus;
  CartLoadedState({required this.productStatus});
}
class CartErrorState extends CartState{
  String errorMsg;
  CartErrorState({required this.errorMsg});
}