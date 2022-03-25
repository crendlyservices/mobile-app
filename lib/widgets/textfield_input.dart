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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontFamily: 'KumbhSans', color: Colors.white),
        ),
        const SizedBox(
          height: 6,
        ),
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
              enabledBorder: inputBorder,
              hintStyle: const TextStyle(
                color: Color(0xff797979),
                fontSize: 14,
                fontFamily: 'KumbhSans',
              ),
              suffixIcon: icon,
              hintText: hintText,
              contentPadding: const EdgeInsets.all(8)),
          keyboardType: textInputType,
          obscureText: isPassword,
        ),
      ],
    );
  }
}
