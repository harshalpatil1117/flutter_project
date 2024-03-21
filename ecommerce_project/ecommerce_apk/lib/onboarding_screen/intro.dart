import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:ecommerce_assets/enalytics_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/account_screen.dart';
import '../auth/signUp.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      body: Padding(
        padding: padding.all(Dimensions.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400.0,
              height: 400.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: EcommerceAssets.images.common.provider(),
                    fit: BoxFit.cover,
                  )),
            ),
            Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: Constant.name,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.EcommerceColorsExtensions.primary,
                    ),
                  ),
                  TextSpan(
                    text: Constant.name2,
                    style: theme.textTheme.headlineMedium,
                  )
                ]),
                textAlign: TextAlign.center,
              ),
            ),
            Space(Dimensions.small),
            Text(Constant.description, textAlign: TextAlign.center,),
            Space(Dimensions.small),
            SubmitButton(onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) =>CreateAccount()),);
            }, text: Constant.butName,),
            Space(Dimensions.small),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Constant.name3,
                    style: theme.textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => SignIn(),),
                  );},
                  child: Text(
                    Constant.name4,
                    style: theme.textTheme.titleMedium?.copyWith(color: theme.EcommerceColorsExtensions.primary,decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
