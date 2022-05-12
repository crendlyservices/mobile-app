import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController? textEditingController;
  final bool isPassword;
  final bool enabled;
  final String label;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  void Function(String)? onChanged;
  TextFieldInput(
      {Key? key,
      this.textEditingController,
      this.isPassword = false,
      this.enabled = true,
      required this.label,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(color: Color(0xffFFFFFF)),
          ),
        ),
        TextField(
          controller: textEditingController,
          style: regularFont,
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintStyle: smallText,
              enabled: enabled,
              disabledBorder: inputBorder,
              hintText: hintText,
              enabledBorder: inputBorder,
              focusedBorder: inputBorder,
              border: inputBorder,
              contentPadding: const EdgeInsets.all(8)),
          keyboardType: textInputType,
          obscureText: isPassword,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
