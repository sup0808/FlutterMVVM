import 'package:flutter/material.dart';
import 'package:flutter_mvvm/res/components/round_button.dart';
import 'package:flutter_mvvm/utils/routes/routes.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';
import 'package:provider/provider.dart';

import '../viewmodel/auth_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  final ValueNotifier<bool> _obscureText = ValueNotifier(false);

  @override
  void dispose() {

    super.dispose();
    emailCtr.dispose();
    passwordCtr.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    _obscureText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewmodel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(fontSize: 25),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailCtr,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocus,
              decoration: const InputDecoration(
                hintText: 'Enter the emailid',
                labelText: 'Email Id',
                prefixIcon: Icon(Icons.email_rounded),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(context, emailFocus, passwordFocus);
              },
            ),
            SizedBox(height: 20),
            ValueListenableBuilder(
                valueListenable: _obscureText,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordCtr,
                    focusNode: passwordFocus,
                    obscureText: _obscureText.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        hintText: 'Enter the password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_open_outlined),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obscureText.value = !_obscureText.value;
                            },
                            child: Icon(_obscureText.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility))),
                  );
                }),
            SizedBox(height: height * .1),
            RoundButton(
                title: "Login",
                loading: authViewModel.loading,
                onPress: () {
                  if (emailCtr.text.isEmpty) {
                    Utils.flushBarErrorMessage("Please enter email", context);
                  } else if (passwordCtr.text.isEmpty) {
                    Utils.flushBarErrorMessage("Please enter password", context);
                  }
                  else if (passwordCtr.text.length<6) {
                    Utils.flushBarErrorMessage("Please enter 6 digit password", context);
                  }
                  else{
                    Map data = { // for testing api call
                      "email": emailCtr.text.toString(), //eve.holt@reqres.in
                      "password": passwordCtr.text.toString() //cityslicka
                    };
                    Utils.flushBarErrorMessage("Api call", context);
                    authViewModel.loginApi(data,context);
                  }
                })
          ],
        ),
      ),
    );
  }
}
