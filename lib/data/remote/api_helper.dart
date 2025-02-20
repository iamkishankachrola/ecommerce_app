import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

class ApiHelper{
  Future<dynamic> postAPI(String url, {Map<String, dynamic>? bodyParams}) async{
    var uri = Uri.parse(url);
    try {
      var response = await http.post(uri, body: bodyParams!=null ? jsonEncode(bodyParams) : null);
      return returnDataResponse(response);
    } on SocketException{
      /// internet error
      throw FetchDataException(body: "Internet Error");
    }
  }
  dynamic returnDataResponse(http.Response res){
    switch(res.statusCode){
      case 200:
      ///status ok
        var mData = jsonDecode(res.body);
        return mData;
      case 400:
        throw BadRequestException(body: res.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(body: res.body.toString());
      case 500:
      default:
        throw FetchDataException(
            body: 'Error occurred while Communication with Server with StatusCode : ${res.statusCode}');
    }
  }
}