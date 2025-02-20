import 'package:ecommerce_app/data/repository/ecommerce_repository.dart';
import 'package:ecommerce_app/screens/bloc/login_bloc/login_event.dart';
import 'package:ecommerce_app/screens/bloc/login_bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/remote/app_exception.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  EcommerceRepository ecommerceRepository;
  LoginBloc({required this.ecommerceRepository}) : super(LoginInitialState()){
    on<LoginUserEvent>((event, emit) async{
      emit(LoginLoadingState());
      try{
        var userData = await ecommerceRepository.loginUser(bodyParams: event.bodyParams);
        if(userData["status"]){
          emit(LoginLoadedState(loginUserData: userData));
        }else{
          emit(LoginErrorState(errorMsg: userData["message"]));
        }
      }catch(e){
        emit(LoginErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }
    });
  }
}