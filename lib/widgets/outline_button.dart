import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomOutlineButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  _CustomOutlineButtonState createState() => _CustomOutlineButtonState();
}

class _CustomOutlineButtonState extends State<CustomOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: widget.onPressed,
        child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (rect) => const LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color(0xff63BEDB),
                      Color(0xff56E77E),
                      Color(0xff6DE7B4),
                      Color(0xffE2FCC2),
                    ]).createShader(rect),
            child: Text(widget.text)),
        style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xff6DE7B4),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            )),
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor)),
      ),
    );
  }
}
