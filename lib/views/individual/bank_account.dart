import 'package:crendly/controller/bank_account.dart';
import 'package:crendly/resources/color_manager.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../service/http_service_impl.dart';
import '../../style/style.dart';

class AddBankAccountView extends StatefulWidget {
  const AddBankAccountView({Key? key}) : super(key: key);

  @override
  _AddBankAccountViewState createState() => _AddBankAccountViewState();
}

class _AddBankAccountViewState extends State<AddBankAccountView> {
  final _bankAccountController = Get.find<BankAccountController>();
  final TextEditingController accountNumberController = TextEditingController();
  List bankAccounts = [];
  String? _myBankAccount;
  String? _myBankCode;
  getBankAccounts() async {
    Dio dio = Dio((BaseOptions(
      baseUrl: IDENTITY_BASE_URL,
      method: 'GET',
      headers: {"Content-Type": "application/json"},
    )));
    String url = "/api/Identity/bank-list";
    try {
      var response = await dio.get(url);
      List bankAccountsAndCodes = response.data;
      for (int i = 0; i < bankAccountsAndCodes.length; i++) {
        String bank = response.data[i]["bank"];
        setState(() {
          bankAccounts.add(bank);
        });
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  getBankCodes() async {
    Dio dio = Dio((BaseOptions(
      baseUrl: IDENTITY_BASE_URL,
      method: 'GET',
      headers: {"Content-Type": "application/json"},
    )));
    String url = "/api/Identity/bank-list";
    try {
      var response = await dio.get(url);
      //print('Response: ${response.data}');
      List bankAccountsAndCodes = response.data;
      print("Bank Accounts and Codes: $bankAccountsAndCodes");
      for (int i = 0; i < bankAccountsAndCodes.length; i++) {
        String bank = response.data[i]["bank"];
        if (_myBankAccount != null && _myBankAccount == bank) {
          // print("State: $_myState and  City: ${data[i]["cities"]}");
          setState(() {
            _myBankCode = response.data[i]["bankCode"];
            _bankAccountController.bankCode = _myBankCode!;
            print('Bank Code: $_myBankCode');
          });
        }
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getBankAccounts();
    print("Banks $bankAccounts");
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
              text: 'Add your bank account',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bank Name',
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
                                value: _myBankAccount,
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
                                    _myBankAccount = newValue;
                                    getBankCodes();
                                    print(_myBankAccount);
                                  });
                                },
                                items: bankAccounts.map((item) {
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
                    height: 10,
                  ),
                  TextFieldInput(
                      label: "Account Name",
                      hintText: "Your name",
                      textInputType: TextInputType.text,
                      enabled: false),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                    textEditingController: accountNumberController,
                    label: "Account Number",
                    hintText: "123456789",
                    textInputType: TextInputType.text,
                    onChanged: (val) {
                      _bankAccountController.accountNumber = val;
                      if (_myBankCode != null &&
                          accountNumberController.text.length == 10) {
                        _bankAccountController.validateAccountNumber();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 172,
                  ),
                  CustomELevatedButton(
                      text: "Continue",
                      onPressed: () {
                        Get.toNamed('/create_password');
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
