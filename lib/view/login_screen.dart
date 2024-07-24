import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter MVVM"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(fontSize: 30),
      ),
      body: Center(child: InkWell(
          onTap: (){
          //  Utils.toastMessage("No Internet connection");
            Utils.flushBarErrorMessage("No Internet connection",context);
            Utils.showSnackBar("No Internet connection",context);
            Navigator.pushNamed(context, RoutesName.home);
          },
          child: Text("Login Screen"))),
    );
  }
}
