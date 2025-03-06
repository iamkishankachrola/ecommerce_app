import 'package:ecommerce_app/data/repository/ecommerce_repository.dart';
import 'package:ecommerce_app/screens/bloc/categories_bloc/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/remote/app_exception.dart';
import 'categories_event.dart';

class CategoriesBloc extends Bloc<CategoriesEvent,CategoriesState>{
  EcommerceRepository ecommerceRepository;
  CategoriesBloc({required this.ecommerceRepository}) : super(CategoriesInitialState()){
    on<ShowCategoriesEvent>((event, emit) async{
      emit(CategoriesLoadingState());
      try{
        var categoriesData = await ecommerceRepository.categories();
        if(categoriesData["status"]){
          emit(CategoriesLoadedState(categoriesList: categoriesData["data"]));
        }else{
          emit(CategoriesErrorState(errorMsg: categoriesData["message"]));
        }
      }catch(e){
        emit(CategoriesErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }
    },);
  }
}