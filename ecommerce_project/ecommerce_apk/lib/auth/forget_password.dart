import 'package:common/common.dart';
import 'package:e_commerce/auth/signUp.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});

TextEditingController newPassController = TextEditingController();
TextEditingController confirmPassController = TextEditingController();

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
    Constant.newPassword,
    style: theme.textTheme.headlineLarge,
    ),
    Text(
    Constant.yourNewPassword,
    style: theme.textTheme.bodyMedium
        ?.copyWith(color: theme.EcommerceColorsExtensions.secondary),textAlign: TextAlign.center,
    ),
      Space(Dimensions.medium),
      BaseFormField(controller: newPassController,
          label: Constant.label3,
          isRequired: true,
          enabled: true,
          onValueChanged: (value) {},
          isPasswordField: true,
          isNumber: true),
      Space(Dimensions.medium),
      BaseFormField(controller: confirmPassController,
          label: Constant.confirmPassword,
          isRequired: true,
          enabled: true,
          onValueChanged: (value) {},
          isPasswordField: true,
          isNumber: true),
      Space(Dimensions.larger),
      SubmitButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => SignIn()));
          },
          text: Constant.createNewPassword),
    ]
    ),
    ),
    );
  }
}
