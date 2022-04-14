import 'package:crendly/style/style.dart';
import 'package:crendly/views/main_screens/loans/all_loans.dart';
import 'package:crendly/views/main_screens/loans/repaid_loans.dart';
import 'package:crendly/views/main_screens/loans/running_loans.dart';
import 'package:flutter/material.dart';

class MyLoansView extends StatelessWidget {
  const MyLoansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(
                //   height: 33,
                // ),
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
                          fontFamily: 'KumbhSans', fontWeight: FontWeight.bold),
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
                // const SizedBox(
                //   height: 44,
                // ),
                const SizedBox(
                    height: 500,
                    child: TabBarView(children: [
                      AllLoansView(),
                      RunningLoansView(),
                      RepaidLoansView()
                    ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
