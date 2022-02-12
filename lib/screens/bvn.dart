import 'package:crendly/screens/date_of_birth.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class BvnScreen extends StatefulWidget {
  const BvnScreen({Key? key}) : super(key: key);

  @override
  _BvnScreenState createState() => _BvnScreenState();
}

class _BvnScreenState extends State<BvnScreen> {
  final _bvnController = TextEditingController();
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
            const Padding(
              padding: EdgeInsets.only(right: 280),
              child: Text(
                'BVN',
                style: subMainTextStyle,
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            TextFieldInput(
                textEditingController: _bvnController,
                label: 'Enter your bvn',
                hintText: '45645 75644',
                icon: const Icon(
                  Icons.cancel,
                  color: Color(0xffFFFFFF),
                ),
                textInputType: TextInputType.number),
            const SizedBox(
              height: 47,
            ),
            CustomELevatedButton(
                text: 'Next',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DOBScreen()));
                })
          ],
        ),
      ),
    );
  }
}
