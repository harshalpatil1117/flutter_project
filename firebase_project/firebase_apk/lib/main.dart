import 'package:common/common.dart';
import 'package:firebase_apk/second_screen/second_screen.dart';
import 'package:firebase_apk/splash_screen/splashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firstscreen/firstScreen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDY5WNkkKHI84TovNvxjtGGd5Ruw-KbwYo',
      appId: "1:53281524537:android:4c74d38208765f69c136e8",
      messagingSenderId: '53281524537',
      projectId: "fir-basic-f75db",
      storageBucket: 'fir-basic-f75db.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var value;

  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  Future<void> getValue() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      value = prefs.getString('token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 827),
      useInheritedMediaQuery: true,
      minTextAdapt: false,
      builder: (context, child) => MaterialApp(
        navigatorKey: navigatorKey,
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),


        // value == null ? FirstScreen() : SecondScreen(otpController: '', phoneController: '',),
      ),
    );
  }
}
