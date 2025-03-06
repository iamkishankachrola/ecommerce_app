abstract class CountEvent{}
class DecrementCountEvent extends CountEvent{
  Map<String,dynamic> bodyParams;
  DecrementCountEvent({required this.bodyParams});
}