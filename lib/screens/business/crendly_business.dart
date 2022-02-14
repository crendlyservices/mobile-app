import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:crendly/widgets/top_navigation.dart';
import 'package:flutter/material.dart';

class CrendlyBusiness extends StatefulWidget {
  const CrendlyBusiness({Key? key}) : super(key: key);

  @override
  _CrendlyBusinessState createState() => _CrendlyBusinessState();
}

class _CrendlyBusinessState extends State<CrendlyBusiness> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 88.5, left: 24, right: 24),
        child: Column(
          children: [
            const TopNavigation(),
            Container(
                margin: const EdgeInsets.only(right: 100, top: 32),
                child: const Text(
                  'Crendly for business',
                  style: TextStyle(fontSize: 24, color: Color(0xffFFFFFF)),
                )),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'For business that want to be part of these great idea, we have'
              'you in mind. Crendly for business is coming soon.',
              style: TextStyle(color: Color(0xffFFFFFF)),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
                'You can join our waitlist to know to be the first to know'
                'when we are live',
                style: TextStyle(color: Color(0xffFFFFFF))),
            const SizedBox(
              height: 67,
            ),
            TextFieldInput(
                textEditingController: _emailController,
                label: 'Business email address',
                hintText: 'newmail@mail.com',
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 29,
            ),
            CustomELevatedButton(text: 'Join waitList', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
