abstract class CartEvent{}
class AddToCartEvent extends CartEvent{
  Map<String,dynamic> bodyParams;
  AddToCartEvent({required this.bodyParams});
}