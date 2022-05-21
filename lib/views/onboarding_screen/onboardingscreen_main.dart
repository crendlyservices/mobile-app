import 'package:crendly/style/style.dart';
import 'package:crendly/views/onboarding_screen/ready_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'onboarding_view1.dart';
import 'onboarding_view2.dart';
import 'onboarding_view3.dart';

class MainOnboardingView extends StatefulWidget {
  const MainOnboardingView({Key? key}) : super(key: key);

  @override
  _MainOnboardingViewState createState() => _MainOnboardingViewState();
}

class _MainOnboardingViewState extends State<MainOnboardingView> {
  final _controller = PageController();
  String text = 'Later';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      if (_controller.page == 0) {
        setState(() {
          text = 'Later';
        });
      }
    });
  }

  void next() {
    if (_controller.page == 2) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SignUpOrSignInView()));
    } else {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void previous() {
    if (_controller.page == 0) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SignUpOrSignInView()));
    }
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
                  OnboardingView1(),
                  OnboardingView2(),
                  OnboardingView3()
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
