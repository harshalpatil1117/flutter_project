import 'package:firebaseDemo_assets/firebaseBasic_assets.dart';
import 'package:firebase_demo_apk/login_screen/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    Future.delayed(const Duration(seconds: 3)).then(
          (value) => Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => const RegisterScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FirebaseDemoAssets.lottie.splashLottie.lottie(repeat: false,),
          ],
        ),
      ),
    );
  }
}
