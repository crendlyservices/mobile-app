import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../style/style.dart';

Widget loadingScreen() {
  return Container(
    margin: const EdgeInsets.only(top: 88),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'This would take a second',
            style: smallText,
          ),
          SizedBox(
            height: 53,
          ),
          CircularProgressIndicator(
            color: ColorManager.lightOrange,
            strokeWidth: 10,
          ),
        ],
      ),
    ),
  );
}
