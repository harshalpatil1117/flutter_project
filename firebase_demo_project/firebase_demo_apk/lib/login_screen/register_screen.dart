import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:firebase_demo_apk/login_screen/login_screen.dart';
import 'package:firebase_demo_apk/user_auth/firebase_auth_service.dart';
import 'package:firebase_demo_apk/utlis/constant.dart';
import 'package:firebase_demo_apk/utlis/custom_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../profile_screen/profile_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegExp passwordExp = RegExp(
      r'^\s*(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  RegExp emailExp = RegExp(r'^\s*[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$');
  RegExp ageExp = RegExp(r'^\s*\d{1,3}$');

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    ageController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          Constant.firebaseDemo,
          style: theme.textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: padding.symmetric(horizontal: Dimensions.medium),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 5.7,
                  width: MediaQuery.sizeOf(context).width,
                  // color: Colors.black.withOpacity(0.5),
                  child: Padding(
                    padding: padding.all(Dimensions.medium),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Create Your Account',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const Space(Dimensions.smaller),
                        DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Horizon',
                            color: theme.envoiceColorsExtensions.onBackground,
                          ),
                          child: AnimatedTextKit(
                            isRepeatingAnimation: true,
                            repeatForever: true,
                            animatedTexts: [
                              RotateAnimatedText('Here!'),
                              RotateAnimatedText('Now!'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                RegularTextFormField(
                  controller: usernameController,
                  label: Constant.username,
                  needLabel: true,
                  hintText: '',
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                const Space(Dimensions.medium),
                RegularTextFormField(
                  isNumber: true,
                  controller: ageController,
                  label: Constant.age,
                  needLabel: true,
                  hintText: '',
                  validation: (String? value) {
                    if (value == null || !ageExp.hasMatch(value)) {
                      return 'Please enter a valid age';
                    }
                    return null;
                  },
                ),
                const Space(Dimensions.medium),
                RegularTextFormField(
                  controller: emailController,
                  label: Constant.email,
                  needLabel: true,
                  hintText: '',
                  validation: (String? value) {
                    if (value == null || !emailExp.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const Space(Dimensions.medium),
                BaseFormField(
                  label: Constant.password,
                  enabled: true,
                  validation: (value) {
                    if (value == null || !passwordExp.hasMatch(value)) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  isPasswordField: true,
                  isNumber: true,
                  hintText: '',
                  controller: passwordController,
                ),
                const Space(Dimensions.medium),
                SubmitButton(
                  onPressed: () async {
                    BuildContext currentContext = context;
                    FocusScope.of(context).unfocus();

                    if (_formKey.currentState!.validate()) {
                      LoaderHelper.showLoader();
                      await _auth
                          .handleSignUp(emailController.text.trim(),
                              passwordController.text.trim())
                          .then((value) async {
                        if (value != null) {
                          String? key = await Auth().writeData(
                            usernameController.text.trim(),
                            ageController.text.trim(),
                            emailController.text.trim(),
                          );
                          if (key != null) {
                            LoaderHelper.hideLoader();
                            Navigator.pushReplacement(
                              currentContext,
                              CupertinoPageRoute(
                                builder: (context) => ProfileScreen(
                                  keyy: key,
                                ),
                              ),
                            );
                          }
                        } else {
                          LoaderHelper.hideLoader();
                        }
                      });
                    }
                  },
                  isLoading: false,
                  childWidget: Text(Constant.submit),
                ),
                const Space(Dimensions.smallest),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Constant.alreadyHaveAnAcc,
                      style: theme.textTheme.titleMedium,
                    ),
                    TextButtonDecoration(
                        label: Constant.signIN,
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
