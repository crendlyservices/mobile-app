import 'package:flutter/material.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xffB4DDC5),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      Image.asset('assets/images/Vector.png')
    ]);
  }
}
