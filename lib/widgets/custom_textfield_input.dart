import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';

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
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 250.0, bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(color: Color(0xffFFFFFF)),
          ),
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
                        color: Color.fromRGBO(254, 208, 183, 1),
                      ),
                    )
                  ],
                ),
              ),
              suffixIcon: suffixIcon,
              hintText: hintText,
              border: inputBorder,
              contentPadding: const EdgeInsets.all(8)),
          keyboardType: textInputType,
          obscureText: isPassword,
        ),
      ],
    );
  }
}
