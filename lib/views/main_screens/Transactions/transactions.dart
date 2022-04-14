import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 72),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Transactions',
              style: headerTextStyle,
            ),
            const Text(
              'See all your transactions activities',
              style: subSmallTextStyle,
            ),
            const SizedBox(
              height: 42,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff081952)),
              child: Column(
                children: [
                  ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        side: BorderSide(
                            color: Color.fromRGBO(8, 25, 82, 1),
                            style: BorderStyle.solid)),
                    leading: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color.fromRGBO(255, 144, 97, 1),
                      child: CircleAvatar(
                        backgroundColor: backgroundColor,
                        radius: 15,
                        child: SvgPicture.asset('assets/images/Vector.svg'),
                      ),
                    ),
                    title: const Text(
                      'Loan Disbursed',
                      style: subTextStyle,
                    ),
                    subtitle: const Text('20 Jan 2022, 3:33 pm',
                        style: TextStyle(
                          color: Color.fromRGBO(213, 213, 213, 1),
                          letterSpacing: -0.078,
                          fontSize: 10,
                          fontFamily: 'Sansation',
                        )),
                    trailing: Text(
                      'N50,000',
                      style: subTextStyle,
                    ),
                  ),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        side: BorderSide(
                            color: Color.fromRGBO(8, 25, 82, 1),
                            style: BorderStyle.solid)),
                    leading: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color.fromRGBO(255, 74, 103, 1),
                      child: CircleAvatar(
                        backgroundColor: backgroundColor,
                        radius: 15,
                        child:
                            SvgPicture.asset('assets/images/Group 12732.svg'),
                      ),
                    ),
                    title: const Text(
                      'Funds Withdrawal',
                      style: subTextStyle,
                    ),
                    subtitle: const Text('20 Jan 2022, 3:33 pm',
                        style: TextStyle(
                          color: Color.fromRGBO(213, 213, 213, 1),
                          letterSpacing: -0.078,
                          fontSize: 10,
                          fontFamily: 'Sansation',
                        )),
                    trailing: const Text(
                      'N50,000',
                      style: subTextStyle,
                    ),
                  ),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        side: BorderSide(
                            color: Color.fromRGBO(8, 25, 82, 1),
                            style: BorderStyle.solid)),
                    leading: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color.fromRGBO(133, 160, 255, 1),
                      child: CircleAvatar(
                        backgroundColor: backgroundColor,
                        radius: 15,
                        child: SvgPicture.asset('assets/images/Union.svg'),
                      ),
                    ),
                    title: const Text(
                      'Funded Wallet',
                      style: subTextStyle,
                    ),
                    subtitle: const Text('20 Jan 2022, 3:33 pm',
                        style: TextStyle(
                          color: Color.fromRGBO(213, 213, 213, 1),
                          letterSpacing: -0.078,
                          fontSize: 10,
                          fontFamily: 'Sansation',
                        )),
                    trailing: const Text(
                      'N50,000',
                      style: subTextStyle,
                    ),
                  ),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        side: BorderSide(
                            color: Color.fromRGBO(8, 25, 82, 1),
                            style: BorderStyle.solid)),
                    leading: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color.fromRGBO(180, 221, 197, 1),
                      child: CircleAvatar(
                        backgroundColor: backgroundColor,
                        radius: 15,
                        child: SvgPicture.asset('assets/images/Vector2.svg'),
                      ),
                    ),
                    title: const Text(
                      'Loan Collected',
                      style: subTextStyle,
                    ),
                    subtitle: const Text('20 Jan 2022, 3:33 pm',
                        style: TextStyle(
                          color: Color.fromRGBO(213, 213, 213, 1),
                          letterSpacing: -0.078,
                          fontSize: 10,
                          fontFamily: 'Sansation',
                        )),
                    trailing: Text(
                      'N50,000',
                      style: subTextStyle,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
