import '../remote/api_helper.dart';
import '../remote/urls.dart';

class EcommerceRepository{
  ApiHelper apiHelper;
  EcommerceRepository({required this.apiHelper});

  //Register User
  Future<dynamic> registerUser({required Map<String,dynamic> bodyParams}) async{
    try {
      return await apiHelper.postAPI(AppUrls.REGISTRATION_URL,bodyParams: bodyParams,isHeaderRequired: false);
    } catch (e) {
      rethrow;
    }
  }

  //Login User
  Future<dynamic> loginUser({required Map<String,dynamic> bodyParams}) async{
    try {
      return await apiHelper.postAPI(AppUrls.LOGIN_URL,bodyParams: bodyParams,isHeaderRequired: false);
    } catch (e) {
      rethrow;
    }
  }

  //Products
  Future<dynamic> products() async{
    try {
      return await apiHelper.postAPI(AppUrls.PRODUCTS_URL);
    } catch (e) {
      rethrow;
    }
  }

  //Categories
  Future<dynamic> categories() async{
    try {
      return await apiHelper.getAPI(AppUrls.CATEGORIES_URL);
    } catch (e) {
      rethrow;
    }
  }

  //Add To Cart
  Future<dynamic> addToCart({required Map<String,dynamic> bodyParams}) async{
    try {
      return await apiHelper.postAPI(AppUrls.ADD_TO_CART_URL,bodyParams: bodyParams);
    } catch (e) {
      rethrow;
    }
  }

  //View Cart
  Future<dynamic> viewCart() async{
    try {
      return await apiHelper.getAPI(AppUrls.VIEW_CART_URL);
    } catch (e) {
      rethrow;
    }
  }

  //Decrement Count
  Future<dynamic> decrementCount({required Map<String,dynamic> bodyParams}) async{
    try {
      return await apiHelper.postAPI(AppUrls.DECREMENT_QUANTITY_URL,bodyParams: bodyParams);
    } catch (e) {
      rethrow;
    }
  }

  //Create Order
  Future<dynamic> createOrder() async{
    try {
      return await apiHelper.postAPI(AppUrls.CREATE_ORDER_URL);
    } catch (e) {
      rethrow;
    }
  }

  //Get Order
  Future<dynamic> getOrder() async{
    try {
      return await apiHelper.postAPI(AppUrls.GET_ORDER_URL);
    } catch (e) {
      rethrow;
    }

    }

}