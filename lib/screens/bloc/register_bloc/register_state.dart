class RegisterState{}
class RegisterInitialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterLoadedState extends RegisterState{
    Map<String,dynamic> registerUserData;
    RegisterLoadedState({required this.registerUserData});
}
class RegisterErrorState extends RegisterState{
  String errorMsg;
  RegisterErrorState({required this.errorMsg});
}