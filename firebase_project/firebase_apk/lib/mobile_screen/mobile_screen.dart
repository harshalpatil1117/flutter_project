
import 'package:firebase_auth/firebase_auth.dart';
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:firebase_apk/mobile_screen/otp_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../utils/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';



class MobileScreen extends StatefulWidget {
  MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {

  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegExp phoneExp = RegExp(r'^[0-9]{10}$');

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDReceived = "";
  var countryCode="+91";



  void verifyMobileNumber(){
    auth.verifyPhoneNumber(phoneNumber: "$countryCode ${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value){
          final User? user = auth.currentUser;
          final uid = user!.uid;
        });
      },
      verificationFailed: (FirebaseAuthException exception){
        Fluttertoast.showToast(msg: "Verification Is Failed Please Try Again",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
      },
      codeSent: (String? verificationID, int? resendToken){
        verificationIDReceived = verificationID!;
        setState(() {});
        Navigator.push(context, CupertinoPageRoute(builder: (context)=> OtpScreen(verificationIDReceived:verificationIDReceived,phoneController : phoneController.text),),);
      },
      codeAutoRetrievalTimeout: (String verificationID){},
    );
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      body: Padding(
        padding: padding.all(Dimensions.medium),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegularTextFormField(
                  controller: phoneController,
                  label: Constant.enterYourNumber,
                  hintText: Constant.enterYourNumber,
                  validation: (value) {
                    if(!phoneExp.hasMatch(value!)){
          return 'Please enter a valid number';
                    }
                    return null;
                  },
                  needLabel: true,
                  isNumber: true,
                  maxLength: 10,),
              Space(Dimensions.medium),
              SubmitButton(
                onPressed: () {

                  if(formKey.currentState!.validate()){
                    verifyMobileNumber();
                    Fluttertoast.showToast(msg: "OTP Send Successfully",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
                  }
                  FocusScope.of(context).unfocus();
                    print('Jai Shree Ram');
                },
                isLoading: false,
                childWidget: Text(
                  Constant.getOTP,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}