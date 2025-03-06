import 'package:ecommerce_app/data/repository/ecommerce_repository.dart';
import 'package:ecommerce_app/screens/bloc/view_cart_bloc/view_cart_event.dart';
import 'package:ecommerce_app/screens/bloc/view_cart_bloc/view_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/local/model/view_cart_model.dart';

class ViewCartBloc extends Bloc<CartEvent, ViewCartState>{
  EcommerceRepository ecommerceRepository;
  ViewCartBloc({required this.ecommerceRepository}) : super(ViewCartInitialState()){
    on<ViewCartEvent>((event, emit) async{
        emit(ViewCartLoadingState());
        try{
          var viewCartData = await ecommerceRepository.viewCart();
          print("VIEW CART DATA: $viewCartData");
          if(viewCartData["status"]){
            var viewCartModel = ViewCartModel.fromJson(viewCartData);
            emit(ViewCartLoadedState(viewCartList: viewCartModel));
          }else{
            if(viewCartData["message"] == "Cart data not found"){
              emit(ViewCartEmptyState());
            }else{
            emit(ViewCartErrorState(errorMsg: viewCartData["message"]));
          }
          }
        }catch(e){
          emit(ViewCartErrorState(errorMsg: e.toString()));
        }
    },);


  }
}