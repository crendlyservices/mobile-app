import 'package:crendly/screens/onboarding_screen/ready_screen.dart';
import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'onboarding_screen1.dart';
import 'onboarding_screen2.dart';
import 'onboarding_screen3.dart';

class MainOnboardingScreen extends StatefulWidget {
  const MainOnboardingScreen({Key? key}) : super(key: key);

  @override
  _MainOnboardingScreenState createState() => _MainOnboardingScreenState();
}

class _MainOnboardingScreenState extends State<MainOnboardingScreen> {
  final _controller = PageController();
  String text = 'Back';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      if (_controller.page == 0) {
        setState(() {
          text = 'later';
        });
      }
    });
  }

  void next() {
    if (_controller.page == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ReadyScreen()));
    } else {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void previous() {
    if (_controller.page != 0) {}
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  OnboardingScreen1(),
                  OnboardingScreen2(),
                  OnboardingScreen3(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: previous,
                  child: Container(
                    margin: const EdgeInsets.only(left: 33, bottom: 40),
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: next,
                  child: Container(
                    margin: const EdgeInsets.only(right: 33, bottom: 40),
                    child: SvgPicture.asset('assets/images/Group 12716.svg'),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
