import '../../../data/local/model/get_order_model.dart';

abstract class GetOrderState{}
class GetOrderInitialState extends GetOrderState{}
class GetOrderLoadingState extends GetOrderState{}
class GetOrderLoadedState extends GetOrderState{
  GetOrderModel getOrderModel;
  GetOrderLoadedState({required this.getOrderModel});
}
class GetOrderErrorState extends GetOrderState{
  String errorMsg;
  GetOrderErrorState({required this.errorMsg});

}