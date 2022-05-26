import 'dart:convert';

import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressViewState extends StatefulWidget {
  const AddressViewState({Key? key}) : super(key: key);

  @override
  _AddressViewStateState createState() => _AddressViewStateState();
}

class _AddressViewStateState extends State<AddressViewState> {
  List statesList = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/states-and-cities.json');
    final data = await json.decode(response);
    for (int i = 0; i < 36; i++) {
      String myState = data[i]["name"];
      statesList.add(myState);

      print(statesList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OnboardingNavigation(
              text: "Let's verify your address too",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 32),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: 162,
                          child: TextFieldInput(
                              label: "Residence",
                              hintText: "House Number",
                              textInputType: TextInputType.text)),
                      SizedBox(
                          width: 162,
                          child: TextFieldInput(
                              label: "",
                              hintText: "Apartment No",
                              textInputType: TextInputType.text)),
                      TextFieldInput(
                          label: "Area or Road Name",
                          hintText: "Street name",
                          textInputType: TextInputType.text)
                    ],
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
