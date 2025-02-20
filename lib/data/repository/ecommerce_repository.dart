import '../remote/api_helper.dart';
import '../remote/urls.dart';

class EcommerceRepository{
  ApiHelper apiHelper;
  EcommerceRepository({required this.apiHelper});

  //Register User
  Future<dynamic> registerUser({required Map<String,dynamic> bodyParams}) async{
    try {
      return await apiHelper.postAPI(AppUrls.REGISTRATION_URL,bodyParams: bodyParams);
    } catch (e) {
      rethrow;
    }
  }

  //Login User
  Future<dynamic> loginUser({required Map<String,dynamic> bodyParams}) async{
    try {
      return await apiHelper.postAPI(AppUrls.LOGIN_URL,bodyParams: bodyParams);
    } catch (e) {
      rethrow;
    }
  }

}