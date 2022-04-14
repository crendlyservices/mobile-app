import 'package:crendly/style/style.dart';
import 'package:crendly/views/main_screens/main_page.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/onboarding_navigation.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _usernameController = TextEditingController();
  final _pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const OnboardingNavigation(
                text: 'Sign in',
              ),
              const SizedBox(
                height: 56.5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Column(
                  children: [
                    Center(
                      child: SvgPicture.asset('assets/images/face lemon.svg'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Welcome back Damilare',
                      style: subTextStyle,
                    ),
                    const Text(
                      'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                      style: subSmallTextStyle,
                    ),
                    const SizedBox(
                      height: 67,
                    ),
                    Row(
                      children: [
                        otpTextField(),
                        otpTextField(),
                        otpTextField(),
                        otpTextField(),
                        otpTextField(),
                        Expanded(child: otpTextField()),
                      ],
                    ),
                    const SizedBox(
                      height: 135,
                    ),
                    CustomELevatedButton(
                        text: 'Sign in',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MainPageView()));
                        }),
                    const SizedBox(
                      height: 37,
                    ),
                    RichText(
                      text: const TextSpan(
                          text: 'Do you have an account?',
                          children: [
                            TextSpan(
                                text: 'Sign up',
                                style: TextStyle(
                                  color: Color(0xff56E77E),
                                ))
                          ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget otpTextField() {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 50,
      width: 50,
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
    );
  }
}
