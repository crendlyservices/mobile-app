import 'package:crendly/style/style.dart';
import 'package:crendly/views/onboarding_screen/ready_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'onboarding_view1.dart';
import 'onboarding_view2.dart';
import 'onboarding_view3.dart';

class MainOnboardingScreen extends StatefulWidget {
  const MainOnboardingScreen({Key? key}) : super(key: key);

  @override
  _MainOnboardingScreenState createState() => _MainOnboardingScreenState();
}

class _MainOnboardingScreenState extends State<MainOnboardingScreen> {
  final _controller = PageController(initialPage: 0);
  String text = 'Later';
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page != 0) {
        setState(() {
          text = 'Back';
        });
      } else {
        setState(() {
          text = 'Later';
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void next() {
    if (_controller.page == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ReadyView()));
    } else {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void previous() {
    if (_controller.page == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ReadyView()));
    } else {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
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
                    margin: const EdgeInsets.only(left: 33, bottom: 50),
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
