import 'package:ecommerce_app/data/repository/ecommerce_repository.dart';
import 'package:ecommerce_app/screens/bloc/create_order_bloc/create_order_event.dart';
import 'package:ecommerce_app/screens/bloc/create_order_bloc/create_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent,CreateOrderState>{
  EcommerceRepository ecommerceRepository;
  CreateOrderBloc({required this.ecommerceRepository}) : super(CreateOrderInitialState()){
    on<CreateOrderEvent>((event, emit) async{
      emit(CreateOrderLoadingState());
      try{
        var orderData = await ecommerceRepository.createOrder();
        if(orderData["status"]){
          emit(CreateOrderLoadedState(orderData: orderData));
        }else{
          emit(CreateOrderErrorState(errorMsg: orderData["message"]));
        }
      }catch(e){
        emit(CreateOrderErrorState(errorMsg: e.toString()));
      }
    },);
  }
}