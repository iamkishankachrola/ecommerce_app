import '../../../data/local/model/view_cart_model.dart';

abstract class ViewCartState{}
class ViewCartInitialState extends ViewCartState{}
class ViewCartLoadingState extends ViewCartState{}
class ViewCartLoadedState extends ViewCartState{
    ViewCartModel viewCartList;
    ViewCartLoadedState({required this.viewCartList});
}
class ViewCartErrorState extends ViewCartState{
  String errorMsg;
  ViewCartErrorState({required this.errorMsg});
}
class ViewCartEmptyState extends ViewCartState{}