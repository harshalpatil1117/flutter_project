import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../firstscreen/firstScreen.dart';
import '../second_screen/second_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  void initState() {
    // TODO: implement initState
    super.initState();
      Future.delayed(Duration(seconds: 2)).then(
            (value) => Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => value == null ? FirstScreen() : SecondScreen(otpController: '', phoneController: '',),),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 40.0,
                fontFamily: 'Canterbury',
              ),
              child: AnimatedTextKit(animatedTexts: [
                TyperAnimatedText( 'Jai Shree Ram'),
              ],isRepeatingAnimation: false,),
            ),
          ),
        ],
      ),
    );
  }
}
