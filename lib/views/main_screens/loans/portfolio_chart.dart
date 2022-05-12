import 'package:crendly/views/main_screens/loans/myloans.dart';
import 'package:flutter/material.dart';

import '../../../style/style.dart';

class PortfolioChartView extends StatelessWidget {
  const PortfolioChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 21, right: 21, top: 30),
          height: 460,
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
                    'My Portfolio',
                    style: boldSubtitle,
                  )
                ],
              ),
              const SizedBox(height: 137),
              Image.asset('assets/images/Graph.png'),
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
        const SizedBox(
          height: 17,
        ),
        Row(
          children: [
            Column(
              children: const [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xff1B034F),
                  child: Icon(
                    Icons.print,
                    color: Colors.white,
                  ),
                ),
                Text('Repay Loan')
              ],
            ),
            Column(
              children: const [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xff1B034F),
                  child: Icon(
                    Icons.print,
                    color: Colors.white,
                  ),
                ),
                Text('Withdraw')
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const MyLoansView()
      ],
    );
  }
}
