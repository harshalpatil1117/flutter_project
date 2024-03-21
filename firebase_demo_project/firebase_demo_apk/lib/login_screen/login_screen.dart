import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:firebase_demo_apk/login_screen/register_screen.dart';
import 'package:firebase_demo_apk/user_auth/firebase_auth_service.dart';
import 'package:firebase_demo_apk/utlis/constant.dart';
import 'package:firebase_demo_apk/utlis/custom_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../profile_screen/profile_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final Auth _auth = Auth();
  final DatabaseReference _database = FirebaseDatabase.instance.ref();


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  RegExp passwordExp =
  RegExp(r'^\s*(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  RegExp emailExp = RegExp(r'^\s*[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$');

  void dispose() {
    emailController.dispose();
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
        padding: padding.all(Dimensions.medium),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Space(Dimensions.large),
                Text('Login here!',style: theme.textTheme.headlineMedium,),
                Space(Dimensions.largest),
                Space(Dimensions.largest),
                RegularTextFormField(
                  controller: emailController,
                  // needAsteriskSign: true,
                  label: Constant.email,
                  needLabel: true,
                  hintText: '',
                  validation: (String? value) {
                    if (!emailExp.hasMatch(value!)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                Space(Dimensions.medium),
                BaseFormField(
                  label: Constant.password,
                  enabled: true,
                  validation: (value) {
                    if (!passwordExp.hasMatch(value!)) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  isPasswordField: true,
                  isNumber: true,
                  hintText: '',
                  controller: passwordController,
                ),
                Space(Dimensions.medium),
                SubmitButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
            
                    if (_formKey.currentState!.validate()) {
                      LoaderHelper.showLoader();
                        await _auth
                            .handleSignInEmail(
                            emailController.text.trim(),passwordController.text.trim())
                            .then((value) async {
            
                          if(value != null){
                            String? key = emailController.text.trim().replaceAll('.', '_');
                            if(key != null) {
                              LoaderHelper.hideLoader();
                              Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>  ProfileScreen(keyy: key,),
                                ),
                              );
                            }
                          }
                          else {
                            LoaderHelper.hideLoader();
                          }
                        }
                        );
                      }
            
            
                    },
                  isLoading: false,
                  childWidget: Text(Constant.submit),
                ),
                Space(Dimensions.medium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Constant.dontHaveAnAcc,style: theme.textTheme.titleMedium,),
                    TextButtonDecoration(
                        label: Constant.signUP,
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => RegisterScreen(),
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
