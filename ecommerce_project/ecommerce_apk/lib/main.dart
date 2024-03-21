import 'package:common/common.dart';
import 'package:e_commerce/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home:  SplashScreen(),
      ),
    );
  }
}

