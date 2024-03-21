import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../onboarding_screen/intro.dart';
import '../onboarding_screen/onboarding_screen.dart';

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
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => OnboardingScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      backgroundColor: theme.EcommerceColorsExtensions.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 25,
              backgroundColor: theme.EcommerceColorsExtensions.onBackground,
                child: Icon(
              size: 30,
              Icons.shopping_bag,
              color: theme.EcommerceColorsExtensions.primary,
            ),),
            const Space(Dimensions.small),
            Text(
              Constant.appName,
              style: theme.textTheme.headlineMedium
                  ?.copyWith(color: theme.EcommerceColorsExtensions.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
