class ProductModel{
  int? id;
  String? name;
  int? quantity;
  String? price;
  String? image;

  ProductModel({required this.id, required this.name, required this.quantity, required this.price, required this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
        image: json["image"]);
  }
}
class OrdersModel{
  int? id;
  String? total_amount;
  String? order_number;
  String? status;
  String? created_at;
  List<ProductModel>? product;
  OrdersModel({required this.id, required this.total_amount, required this.order_number, required this.status, required this.created_at, required this.product});

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> productList = [ ];
    for(var eachProduct in json["product"]){
      productList.add(ProductModel.fromJson(eachProduct));
    }
    return OrdersModel(
        id: json["id"],
        total_amount: json["total_amount"],
        order_number: json["order_number"],
        status: json["status"],
        created_at: json["created_at"],
        product: productList);
  }

}

class GetOrderModel{
  bool? status;
  String? message;
  List<OrdersModel>? orders;
  GetOrderModel({required this.status, required this.message, required this.orders});
  factory GetOrderModel.fromJson(Map<String, dynamic> json) {
    List<OrdersModel>? ordersList = [ ];
    for(var eachOrder in json["orders"]){
      ordersList.add(OrdersModel.fromJson(eachOrder));
    }
    return GetOrderModel(
        status: json["status"],
        message: json["message"],
        orders: ordersList );
  }
}