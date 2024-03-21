import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../firstscreen/firstScreen.dart';
import '../utils/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SecondScreen extends StatefulWidget {
  String otpController;
  String phoneController;

   SecondScreen({super.key, required this.otpController, required this.phoneController,this.user});
  final User? user;
   // SecondScreen({super.key, required this.otpController, required this.phoneController, required User user});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late User _user;
  bool _isSigningOut = false;

  @override
  void initState() {
    // TODO: implement initState
    // _user = widget.user!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
// Text(_user.displayName!,style: theme.textTheme.headlineLarge,),
// Text(_user.email!,style: theme.textTheme.headlineLarge,),
Text(widget.phoneController,style: theme.textTheme.headlineLarge,),
Text(widget.otpController,style: theme.textTheme.headlineLarge,),
          SubmitButton(onPressed: () async {
            await Authentication.signOut(context: context);
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=>FirstScreen()), (route) => false);
            // Navigator.of(context)
            //     .pushReplacement(_routeToSignInScreen());
          }, isLoading: false, childWidget: Text('Sign out'),),
        ],
      ),
    );
  }
}

