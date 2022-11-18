import 'dart:ui';
import 'package:auth_ui/pages/homepage/drawheader.dart';
import 'package:auth_ui/core/component/app_text_field.dart';
import 'package:auth_ui/core/route/app_route_name.dart';
import 'package:auth_ui/core/theme/app_color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreen();
}

int index = 1;

class _HomePageScreen extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomePageScreen>(
      stream: null,
      builder: ((context, snapshot) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Color.fromRGBO(30, 86, 160, 1),
          drawer: DrawHeader(),
          appBar: AppBar(
            title: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 80, maxWidth: 200),
                child: Image.asset("assets/logo_home.png")),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            children: [
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  height: 80,
                  width: 2000,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/ver8_ic.png"),
                        ),
                        RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Xin chào cư dân Khôi Phạm \n",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .button
                                    ?.copyWith(color: AppColor.white),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRouteName.register,
                                    );
                                  },
                              ),
                              TextSpan(
                                  text: "S603 - 1617",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button
                                      ?.copyWith(color: AppColor.white)),
                            ])),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.white,
                        ),
                        //cac tinh nang khac
                        Dashboard(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
