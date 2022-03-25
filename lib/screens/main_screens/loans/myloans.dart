import 'package:crendly/screens/main_screens/loans/all_loans.dart';
import 'package:crendly/screens/main_screens/loans/repaid_loans.dart';
import 'package:crendly/screens/main_screens/loans/running_loans.dart';
import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';

class MyLoans extends StatelessWidget {
  const MyLoans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 21, right: 21, top: 30),
                height: 340,
                width: 390,
                decoration: BoxDecoration(
                    color: const Color(0xff081952),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all()),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff6DE7B4),
                        ),
                        Text(
                          'My Loans',
                          style: boldSubtitle,
                        )
                      ],
                    ),
                    const SizedBox(height: 17),
                    Container(
                      color: const Color(0xff6DE7B4),
                      width: 92,
                      height: 21,
                      child: const Center(
                        child: Text(
                          'N250,000 repaid',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'KumbhSans',
                          ),
                        ),
                      ),
                    ),
                    Image.asset('assets/images/Vector 11.png'),
                    const SizedBox(
                      height: 82,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 50,
                          ),
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Color(0xffFFBA7B),
                          ),
                          Text(
                            'Total Loans Taken',
                            style: smallText,
                          ),
                          VerticalDivider(
                            color: Colors.white,
                          ),
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Color(0xff6DE7B4),
                          ),
                          Text(
                            'Total Loans Repaid',
                            style: smallText,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          '25 Paid',
                          style: TextStyle(
                              fontFamily: 'KumbhSans',
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 62,
                        ),
                        Text(
                          '24  Repaid',
                          style: TextStyle(
                              fontFamily: 'KumbhSans',
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Color(0xff1B034F),
                          child: Icon(
                            Icons.print,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    const Text(
                      'Loans',
                      style: boldSubtitle,
                    ),
                    Container(
                      height: 40,
                      color: const Color.fromRGBO(118, 118, 128, 0.12),
                      child: TabBar(
                          labelColor: const Color(0xff00071F),
                          unselectedLabelColor: Colors.white,
                          labelStyle: const TextStyle(
                              fontFamily: 'KumbhSans',
                              fontWeight: FontWeight.bold),
                          unselectedLabelStyle: const TextStyle(
                            fontFamily: 'KumbhSans',
                            fontSize: 14,
                          ),
                          indicator: BoxDecoration(
                              color: const Color(0xffFED0B7),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                              border: Border.all(
                                color: const Color(0xffFED0B7),
                              )),
                          tabs: const [
                            Text(
                              'All Loans',
                            ),
                            Text(
                              'Running Loans',
                            ),
                            Text(
                              'Repaid Loans',
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: 44,
                    ),
                    const SizedBox(
                        height: 500,
                        child: TabBarView(children: [
                          AllLoans(),
                          RunningLoans(),
                          RepaidLoans()
                        ]))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
