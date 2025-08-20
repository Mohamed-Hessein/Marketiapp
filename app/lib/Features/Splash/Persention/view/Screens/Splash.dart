import 'package:flutter/material.dart';
import 'package:app/Features/Splash/Persention/view/Screens/splach_body.dart';
import 'package:animate_do/animate_do.dart';

class Splash extends StatelessWidget {
  Splash({super.key});
  Function(AnimateDoDirection)? fun;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SplachBody());
  }
}
