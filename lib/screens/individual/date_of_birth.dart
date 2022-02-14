import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class DOBScreen extends StatefulWidget {
  const DOBScreen({Key? key}) : super(key: key);

  @override
  _DOBScreenState createState() => _DOBScreenState();
}

class _DOBScreenState extends State<DOBScreen> {
  final _dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 88.5, left: 24, right: 24),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffB4DDC5),
                ),
                onPressed: null,
              ),
              Image.asset('assets/images/Vector.png')
            ]),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.only(right: 180),
              child: const Text(
                'Date of Birth',
                style: subMainTextStyle,
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            TextFieldInput(
                textEditingController: _dobController,
                label: 'Date of birth',
                hintText: 'DD/MM/YY',
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Color(0xffFFFFFF),
                ),
                textInputType: TextInputType.number),
            const SizedBox(
              height: 47,
            ),
            CustomELevatedButton(text: 'Next', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
