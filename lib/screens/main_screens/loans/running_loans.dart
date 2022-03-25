import 'package:flutter/material.dart';

import '../../../style/style.dart';

class RunningLoans extends StatelessWidget {
  const RunningLoans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xff081952))),
          width: 347,
          height: 174,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PaydayLoan(Amount repayable)',
                    style: smallCaption,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 68,
                    height: 24,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffF5B070)),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'Running',
                        style: TextStyle(
                            color: Color(0xffF5B070),
                            fontSize: 10,
                            fontFamily: 'KumbhSans'),
                      ),
                    ),
                  )
                ],
              ),
              RichText(
                text: const TextSpan(
                    text: 'N450,000.00 ',
                    style: boldSubtitle,
                    children: [
                      TextSpan(
                          text: '15%',
                          style: TextStyle(
                              fontFamily: 'KumbhSans',
                              color: Color(0xff6DE7B4),
                              fontSize: 10))
                    ]),
              ),
              const SizedBox(
                height: 53,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Loan Amount',
                    style: smallCaption,
                  ),
                  Text('Loan Duration', style: smallCaption),
                  Text('Interest', style: smallCaption)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('N350,000', style: boldSmallText),
                  Text('6 Months', style: boldSmallText),
                  Text('N150,000', style: boldSmallText)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
