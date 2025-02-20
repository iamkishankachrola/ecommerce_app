abstract class RegisterEvent {}
class RegisterUserEvent extends RegisterEvent{
  Map<String,dynamic> bodyParams;
  RegisterUserEvent({required this.bodyParams});
}