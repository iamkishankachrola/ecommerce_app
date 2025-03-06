import 'package:ecommerce_app/data/repository/ecommerce_repository.dart';
import 'package:ecommerce_app/screens/bloc/decrement_quantity_bloc/decrement_count_event.dart';
import 'package:ecommerce_app/screens/bloc/decrement_quantity_bloc/decrement_count_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DecrementCountBloc extends Bloc<DecrementCountEvent,DecrementCountState>{
  EcommerceRepository ecommerceRepository;
  DecrementCountBloc({required this.ecommerceRepository}) : super(DecrementCountInitialState()){
    on<DecrementCountEvent>((event, emit) async{
      emit(DecrementCountLoadingState());
      try{
        var decrementCountData = await ecommerceRepository.decrementCount(bodyParams: event.bodyParams);
        print("DECREMENT COUNT DATA : $decrementCountData" );
        if(decrementCountData["status"]){
          emit(DecrementCountLoadedState(decrementCountData: decrementCountData));
        }else{
          emit(DecrementCountErrorState(errorMsg: decrementCountData["message"]));
        }
      }catch(e){
        emit(DecrementCountErrorState(errorMsg: e.toString()));
      }
    },);
  }
}