class DataModel{
  String? id;
  String? name;
  String? price;
  String? image;
  String? catId;
  String? status;
  String? createdAt;
  String? updatedAt;

  DataModel(
      {required this.id,
        required this.name,
        required this.price,
        required this.image,
        required this.catId,
        required this.status,
        required this.createdAt,
        required this.updatedAt});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        catId: json["category_id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"]);
  }

}

class ProductsDataModel{
  bool? status;
  String? message;
  List<DataModel>? data;
  ProductsDataModel({required this.status,required this.message,required this.data});

  factory ProductsDataModel.fromJson(Map<String, dynamic> json) {
    List<DataModel> productsList = [];
    for(Map<String,dynamic> eachProduct in json["data"]){
      productsList.add(DataModel.fromJson(eachProduct));
    }
    return ProductsDataModel(
        status: json["status"],
        message: json["message"],
        data: productsList,
    );
  }
}