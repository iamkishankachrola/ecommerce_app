import 'package:ecommerce_app/data/remote/app_exception.dart';
import 'package:ecommerce_app/screens/bloc/register_bloc/register_event.dart';
import 'package:ecommerce_app/screens/bloc/register_bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/ecommerce_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>{
  EcommerceRepository ecommerceRepository;
  RegisterBloc({required this.ecommerceRepository}) : super(RegisterInitialState()){
    on<RegisterUserEvent>((event, emit) async{
      emit(RegisterLoadingState());
      try{
        var userData = await ecommerceRepository.registerUser(bodyParams: event.bodyParams);
        if(userData["status"]){
          emit(RegisterLoadedState(registerUserData: userData));
        }else{
          emit(RegisterErrorState(errorMsg: userData["message"]));
        }
      }catch(e){
        emit(RegisterErrorState(errorMsg: (e as AppException).toErrorMsg()));
      }
    });

  }
}