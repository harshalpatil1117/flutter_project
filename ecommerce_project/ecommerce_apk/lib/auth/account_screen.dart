import 'package:common/common.dart';
import 'package:e_commerce/auth/otp.dart';
import 'package:e_commerce/auth/signUp.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  TextEditingController nameController = TextEditingController();
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
              Text(
                Constant.title,
                style: theme.textTheme.displaySmall,
              ),
              Space(Dimensions.medium),
              Padding(
                padding: padding.symmetric(horizontal: Dimensions.medium),
                child: Text(
                  Constant.subtitle,
                  style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.EcommerceColorsExtensions.secondary,),textAlign: TextAlign.center,
                ),
              ),
              Space(Dimensions.medium),
              RegularTextFormField(
                controller: nameController,
                label: Constant.label1,
                needLabel: true,
                hintText: Constant.hintText1,
                validation: (value) {},
              ),
              Space(Dimensions.small),
              RegularTextFormField(
                controller: emailController,
                label: Constant.label2,
                needLabel: true,
                hintText: Constant.hintText2,
                validation: (value) {},
              ),
              Space(Dimensions.small),
              BaseFormField(controller: passController,
                  label: Constant.label3,
                  isRequired: true,
                  enabled: true,
                  onValueChanged: (value) {},
                  isPasswordField: true,
                  isNumber: true),
              Row(
                children: [
                  CheckboxDecoration(),
                  Text(
                    Constant.label4,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(Constant.label41,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.EcommerceColorsExtensions.primary,
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
              Space(Dimensions.medium),
              SubmitButton(onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => Otp(),),
                );
              }, text: Constant.butlabel),
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
                    Constant.name3,
                    style: theme.textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>SignIn(),),);
                    },
                    child: Text(
                      Constant.name4,
                      style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.EcommerceColorsExtensions.primary,
                          decoration: TextDecoration.underline),
                    ),
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
