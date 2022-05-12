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
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              stops: [
                0.0,
                0.5,
                0.75,
                1.0
              ],
              colors: [
                Color(0xff63BEDB),
                Color(0xff56E77E),
                Color(0xff6DE7B4),
                Color(0xffE2FCC2),
              ])),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(widget.text, style: const TextStyle(
          fontFamily: "Kumbh Sans",
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: textButtonColor

        ),),
        style: elevatedButtonStyle,
      ),
    );
  }
}
