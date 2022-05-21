import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerifyIdCardView extends StatefulWidget {
  const VerifyIdCardView({Key? key}) : super(key: key);

  @override
  _VerifyIdCardViewState createState() => _VerifyIdCardViewState();
}

class _VerifyIdCardViewState extends State<VerifyIdCardView> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OnboardingNavigation(
              text: 'Select ID card',
              value: 0.4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 47),
              child: Column(
                children: [
                  SizedBox(
                    width: 344,
                    height: 219,
                    child: DottedBorder(
                      child: SvgPicture.asset('assets/images/id.svg'),
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  TextFieldInput(
                      textEditingController: _controller,
                      label: 'ID Number',
                      hintText: '43245678912',
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 164,
                        child: TextFieldInput(
                            textEditingController: _controller,
                            label: 'Issue Date',
                            hintText: 'DD/MM/YY',
                            textInputType: TextInputType.text),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 164,
                          child: TextFieldInput(
                              textEditingController: _controller,
                              label: 'Expiry Date',
                              hintText: 'DD/MM/YY',
                              textInputType: TextInputType.text),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 76,
                  ),
                  CustomELevatedButton(text: 'Continue', onPressed: () {}),
                  const SizedBox(
                    height: 34,
                  ),
                  const Text(
                    'Provide another ID card',
                    style: skipText,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
