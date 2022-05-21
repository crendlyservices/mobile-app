import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../style/style.dart';

class BankCard extends StatefulWidget {
  const BankCard({Key? key}) : super(key: key);

  @override
  _BankCardState createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter Card Number',
          style: smallText,
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          style: const TextStyle(
            color: Color(0xff797979),
            fontSize: 14,
            fontFamily: 'KumbhSans',
          ),
          decoration: InputDecoration(
              enabledBorder: inputBorder,
              hintStyle: const TextStyle(
                color: Color(0xff797979),
                fontSize: 14,
                fontFamily: 'KumbhSans',
              ),
              hintText: 'Card Number',
              contentPadding: const EdgeInsets.all(8)),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 21,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Expiry date',
                  style: smallText,
                ),
                SizedBox(
                  width: 160,
                  child: TextField(
                    style: const TextStyle(
                      color: Color(0xff797979),
                      fontSize: 14,
                      fontFamily: 'KumbhSans',
                    ),
                    decoration: InputDecoration(
                        enabledBorder: inputBorder,
                        hintStyle: const TextStyle(
                          color: Color(0xff797979),
                          fontSize: 14,
                          fontFamily: 'KumbhSans',
                        ),
                        hintText: 'Card Number',
                        contentPadding: const EdgeInsets.all(8)),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              children: [
                const Text(
                  'CVV',
                  style: smallText,
                ),
                SizedBox(
                  width: 160,
                  child: TextField(
                    style: const TextStyle(
                      color: Color(0xff797979),
                      fontSize: 14,
                      fontFamily: 'KumbhSans',
                    ),
                    decoration: InputDecoration(
                        enabledBorder: inputBorder,
                        hintStyle: const TextStyle(
                          color: Color(0xff797979),
                          fontSize: 14,
                          fontFamily: 'KumbhSans',
                        ),
                        hintText: 'Card Number',
                        contentPadding: const EdgeInsets.all(8)),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'You will be charged a sum of N200,000',
          style: smallText,
        ),
        const SizedBox(
          height: 50,
        ),
        CustomELevatedButton(text: 'Pay N200,000', onPressed: () {})
      ],
    );
  }
}
