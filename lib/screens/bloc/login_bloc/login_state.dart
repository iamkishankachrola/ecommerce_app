class LoginState {}
class LoginInitialState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginLoadedState extends LoginState{
  Map<String,dynamic> loginUserData;
  LoginLoadedState({required this.loginUserData});
}
class LoginErrorState extends LoginState{
  String errorMsg;
  LoginErrorState({required this.errorMsg});
}