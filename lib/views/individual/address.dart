import 'dart:convert';

import 'package:crendly/controller/address.dart';
import 'package:crendly/resources/color_manager.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/loading_screen.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../service/http_service_impl.dart';

class AddressView extends StatefulWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  _AddressViewState createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  final AddressController _addressController = Get.find<AddressController>();
  String? rentedFor;
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

  setYearsRentedFor() {
    _addressController.rentedFor = rentedFor!;
  }

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

  Position? position;
  List<Placemark>? placeMarks;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;

    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getCurrentLocation() async {
    Position newPosition = await _determinePosition();

    position = newPosition;
    _addressController.longitude = "${position!.longitude}";
    _addressController.latitude = "${position!.latitude}";
    placeMarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);

    Placemark pMark = placeMarks![0];

    String completeAddress =
        '${pMark.subThoroughfare}, ${pMark.thoroughfare}, ${pMark.subLocality}, ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea}, ${pMark.postalCode}, ${pMark.country}';

    print('Address $completeAddress');
    _addressController.streetName = completeAddress;
  }

  @override
  void initState() {
    // TODO: implement initState
    getResidenceCategories();
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
            Obx(() => _addressController.isLoading.value
                ? loadingScreen()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21, vertical: 32),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: 162,
                                child: TextFieldInput(
                                  label: "Residence",
                                  hintText: "House Number",
                                  textInputType: TextInputType.text,
                                  onChanged: (val) {
                                    _addressController.houseNumber = val;
                                  },
                                )),
                            const SizedBox(
                              width: 16,
                            ),
                            SizedBox(
                                width: 162,
                                child: TextFieldInput(
                                  label: "",
                                  hintText: "Apartment No",
                                  textInputType: TextInputType.text,
                                  onChanged: (val) {
                                    _addressController.apartmentNumber = val;
                                  },
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        TextFieldInput(
                          label: "Area or Road Name",
                          hintText: "Street name",
                          textInputType: TextInputType.text,
                          onChanged: (val) {
                            _addressController.street = val;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
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
                                      dropdownColor:
                                          ColorManager.backgroundColor,
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
                                          _addressController.area =
                                              _myResidenceArea!;
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
                                        onTap: () {
                                          //_myCity = null;
                                          print("My city when null: $_myCity");
                                        },
                                        isExpanded: true,
                                        value: _myCity,
                                        iconSize: 30,
                                        dropdownColor:
                                            ColorManager.backgroundColor,
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
                                            _addressController.lga = _myCity!;
                                            print(
                                                "My city when not null: $_myCity");
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
                                        onTap: () {
                                          _myState = null;
                                          _myCity = null;
                                        },
                                        value: _myState,
                                        iconSize: 30,
                                        dropdownColor:
                                            ColorManager.backgroundColor,
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
                                            _addressController.state =
                                                _myState!;
                                            getLgaList();
                                            print(
                                                "My state when not null: $_myState");

                                            print(
                                                "My state when null: $_myState");
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
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
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
                                      dropdownColor:
                                          ColorManager.backgroundColor,
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
                                          _addressController.residenceHolding =
                                              _myResidenceHolding!;
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
                        const SizedBox(
                          height: 30,
                        ),
                        _myResidenceHolding != null
                            ? Column(
                                children: [
                                  const Text(
                                    'How long have you lived in your current resident?',
                                    style: regularBoldFont,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            rentedFor = "Less than 2 years";
                                          });
                                          setYearsRentedFor();
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: rentedFor ==
                                                      "Less than 2 years"
                                                  ? ColorManager
                                                      .highlightedButton
                                                  : null,
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff4701E0)),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
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
                                            rentedFor = "2 - 4 years";
                                          });
                                          setYearsRentedFor();
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: rentedFor == "2 - 4 years"
                                                  ? highlightedButton
                                                  : null,
                                              border: Border.all(
                                                  color:
                                                      const Color(0xff4701E0)),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
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
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        rentedFor = "More than 4 years";
                                      });
                                      setYearsRentedFor();
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 50,
                                      margin: const EdgeInsets.only(
                                          top: 15, right: 200),
                                      decoration: BoxDecoration(
                                          color: rentedFor ==
                                                  "More than 4 years"
                                              ? ColorManager.highlightedButton
                                              : null,
                                          border: Border.all(
                                              color: const Color(0xff4701E0)),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Center(
                                        child: Text(
                                          'More than 4 years',
                                          style: smallText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        const SizedBox(
                          height: 73,
                        ),
                        CustomELevatedButton(
                            text: 'Continue',
                            onPressed: () {
                              _addressController.updateAddress();
                            })
                      ],
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
