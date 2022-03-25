import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';

class CustomELevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomELevatedButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  _CustomELevatedButtonState createState() => _CustomELevatedButtonState();
}

class _CustomELevatedButtonState extends State<CustomELevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: const TextStyle(
            fontFamily: 'kumbhSans',
            color: backgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      style: elevatedButtonStyle,
    );
  }
}
