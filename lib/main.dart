import 'dart:async';

import 'package:crendly/core/binding/verify_bvn.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/views/onboarding_screen/onboardingscreen_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
            name: '/main_onboarding_view',
            page: () => const MainOnboardingScreen(),
            binding: VerifyBvnBinding()),
      ],
      initialRoute: '/',
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final logo = 'assets/images/logo.png';
  final image = 'assets/images/Layer 2.png';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 3), () => Get.toNamed('/main_onboarding_view'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          const SizedBox(
            height: 140,
          ),
          Image.asset(logo),
          const SizedBox(height: 30),
          Stack(children: [
            Image.asset(image),
            const Positioned(
              bottom: 20,
              left: 80,
              child: Text(
                'made with love by people who care',
                style: regularFont,
              ),
            )
          ])
        ]));
  }
}
