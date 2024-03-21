import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:firebase_apk/second_screen/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:telephony/telephony.dart';

class OtpScreen extends StatefulWidget {
  String verificationIDReceived;
  String phoneController;
  OtpScreen({super.key,required this.verificationIDReceived, required this.phoneController});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpController = '';
  Telephony telephony = Telephony.instance;
  OtpFieldController otpBoxController = OtpFieldController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void verifyCode() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationIDReceived,
        smsCode: otpController.toString(),
      );

      await auth.signInWithCredential(credential).then((value) {
        final User user = auth.currentUser!;
        final uid = user.uid;
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> SecondScreen(otpController : otpController,phoneController : widget.phoneController),),);
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "The verification code from SMS/TOTP is invalid.",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        print(message.address); // +977981******67, sender number
        print(message.body); // Your OTP code is 34567
        print(message.date); // 1659690242000, timestamp

        // get the message
        String sms = message.body.toString();

        if(message.body!.contains('fir-basic-f75db.firebase.com')){
          // verify SMS is sent for OTP with sender number
          String otpcode = sms.replaceAll(RegExp(r'[^0-9]'),'');
          // prase code from the OTP sms
          otpBoxController.set(otpcode.split(""));
          print(otpBoxController);
          // split otp code to list of number
          // and populate to otb boxes
          setState(() {
            // refresh UI
          });

        }else{
          print("Normal message.");
        }
      },
      listenInBackground: false,
    );

}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      body: Padding(

        padding: padding.all(Dimensions.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Constant.enterYourOtp,style: theme.textTheme.headlineMedium,),
            Space(Dimensions.medium),
            OTPTextField(
              controller: otpBoxController,
              keyboardType: TextInputType.number,
              length: 6,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                otpController = pin;

              },
              width: MediaQuery.of(context).size.width,
            ),
            Space(Dimensions.medium),
            SubmitButton(
              onPressed: () {
                verifyCode();
              },
              isLoading: false,
              childWidget: Text(
                Constant.submit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

