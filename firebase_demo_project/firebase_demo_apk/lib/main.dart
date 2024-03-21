import 'package:common/common.dart';
import 'package:firebase_demo_apk/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAid18iZMbTDPHeI-w2RXZu9f_h62jzr_E',
      appId: "1:486279590253:android:ba6cf1b5790c6ea8272a64",
      messagingSenderId: '486279590253',
      projectId: "fir-demo-4eea5",
      storageBucket: 'fir-demo-4eea5.appspot.com',
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

      ),
    );
  }
}
