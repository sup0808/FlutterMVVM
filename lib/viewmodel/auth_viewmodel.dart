

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/repository/auth_repository.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';

class AuthViewmodel with ChangeNotifier{
  final authRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signuploading = false;
  bool get signuploading => _signuploading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignupLoading(bool value){
    _signuploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context)async{
    setLoading(true);
    authRepo.loginApi(data).then((value){
      setLoading(false);
      Utils.showSnackBar("Login Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }

    }).onError((error,stacktrace){
      setLoading(false);
      if(kDebugMode) {
        Utils.showSnackBar(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context)async{
    setLoading(true);
    authRepo.signupApi(data).then((value){
      setLoading(false);
      Utils.showSnackBar("Signup Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }

    }).onError((error,stacktrace){
      setLoading(false);
      if(kDebugMode) {
        Utils.showSnackBar(error.toString(), context);
        print(error.toString());
      }
    });
  }

}