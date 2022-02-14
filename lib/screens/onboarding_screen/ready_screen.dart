import 'package:crendly/screens/auth_screen/select_page.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/carousel.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/outline_button.dart';
import 'package:flutter/material.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CarouselPage(
                image: 'assets/images/ready.svg',
                firstText: 'Ready?',
                secondText: 'let\'s go!',
                thirdText:
                    'Just a few details from you to give you the experience ever'),
            const SizedBox(
              height: 8,
            ),
            CustomELevatedButton(
                text: 'Sign up',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SelectPage()));
                }),
            const SizedBox(
              height: 8,
            ),
            CustomOutlineButton(text: 'Sign in', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
