import 'dart:async';
import 'dart:ui';

import 'package:auth_ui/core/component/app_text_field.dart';
import 'package:auth_ui/core/route/app_route_name.dart';
import 'package:auth_ui/core/theme/app_color.dart';
import 'package:auth_ui/firebasse_authe/firebase_services.dart';
import 'package:auth_ui/model/Author.dart';
import 'package:auth_ui/model/Renter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisibile = false;

  StreamController<Renter> _renterController = StreamController();
  @override
  void dispose() {
    _renterController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
  



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LoginScreen>(
        stream: null,
        builder: (context, snapshot) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                bottom: MediaQuery.of(context).padding.bottom,
                left: 24,
                right: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    fit: BoxFit.contain,
                    image: const AssetImage("assets/login_tran_big.png"),
                  ),
                  Center(
                    child: Text("Vinflat",
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 74, 173, 1))),
                  ),
                  Center(
                    child: Text(
                      "Chào mừng quý cư dân",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.people_outlined),
                          labelText: "Tài khoản",
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                            return "Hãy nhập đúng tên đăng nhập";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        obscureText: !_isVisibile,
                        decoration: InputDecoration(
                          labelText: "Mật khẩu",
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisibile = !_isVisibile;
                                });
                              },
                              icon: _isVisibile
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'^[a-z A-Z]+[0-9]+$').hasMatch(value!)) {
                            return "Hãy nhập đúng password";
                          } else {
                            return null;
                          }
                        },
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouteName.forgotPassword,
                        );
                      },
                      child: const Text("Quên mật khẩu ?"),
                    ),
                  ),

                  //nut Login
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        print("LOGIN");
                        Navigator.pushNamed(context, AppRouteName.bottomMenu);
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      child: const Text("Đăng nhập"),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text("OR"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        await FirebaseServices().signInWithGoogle();
                        Navigator.pushNamed(
                          context,
                          AppRouteName.homepage,
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      icon: const Image(
                        image: AssetImage("assets/ic_google.png"),
                        width: 32,
                        height: 32,
                      ),
                      label: const Text("Login with Google"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Bạn chưa có tài khoản ? ",
                            style: Theme.of(context).textTheme.button,
                          ),
                          TextSpan(
                            text: "Đăng kí tại đây!",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: AppColor.primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                  context,
                                  AppRouteName.register,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            resizeToAvoidBottomInset: false,
          );
        });
  }
}
