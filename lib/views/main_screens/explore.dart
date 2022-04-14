import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

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
              const SizedBox(height: 71),
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
                height: 54,
              ),
              const Text('Inside Crendly Community', style: boldSubtitle),
              const SizedBox(
                height: 24,
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
            ],
          ),
        ),
      ),
    );
  }
}
