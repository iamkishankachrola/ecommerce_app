import 'package:ecommerce_app/data/local/model/products_model.dart';
import 'package:ecommerce_app/data/remote/app_exception.dart';
import 'package:ecommerce_app/data/repository/ecommerce_repository.dart';
import 'package:ecommerce_app/screens/bloc/products_bloc/products_event.dart';
import 'package:ecommerce_app/screens/bloc/products_bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent,ProductsState>{
  EcommerceRepository ecommerceRepository;
  ProductsBloc({required this.ecommerceRepository}) : super(ProductsInitialState()){
    on<ShowProductsEvent>((event, emit) async{
      emit(ProductsLoadingState());
      try{
       var productsData = await ecommerceRepository.products();
       if(productsData["status"]){
         var productsModel = ProductsDataModel.fromJson(productsData);
         emit(ProductsLoadedState(productsList:productsModel.data!));
       }else{
         emit(ProductsErrorState(errorMsg: productsData["message"]));
       }
      }catch(e){
        emit(ProductsErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }
    });
  }
}