import 'package:auth_ui/pages/homepage/homepage.dart';
import 'package:auth_ui/pages/login/presentation/login_screen.dart';
import 'package:auth_ui/pages/register/presentation/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawHeader extends StatefulWidget {
  const DrawHeader({super.key});

  @override
  State<DrawHeader> createState() => _DrawHeaderState();
}

class _DrawHeaderState extends State<DrawHeader> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromRGBO(30, 86, 160, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(email: "account@gmail.com", name: "Renter"),
            const SizedBox(height: 48),
            buildMenuItem(
                text: 'Thông tin căn hộ',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 0)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Đổi mật khẩu',
                icon: Icons.lock_outline,
                onClicked: () => selectedItem(context, 1)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Chính sách bảo vệ quyền riêng tư',
                icon: Icons.assignment_outlined,
                onClicked: () => selectedItem(context, 2)),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Chính sách bảo mật thanh toán',
              icon: Icons.payment_outlined,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 24),
            Divider(
              color: Colors.white70,
            ),
            const SizedBox(height: 24),
            buildMenuItem(
                text: 'Đăng xuất',
                icon: Icons.logout_outlined,
                onClicked: () => selectedItem(context, 4)),
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  final hovercolor = Colors.white70;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(
      text,
      style: TextStyle(color: color, fontSize: 13),
    ),
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => RegisterScreen()));
      break;
    case 1:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => RegisterScreen()));
      break;
    case 2:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => RegisterScreen()));
      break;
    case 3:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => RegisterScreen()));
      break;
    case 4:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}

Widget buildHeader({
  required String name,
  required String email,
}) =>
    InkWell(
      child: Container(
        color: Colors.white.withOpacity(0.25),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Row(
          children: [
            CircleAvatar(
                radius: 30, backgroundImage: AssetImage("assets/avatar.jpg")),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
