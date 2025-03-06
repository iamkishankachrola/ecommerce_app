class CreateOrderState{}
class CreateOrderInitialState extends CreateOrderState{}
class CreateOrderLoadingState extends CreateOrderState{}
class CreateOrderLoadedState extends CreateOrderState{
  Map<String,dynamic> orderData;
  CreateOrderLoadedState({required this.orderData});
}
class CreateOrderErrorState extends CreateOrderState{
  String errorMsg;
  CreateOrderErrorState({required this.errorMsg});
}