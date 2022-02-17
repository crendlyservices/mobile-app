import 'package:crendly/screens/business/crendly_business.dart';
import 'package:crendly/screens/individual/bvn.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 106, right: 200),
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 45),
              child: const CustomText(
                text: 'Which one of these options best describes you?',
                fontSize: 40,
                fontFamily: 'Stiepa',
                textColor: Color.fromRGBO(254, 208, 183, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 150.0),
              child: CustomText(
                text: 'Either way welcome to crendly',
                textColor: Color(0xffFFFFFF),
                fontFamily: 'Sansation',
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 37,
            ),
            Row(
              children: [
                Container(
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
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const BvnScreen()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 22, right: 88),
                            child: CircleAvatar(
                              backgroundColor: backgroundColor,
                              radius: 25,
                              child: SvgPicture.asset(
                                'assets/images/orange.svg',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 43, right: 31),
                          child: const CustomText(
                            text: 'Individual',
                            fontSize: 26,
                            textColor: Color.fromRGBO(19, 17, 118, 1),
                            fontFamily: 'Stiepa',
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              'Invest in the needs of real people and earn interests monthly'),
                        )
                      ],
                    )),
                const SizedBox(
                  width: 12,
                ),
                Container(
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
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CrendlyBusiness()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 22, right: 88),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: backgroundColor,
                              child: SvgPicture.asset(
                                'assets/images/melon-head 1.svg',
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 43, right: 31),
                            child: const CustomText(
                              text: 'Business',
                              fontSize: 26,
                              textColor: Color.fromRGBO(19, 17, 118, 1),
                              fontFamily: 'Stiepa',
                            )),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              'Get money for what you need at an incredible speed'),
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
