import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/Auth/Persention/view/Screen/login/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loginbody(),
      appBar: AppBar(
        automaticallyImplyLeading: false,

        leadingWidth: 200.w,
        backgroundColor: Colors.white,
      ),
    );
  }
}
