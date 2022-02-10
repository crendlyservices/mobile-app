import 'package:crendly/screens/onboardingscreen_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MainOnboardingScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final logo = 'assets/images/Layer 1.svg';
  final image = 'assets/images/Layer 2.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [SvgPicture.asset(logo), SvgPicture.asset(image)]));
  }
}
