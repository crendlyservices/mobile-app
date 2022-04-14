import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class PlaygroundHome extends StatelessWidget {
  const PlaygroundHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 21,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 16),
                    child: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      radius: 25,
                      child: SvgPicture.asset(
                        'assets/images/orange.svg',
                        height: 27,
                        width: 27,
                      ),
                    ),
                  ),
                  const Text(
                    'Hi, Damilare',
                    style: TextStyle(
                        color: Color(0xffFED0B7),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KumbhSans'),
                  ),
                  const SizedBox(
                    width: 124,
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 21,
                  ),
                  const Icon(
                    Icons.notification_important,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 52,
              ),
              const Center(
                child: Text(
                  'N0',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'KumbhSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all()),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 182,
                      height: 42,
                      child: Text(
                        'Sign up new to enjoy full Crendly features',
                        style: TextStyle(
                            color: backgroundColor, fontFamily: 'KumbahSans'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: SizedBox(
                          height: 34,
                          width: 120,
                          child: CustomELevatedButton(
                              text: 'Sign up >', onPressed: () {})),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              const Text(
                'What do you want to do on Crendly',
                style: boldSubtitle,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  InkWell(
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
                        height: 246,
                        width: 164,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 22,
                              ),
                              CircleAvatar(
                                backgroundColor: backgroundColor,
                                radius: 30,
                                child: SvgPicture.asset(
                                  'assets/images/orange.svg',
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 53),
                                width: 94,
                                child: const Text(
                                  'Give Loan',
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Color.fromRGBO(19, 17, 118, 1),
                                      fontFamily: 'KumbhSans',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Text(
                                'Finance the needs of real problem and earn',
                                style: TextStyle(
                                    color: Color.fromRGBO(7, 6, 71, 1),
                                    fontFamily: 'KumbhSans',
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  InkWell(
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
                        height: 246,
                        width: 164,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 22,
                              ),
                              CircleAvatar(
                                backgroundColor: backgroundColor,
                                radius: 30,
                                child: SvgPicture.asset(
                                  'assets/images/melon-head 1.svg',
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 53),
                                width: 94,
                                child: const Text(
                                  'Take Loan',
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Color.fromRGBO(19, 17, 118, 1),
                                      fontFamily: 'KumbhSans',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Text(
                                'Get support for what you need at incredible speed',
                                style: TextStyle(
                                    color: Color.fromRGBO(7, 6, 71, 1),
                                    fontFamily: 'KumbhSans',
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 29,
              ),
              const Text(
                'Browse Our Loan Category',
                style: boldSubtitle,
              ),
              const SizedBox(
                height: 24,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Image.asset('assets/images/Rectangle 19483.png'),
                        Positioned(
                            bottom: 28,
                            left: 13,
                            child: Column(
                              children: [
                                const SizedBox(
                                    width: 153,
                                    child: Text(
                                      'Quick Loans to take care of your needs',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'KumbhSans',
                                          fontSize: 16,
                                          color: Colors.white),
                                    )),
                                const SizedBox(
                                  height: 22,
                                ),
                                InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 60),
                                    width: 87,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child:
                                        const Center(child: Text('View all')),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Stack(
                      children: [
                        Image.asset('assets/images/Rectangle 19483.png'),
                        Positioned(
                            bottom: 28,
                            left: 13,
                            child: Column(
                              children: [
                                const SizedBox(
                                    width: 153,
                                    child: Text(
                                      'Quick Loans to take care of your needs',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'KumbhSans',
                                          fontSize: 16,
                                          color: Colors.white),
                                    )),
                                const SizedBox(
                                  height: 22,
                                ),
                                InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 60),
                                    width: 87,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child:
                                        const Center(child: Text('View all')),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all()),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/Group.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                      width: 120,
                      height: 42,
                      child: Text(
                        'Make use of our calculator',
                        style: TextStyle(
                            color: backgroundColor, fontFamily: 'KumbahSans'),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    SizedBox(
                        height: 34,
                        width: 140,
                        child: CustomELevatedButton(
                            text: 'Check it out >', onPressed: () {}))
                  ],
                ),
              ),
              const Center(
                child: Text('What we have achieved so far'),
              ),
              Row(
                children: [
                  Container(
                    width: 159,
                    height: 101,
                    color: const Color(0xff4700E0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          '32,000',
                          style: bigNumbers,
                        ),
                        Text(
                          'Users',
                          style: regularFont,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 159,
                    height: 101,
                    color: const Color(0xff4700E0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          '15,000',
                          style: bigNumbers,
                        ),
                        Text(
                          'Loans',
                          style: regularFont,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Container(
                    width: 159,
                    height: 101,
                    color: const Color(0xff4700E0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'N78M',
                          style: bigNumbers,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'in Loans',
                          style: regularFont,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 159,
                    height: 101,
                    color: const Color(0xff4700E0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          '99%',
                          style: bigNumbers,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Repayment rate',
                          style: regularFont,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Inside Crendly Community',
                style: boldSubtitle,
              ),
              Stack(
                children: [
                  Image.asset('assets/images/Rectangle 864.png'),
                  Positioned(
                      top: 23,
                      left: 13,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                              width: 153,
                              child: Text(
                                'Looking for ways to cut your monthly spend?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'KumbhSans',
                                    fontSize: 16,
                                    color: Colors.white),
                              )),
                          const SizedBox(
                            height: 33,
                          ),
                          InkWell(
                            child: Container(
                              margin: const EdgeInsets.only(right: 60),
                              width: 87,
                              height: 36,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.white)),
                              child: const Center(
                                  child: Text(
                                'Stories',
                                style: TextStyle(
                                    fontFamily: 'KumbhSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 117,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/images/Group 12920.svg'),
                              SvgPicture.asset('assets/images/Group 12920.svg'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '40 people viewed this',
                                style: boldSmallText,
                              ),
                              SizedBox(width: 120),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  Image.asset('assets/images/Rectangle 864.png'),
                  Positioned(
                      top: 23,
                      left: 13,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                              width: 153,
                              child: Text(
                                'Looking for ways to cut your monthly spend?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'KumbhSans',
                                    fontSize: 16,
                                    color: Colors.white),
                              )),
                          const SizedBox(
                            height: 33,
                          ),
                          InkWell(
                            child: Container(
                              margin: const EdgeInsets.only(right: 60),
                              width: 87,
                              height: 36,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.white)),
                              child: const Center(
                                  child: Text(
                                'Stories',
                                style: TextStyle(
                                    fontFamily: 'KumbhSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 117,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/images/Group 12920.svg'),
                              SvgPicture.asset('assets/images/Group 12920.svg'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '40 people viewed this',
                                style: boldSmallText,
                              ),
                              SizedBox(width: 120),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  Image.asset('assets/images/Rectangle 864.png'),
                  Positioned(
                      top: 23,
                      left: 13,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                              width: 153,
                              child: Text(
                                'Looking for ways to cut your monthly spend?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'KumbhSans',
                                    fontSize: 16,
                                    color: Colors.white),
                              )),
                          const SizedBox(
                            height: 33,
                          ),
                          InkWell(
                            child: Container(
                              margin: const EdgeInsets.only(right: 60),
                              width: 87,
                              height: 36,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.white)),
                              child: const Center(
                                  child: Text(
                                'Stories',
                                style: TextStyle(
                                    fontFamily: 'KumbhSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 117,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/images/Group 12920.svg'),
                              SvgPicture.asset('assets/images/Group 12920.svg'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '40 people viewed this',
                                style: boldSmallText,
                              ),
                              SizedBox(width: 120),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration:
                    BoxDecoration(color: Colors.white, border: Border.all()),
                width: 350,
                height: 141,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 13),
                      child: Column(children: [
                        const SizedBox(
                          width: 186,
                          height: 42,
                          child: Text(
                              'Sign up new to enjoy full Crendly features'),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 50, top: 20),
                          width: 126,
                          child: CustomELevatedButton(
                              text: 'Sign Up', onPressed: () {}),
                        )
                      ]),
                    ),
                    SvgPicture.asset(
                      'assets/images/Layer 2.svg',
                      color: const Color(0xff6DE7B4),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 52,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff6DE7B4),
        child: SvgPicture.asset('assets/images/fab.svg'),
      ),
    );
  }
}
