import 'package:auth_ui/pages/homepage/homepage.dart';
import 'package:auth_ui/pages/otp/otpScreen.dart';
import 'package:auth_ui/pages/register/presentation/register_screen.dart';
import 'package:auth_ui/pages/wallet/wallet_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

int index = 1;

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(30, 86, 160, 0.75),
        color: Colors.white70,
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.wallet, color: Color.fromRGBO(30, 86, 160, 1)),
          Icon(Icons.home_rounded, color: Color.fromRGBO(30, 86, 160, 1)),
          Icon(Icons.notifications, color: Color.fromRGBO(30, 86, 160, 1))
        ],
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
      body: Container(
        child: getSelectedWidget(index: index),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const WalletScreen();
        break;
      case 1:
        widget = const HomePageScreen();
        break;
      default:
        widget = const RegisterScreen();
        break;
    }
    return widget;
  }
}
