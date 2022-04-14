import 'package:flutter/material.dart';

import '../../../style/style.dart';
import 'myloans.dart';

class LoansChartView extends StatelessWidget {
  const LoansChartView({Key? key}) : super(key: key);

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
                    'My Loans',
                    style: boldSubtitle,
                  )
                ],
              ),
              const SizedBox(height: 137),
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
