import 'dart:convert';

import 'package:crendly/controller/address.dart';
import 'package:crendly/resources/color_manager.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../service/http_service_impl.dart';

class AddressView extends StatefulWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  _AddressViewState createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  final AddressController _addressController = Get.find<AddressController>();
  String? _myState;
  String? _myCity;
  String? _myResidenceArea;
  List residenceArea = [];
  List statesList = [];
  List cityList = [];
  String? _myResidenceHolding;
  List residenceHolding = [
    "Owner",
    "Shared Ownership",
    "Rented",
    "Shared Rented",
    "Using with family and friends"
  ];

  getResidenceCategories() async {
    Dio dio = Dio((BaseOptions(
      baseUrl: IDENTITY_BASE_URL,
      method: 'GET',
      headers: {"Content-Type": "application/json"},
    )));
    String url = "/api/Identity/GetResidenceCategories";
    try {
      var response = await dio.get(url);
      //  print('Response: ${response.data}');
      List residenceCategories = response.data;
      for (int i = 0; i < residenceCategories.length; i++) {
        String area = response.data[i]["area"];
        residenceArea.add(area);
        print("Residence categories $residenceCategories");
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> getStateList() async {
    final String response =
        await rootBundle.loadString('assets/states-and-cities.json');
    final data = await json.decode(response);
    for (int i = 0; i <= 36; i++) {
      String myState = data[i]["name"];
      setState(() {
        statesList.add(myState);
      });

      print(statesList);
    }
  }

  Future<void> getLgaList() async {
    final String response =
        await rootBundle.loadString('assets/states-and-cities.json');
    final data = await json.decode(response);
    for (int i = 0; i <= 36; i++) {
      if (_myState != null && _myState == data[i]["name"]) {
        print("State: $_myState and  City: ${data[i]["cities"]}");
        cityList = data[i]["cities"];
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    //residenceCategories = _addressController.getResidenceCategories();
    getResidenceCategories();
    // getLgaList();
    getStateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
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
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                          width: 162,
                          child: TextFieldInput(
                              label: "",
                              hintText: "Apartment No",
                              textInputType: TextInputType.text)),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  TextFieldInput(
                      label: "Area or Road Name",
                      hintText: "Street name",
                      textInputType: TextInputType.text),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                value: _myResidenceArea,
                                iconSize: 30,
                                dropdownColor: ColorManager.backgroundColor,
                                iconEnabledColor: iconColor,
                                icon: (null),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                hint: const Text(
                                  'Area that best describes your location',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'KumbhSans',
                                      color: ColorManager.lightWhite),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _myResidenceArea = newValue;
                                    print(_myResidenceArea);
                                  });
                                },
                                items: residenceArea.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item),
                                    value: item.toString(),
                                  );
                                }).toList()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "L.G.A",
                            style: regularFont,
                          ),
                          Container(
                            width: 162,
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(8)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: _myCity,
                                  iconSize: 30,
                                  dropdownColor: ColorManager.backgroundColor,
                                  iconEnabledColor: iconColor,
                                  icon: (null),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  hint: const Text(
                                    'Select',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KumbhSans',
                                        color: ColorManager.lightWhite),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _myCity = newValue;

                                      print(_myCity);
                                    });
                                  },
                                  items: cityList.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item),
                                      value: item.toString(),
                                    );
                                  }).toList()),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "State",
                            style: regularFont,
                          ),
                          Container(
                            width: 162,
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(8)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: _myState,
                                  iconSize: 30,
                                  dropdownColor: ColorManager.backgroundColor,
                                  iconEnabledColor: iconColor,
                                  icon: (null),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  hint: const Text(
                                    'Select',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'KumbhSans',
                                        color: ColorManager.lightWhite),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _myState = newValue;
                                      getLgaList();
                                      print(_myState);
                                    });
                                  },
                                  items: statesList.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item),
                                      value: item.toString(),
                                    );
                                  }).toList()),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 27),
                  const Text(
                    'Specify the type of residence holding as your address',
                    style: regularFont,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 14),
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                isExpanded: true,
                                value: _myResidenceHolding,
                                iconSize: 30,
                                dropdownColor: ColorManager.backgroundColor,
                                iconEnabledColor: iconColor,
                                icon: (null),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                hint: const Text(
                                  'Select',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'KumbhSans',
                                      color: ColorManager.lightWhite),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _myResidenceHolding = newValue;

                                    print(_myResidenceHolding);
                                  });
                                },
                                items: residenceHolding.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item),
                                    value: item.toString(),
                                  );
                                }).toList()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const Divider(
                    color: Color(0xff081952),
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            //politicallyExposed = true;
                          });
                          // setPoliticallyExposed();
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              // color:
                              // politicallyExposed ? highlightedButton : null,
                              border:
                                  Border.all(color: const Color(0xff4701E0)),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              'Less than 2 years',
                              style: smallText,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            // politicallyExposed = false;
                          });
                          // setPoliticallyExposed();
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              // color:
                              // !politicallyExposed ? highlightedButton : null,
                              border:
                                  Border.all(color: const Color(0xff4701E0)),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              '2 - 4 years',
                              style: smallText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    margin: const EdgeInsets.only(top: 15, right: 200),
                    decoration: BoxDecoration(
                        // color:
                        // politicallyExposed ? highlightedButton : null,
                        border: Border.all(color: const Color(0xff4701E0)),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'More than 4 years',
                        style: smallText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 73,
                  ),
                  CustomELevatedButton(text: 'Continue', onPressed: (){})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
