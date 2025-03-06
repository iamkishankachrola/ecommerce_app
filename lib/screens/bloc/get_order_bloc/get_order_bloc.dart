import 'package:ecommerce_app/data/repository/ecommerce_repository.dart';
import 'package:ecommerce_app/screens/bloc/get_order_bloc/get_order_event.dart';
import 'package:ecommerce_app/screens/bloc/get_order_bloc/get_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/local/model/get_order_model.dart';

class GetOrderBloc extends Bloc<GetOrderEvent, GetOrderState>{
  EcommerceRepository ecommerceRepository;
  GetOrderBloc({required this.ecommerceRepository}) : super(GetOrderInitialState()) {
    on<GetOrderInitialEvent>((event, emit) async{
      emit(GetOrderLoadingState());
      try{
        var orderData = await ecommerceRepository.getOrder();
        if(orderData["status"]){
          var getOrderModel = GetOrderModel.fromJson(orderData);
          emit(GetOrderLoadedState(getOrderModel: getOrderModel));
        }else{
          emit(GetOrderErrorState(errorMsg: orderData["message"]));
        }
      }catch(e){
        emit(GetOrderErrorState(errorMsg: e.toString()));
      }
    },);

  }
}