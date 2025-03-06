class CartDataModel{
  int? id;
  int? product_id;
  String? name;
  String? price;
  int? quantity;
  String? image;

  CartDataModel({
    required this.id, required this.product_id, required this.name, required this.price, required this.quantity, required this.image,
});
  factory CartDataModel.fromJson(Map<String, dynamic> json){
    return CartDataModel(
      id: json["id"],
      product_id: json["product_id"],
      name: json["name"],
      price: json["price"],
      quantity: json["quantity"],
      image: json["image"],
    );
  }
}

class ViewCartModel{
  bool? status;
  String? message;
  List<CartDataModel>? data;
  ViewCartModel({required this.status, required this.message, required this.data});
  factory ViewCartModel.fromJson(Map<String, dynamic> json){
    List<CartDataModel> data = [];
    for(Map<String,dynamic> eachData in json["data"]){
      data.add(CartDataModel.fromJson(eachData));
    }
    return ViewCartModel(
      status: json["status"],
      message: json["message"],
      data: data,
    );
  }
}