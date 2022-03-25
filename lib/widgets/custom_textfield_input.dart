import 'package:flutter/material.dart';

import '../style/style.dart';

class CustomTextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String label;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;

  const CustomTextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPassword = false,
      required this.label,
      required this.hintText,
      required this.textInputType,
      required this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontFamily: 'KumbhSans', color: Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
              prefixIcon: IntrinsicHeight(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: prefixIcon,
                    ),
                    const SizedBox(
                      height: 30,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              border: inputBorder,
              hintStyle: const TextStyle(
                color: Color(0xff797979),
                fontSize: 14,
                fontFamily: 'KumbhSans',
              ),
              hintText: hintText,
              //  enabledBorder: inputBorder,
              contentPadding: const EdgeInsets.all(8)),
          keyboardType: textInputType,
          obscureText: isPassword,
        ),
      ],
    );
  }
}
