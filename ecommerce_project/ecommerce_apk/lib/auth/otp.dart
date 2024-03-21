import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../profile/create_profile.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.EcommerceColorsExtensions.onBackground,
      ),
      body: Padding(
        padding: padding.all(Dimensions.medium),
        child: Column(
          children: [
            Text(
              Constant.verifyCode,
              style: theme.textTheme.headlineLarge,
            ),
            Text(
              Constant.pleaseEnter,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.EcommerceColorsExtensions.secondary),
            ),
            Text(
              Constant.hintText2,
              style: theme.textTheme.bodyLarge
                  ?.copyWith(color: theme.EcommerceColorsExtensions.primary),
            ),
            Space(Dimensions.medium),
            OtpTextField(
              numberOfFields: 4,
              focusedBorderColor: theme.EcommerceColorsExtensions.primary,
              showFieldAsBox: true,
            ),
            Space(Dimensions.medium),
            Text(
              Constant.didReceiveOtp,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.EcommerceColorsExtensions.secondary),
            ),
            InkWell(
              child: Text(
                Constant.resendCode,
                style: theme.textTheme.bodyMedium?.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            Space(Dimensions.medium),
            SubmitButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => CreateProfile()));
                },
                text: Constant.verify),
          ],
        ),
      ),
    );
  }
}
