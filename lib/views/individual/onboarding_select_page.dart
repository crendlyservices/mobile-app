import 'package:crendly/views/main_screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/color_manager.dart';
import '../../style/style.dart';

class OnboardingSelectPage extends StatelessWidget {
  const OnboardingSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 106, right: 200),
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 45),
              child: const Text(
                'What would you like to do on Crendly?',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'KumbhSans',
                  color: Color.fromRGBO(254, 208, 183, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 37,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const MainPageView()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            colors: [
                              Color(0xffFD5454),
                              Color(0xffFF9061),
                              Color(0xffFFBA7B),
                              Color(0xffFFCEC3),
                            ],
                          ),
                          border: Border.all()),
                      height: 282,
                      width: 164,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 22, right: 80),
                            child: CircleAvatar(
                              backgroundColor: backgroundColor,
                              radius: 25,
                              child: SvgPicture.asset(
                                'assets/images/orange.svg',
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20, right: 31),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 18.0),
                              child: Text(
                                'Give Loan',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(19, 17, 118, 1),
                                  fontFamily: 'KumbhSans',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                                'Invest in the needs of real people and earn interests monthly'),
                          )
                        ],
                      )),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            colors: [
                              Color(0xff63BEDB),
                              Color(0xff63BEDB),
                              Color(0xff6DE7B4),
                              Color(0xffE2FCC2),
                            ],
                          ),
                          border: Border.all()),
                      height: 282,
                      width: 164,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 22, right: 80),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: backgroundColor,
                              child: SvgPicture.asset(
                                'assets/images/melon-head 1.svg',
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 20, right: 31),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Text(
                                  'Collect Loan',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(19, 17, 118, 1),
                                    fontFamily: 'KumbhSans',
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                                'Get money for what you need at an incredible speed'),
                          )
                        ],
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 31,
            ),
            const SizedBox(
                width: 235,
                height: 48,
                child: Text(
                  'Either way  we\'ll be having a good time together',
                  style: regularFont,
                ))
          ],
        ),
      ),
    );
  }
}
