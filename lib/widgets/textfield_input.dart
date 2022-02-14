import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String label;
  final String hintText;
  final Widget? icon;
  final TextInputType textInputType;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPassword = false,
      required this.label,
      required this.hintText,
      required this.textInputType,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 150.0, bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(color: Color(0xffFFFFFF)),
          ),
        ),
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
              suffixIcon: icon,
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
