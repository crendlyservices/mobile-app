import 'package:crendly/style/style.dart';
import 'package:crendly/views/individual/date_of_birth.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class BVNView extends StatefulWidget {
  const BVNView({Key? key}) : super(key: key);

  @override
  _BVNViewState createState() => _BVNViewState();
}

class _BVNViewState extends State<BVNView> {
  final _bvnController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: Column(children: [
        const OnboardingNavigation(
          text: 'BVN',
          value: 0.1,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  textEditingController: _bvnController,
                  label: 'Provide your bvn',
                  hintText: '45645 75644',
                  textInputType: TextInputType.number),
              const SizedBox(
                height: 125,
              ),
              CustomELevatedButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DOBView()));
                  }),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Can\'t get your BVN? Dial *565*0# ',
                style: smallText,
              ),
              const SizedBox(
                height: 142,
              ),
              const Text(
                "Don\'t have a BVN at the moment?",
                style: boldSmallText,
              ),
              const SizedBox(
                height: 22,
              ),
              const Text(
                'Continue without BVN',
                style: skipText,
              )
            ],
          ),
        ),
      ])),
    );
  }
}
