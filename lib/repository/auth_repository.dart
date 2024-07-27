import 'package:flutter_mvvm/data/network/BaseApiService.dart';
import 'package:flutter_mvvm/data/network/NetworkApiservice.dart';
import 'package:flutter_mvvm/res/app_url.dart';

class AuthRepository{
  BaseApiService apiService = Networkapiservice();

  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = apiService.getPostResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }

  }

  Future<dynamic> signupApi(dynamic data) async{
    try{
      dynamic response = apiService.getPostResponse(AppUrl.registerEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }

  }
}