import 'package:common/common.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dashboard/bottom_bar.dart';
import 'account_screen.dart';
import 'forget_password.dart';


class SignIn extends StatelessWidget {
  SignIn({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: padding.all(Dimensions.medium),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Space(Dimensions.large),
              Text(
                Constant.signIn,
                style: theme.textTheme.displaySmall,
              ),
              Space(Dimensions.medium),
              Padding(
                padding: padding.symmetric(horizontal: Dimensions.medium),
                child: Text(
                  Constant.signInDescription,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.EcommerceColorsExtensions.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Space(Dimensions.medium),
              RegularTextFormField(
                controller: emailController,
                label: Constant.label2,
                needLabel: true,
                hintText: Constant.hintText2,
                validation: (value) {},
              ),
              Space(Dimensions.small),
              BaseFormField(
                  controller: passController,
                  label: Constant.label3,
                  isRequired: true,
                  enabled: true,
                  onValueChanged: (value) {},
                  isPasswordField: true,
                  isNumber: true),
              Align(
                alignment: Alignment.centerRight,
                child: TextButtonDecoration(
                  label: Constant.forgetPassword,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ForgetPassword()),
                    );
                  },
                ),
              ),
              Space(Dimensions.medium),
              SubmitButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => BottomBarWidget(),
                      ),
                    );
                  },
                  text: Constant.name4),
              Space(Dimensions.medium),
              Padding(
                padding: padding.symmetric(horizontal: Dimensions.large),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      height: 20,
                      color: theme.EcommerceColorsExtensions.secondary,
                    )),
                    Text(
                      Constant.label5,
                      style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.EcommerceColorsExtensions.secondary),
                    ),
                    Expanded(
                        child: Divider(
                      height: 20,
                      color: theme.EcommerceColorsExtensions.secondary,
                    )),
                  ],
                ),
              ),
              Space(Dimensions.medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.apple),
                  ),
                  Space(Dimensions.medium),
                  CircleAvatar(
                    child: Icon(Icons.g_mobiledata),
                  ),
                  Space(Dimensions.medium),
                  CircleAvatar(
                    child: Icon(Icons.facebook),
                  ),
                ],
              ),
              Space(Dimensions.medium),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Constant.dontHaveAnAccount,
                    style: theme.textTheme.titleMedium,
                  ),
                  TextButtonDecoration(
                    label: Constant.butlabel,
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CreateAccount(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
