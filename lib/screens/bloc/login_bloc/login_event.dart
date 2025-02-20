abstract class LoginEvent{}
class LoginUserEvent extends LoginEvent{
  Map<String,dynamic> bodyParams;
  LoginUserEvent({required this.bodyParams});
}