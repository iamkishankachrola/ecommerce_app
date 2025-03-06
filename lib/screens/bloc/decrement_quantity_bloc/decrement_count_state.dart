abstract class DecrementCountState{}
class DecrementCountInitialState extends DecrementCountState{}
class DecrementCountLoadingState extends DecrementCountState{}
class DecrementCountLoadedState extends DecrementCountState{
  Map<String,dynamic> decrementCountData;
  DecrementCountLoadedState({required this.decrementCountData});
}
class DecrementCountErrorState extends DecrementCountState{
  String errorMsg;
  DecrementCountErrorState({required this.errorMsg});
}