import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/custom_textfield_input.dart';
import 'package:crendly/widgets/top_navigation.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _usernameController = TextEditingController();
  final _pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 88),
        child: Column(
          children: [
            const TopNavigation(),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 250),
              child: Text(
                'Sign In',
                style: subMainTextStyle,
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            CustomTextFieldInput(
                textEditingController: _usernameController,
                label: 'Username',
                hintText: "email or phone number",
                textInputType: TextInputType.text,
                prefixIcon: const Icon(
                  Icons.account_box,
                  color: iconColor,
                )),
            const SizedBox(
              height: 16,
            ),
            CustomTextFieldInput(
              textEditingController: _pwdController,
              label: 'Password',
              hintText: "Enter password",
              textInputType: TextInputType.text,
              isPassword: true,
              prefixIcon:
                  const Icon(Icons.lock_open_outlined, color: iconColor),
            ),
            const SizedBox(
              height: 316,
            ),
            CustomELevatedButton(text: 'Next', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
