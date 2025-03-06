import 'package:ecommerce_app/data/repository/ecommerce_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_to_cart_event.dart';
import 'add_to_cart_state.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  EcommerceRepository ecommerceRepository;
  CartBloc({required this.ecommerceRepository}) : super(CartInitialState()){
    on<AddToCartEvent>((event, emit) async {
      emit(CartLoadingState());
      try{
        var productsData = await ecommerceRepository.addToCart(bodyParams: event.bodyParams);
        if(productsData["status"] == true || productsData["status"] == "true"){
          emit(CartLoadedState(productStatus: productsData));
        }else{
          emit(CartErrorState(errorMsg: productsData["message"]));
        }
      }catch(e){
        emit(CartErrorState(errorMsg: e.toString()));
      }
    });
  }
}