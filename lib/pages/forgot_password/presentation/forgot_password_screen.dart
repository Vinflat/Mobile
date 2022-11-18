import 'package:auth_ui/core/component/app_text_field.dart';
import 'package:auth_ui/core/route/app_route_name.dart';
import 'package:auth_ui/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              width: MediaQuery.of(context).size.width,
              height: 450,
              fit: BoxFit.contain,
              image: const AssetImage("assets/img_forgot_password.png"),
            ),
            Text(
              "Quên\nMật khẩu",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Hãy điền tài khoản email mà bạn đã đăng kí để lấy lại mật khẩu",
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: Colors.grey),
            ),
            const SizedBox(),
            const AppTextField(
              prefix: Icon(Icons.alternate_email_rounded),
              hint: "Email",
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 64,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRouteName.resetPassword,
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text("Gửi"),
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
