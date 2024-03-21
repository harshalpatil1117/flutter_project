import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const LocalStorage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(child: Lottie.asset('assets/lottie/splash_note.json')),
    );
  }
}