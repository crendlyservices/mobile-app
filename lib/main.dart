import 'dart:async';

import 'package:crendly/core/binding/otp_verification.dart';
import 'package:crendly/core/binding/select_id_card.dart';
import 'package:crendly/core/binding/update_user_profile.dart';
import 'package:crendly/core/binding/verify_bvn.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/views/individual/bvn.dart';
import 'package:crendly/views/individual/date_of_birth.dart';
import 'package:crendly/views/individual/educational_background.dart';
import 'package:crendly/views/individual/email_address.dart';
import 'package:crendly/views/individual/employed.dart';
import 'package:crendly/views/individual/employment_status.dart';
import 'package:crendly/views/individual/means_of_identification.dart';
import 'package:crendly/views/individual/otp_verification.dart';
import 'package:crendly/views/individual/personal_information.dart';
import 'package:crendly/views/individual/phone_number.dart';
import 'package:crendly/views/individual/select_id_card.dart';
import 'package:crendly/views/individual/self_employed.dart';
import 'package:crendly/views/individual/unemployed.dart';
import 'package:crendly/views/individual/upload_id_card.dart';
import 'package:crendly/views/individual/verify_id_card.dart';
import 'package:crendly/views/main_screens/main_page.dart';
import 'package:crendly/views/onboarding_screen/onboardingscreen_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/binding/employee_details.dart';

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
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/main_onboarding_view',
          page: () => const MainOnboardingView(),
        ),
        GetPage(
            name: '/bvn',
            page: () => const BvnView(),
            binding: VerifyBvnBinding()),
        GetPage(
            name: '/dob',
            page: () => const DOBView(),
            binding: VerifyBvnBinding()),
        GetPage(
            name: '/phoneNumber',
            page: () => PhoneNumberView(),
            binding: VerifyBvnBinding()),
        GetPage(
            name: '/otp',
            page: () => OtpVerificationView(),
            binding: OtpVerificationBinding()),
        GetPage(
          name: '/main_page',
          page: () => const MainPageView(),
        ),
        GetPage(
          name: '/personal_info',
          page: () => PersonalInformationView(),
        ),
        GetPage(
            name: '/email_address',
            page: () => const EmailAddressView(),
            binding: UpdateUserProfileBinding()),
        GetPage(
            name: '/educational_background',
            page: () => const EducationalBackgroundView(),
            binding: UpdateUserProfileBinding()),
        GetPage(
          name: '/employment_status',
          page: () => const EmploymentStatusView(),
        ),
        GetPage(
            name: '/employed_view',
            page: () => const EmployedView(),
            binding: EmployeeDetailsBinding()),
        GetPage(
            name: '/selfemployed_view',
            page: () => const SelfEmployedView(),
            binding: EmployeeDetailsBinding()),
        GetPage(
            name: '/unemployed_view',
            page: () => const UnemployedView(),
            binding: EmployeeDetailsBinding()),
        GetPage(
          name: '/means_of_identification',
          page: () => const MeansOfIdentificationView(),
        ),
        GetPage(
          name: '/select_id_card',
          page: () => const SelectIdCardView(),
        ),
        GetPage(
            name: '/upload_id_card',
            page: () => const UploadIdCardView(),
            binding: SelectIdCardBinding()),
        GetPage(
          name: '/verify_id_card',
          page: () => const VerifyIdCardView(),
        ),
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
