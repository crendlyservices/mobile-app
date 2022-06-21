import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../resources/color_manager.dart';

dialog(String asset, void Function() onPressed, String message,
    String callToAction) {
  return Get.defaultDialog(
      title: '',
      radius: 24,
      backgroundColor: ColorManager.dialogBackgroundColor,
      barrierDismissible: true,
      content: Column(children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: ColorManager.lightGreen,
          child: CircleAvatar(
              backgroundColor: ColorManager.dialogBackgroundColor,
              radius: 32,
              child: SvgPicture.asset(asset)),
        ),
        const SizedBox(
          height: 51,
          child: VerticalDivider(
            thickness: 1,
            color: ColorManager.lightGreen,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Center(
          child: Text(
            message,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: ColorManager.lightOrange,
              fontFamily: 'KumbhSans',
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        const SizedBox(
          height: 51,
          child: VerticalDivider(
            thickness: 1,
            color: ColorManager.lightGreen,
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              callToAction,
              style:
                  const TextStyle(color: Colors.white, fontFamily: "KumbhSans"),
            ),
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
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorManager.dialogBackgroundColor)),
          ),
        )
      ]));
}
