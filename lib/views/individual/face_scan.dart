import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:crendly/controller/facial_scan_and_signature.dart';
import 'package:crendly/widgets/dialog.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/outline_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/color_manager.dart';
import '../../service/cloudinary_service.dart';
import '../../service/cloudinary_service_impl.dart';
import '../../style/style.dart';

class FaceScanView extends StatefulWidget {
  const FaceScanView({Key? key}) : super(key: key);

  @override
  _FaceScanViewState createState() => _FaceScanViewState();
}

class _FaceScanViewState extends State<FaceScanView> {
  final _faceScanController = Get.find<FaceScanAndSignatureController>();
  File? image;
  final CloudinaryService _cloudinaryService = CloudinaryServiceImpl();
  final ImagePicker _imagePicker = ImagePicker();

  pickImage(ImageSource imageSource, CameraDevice preferredCameraDevice) async {
    final image = await _imagePicker.pickImage(
        source: imageSource, preferredCameraDevice: preferredCameraDevice);
    if (image != null) {
      setState(() {
        this.image = File(image.path);
      });
      Future.delayed(const Duration(seconds: 3), () {
        dialog("assets/images/fac.svg", () {
          _faceScanController.fileImage = this.image;
          Get.toNamed('/signature');
        }, "Facial Recognition Complete", "continue");
        // Get.defaultDialog(
        //     backgroundColor: ColorManager.backgroundColor,
        //     barrierDismissible: true,
        //     title: '',
        //     content: Column(children: [
        //       SvgPicture.asset('assets/images/phone_android.svg'),
        //       const SizedBox(
        //         height: 100,
        //       ),
        //       const Text(
        //         'Facial Recognition Complete',
        //         style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 20,
        //           color: ColorManager.lightOrange,
        //           fontFamily: 'KumbhSans',
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 114,
        //       ),
        //       SizedBox(
        //         width: 150,
        //         child: ElevatedButton(
        //           onPressed: () async {
        //             Future<String> imagePath = saveImageToCloudinary();
        //
        //             _faceScanController.imagePath = await imagePath;
        //             Get.toNamed('/signature');
        //           },
        //           child: const Text(
        //             'Ok',
        //             style: TextStyle(color: Colors.white),
        //           ),
        //           style: ButtonStyle(
        //               minimumSize: MaterialStateProperty.all<Size>(
        //                   const Size.fromHeight(50)),
        //               shape: MaterialStateProperty.all<OutlinedBorder>(
        //                   const RoundedRectangleBorder(
        //                 side: BorderSide(
        //                   color: Color(0xff6DE7B4),
        //                 ),
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(10.0),
        //                 ),
        //               )),
        //               backgroundColor: MaterialStateProperty.all<Color>(
        //                   ColorManager.backgroundColor)),
        //         ),
        //       )
        //     ]));
      });
    } else {
      throw Exception("Image is null");
    }
  }

  Future<String> saveImageToCloudinary() async {
    CloudinaryResponse response;
    try {
      response = await _cloudinaryService.uploadFileOnCloudinary(
          image!.path, CloudinaryResourceType.Auto);

      print("Cloudinary response ${response.url}");
      return Future.value(response.secureUrl);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: image != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 32),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: headerBackColor,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 84),
                        child: Text(
                          'Scanning Face',
                          style: regularBoldFont,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 102,
                  ),
                  SizedBox(
                    height: 348,
                    width: 348,
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: FileImage(image!),
                        radius: 348,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    '100%',
                    style: regularFont,
                  ),
                ],
              ),
            )
          : Column(
              children: [
                const OnboardingNavigation(
                  text: 'Let\'s verify your address too',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 55,
                      ),
                      Center(
                        child: SvgPicture.asset("assets/images/scan.svg"),
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      const Center(
                        child: SizedBox(
                          width: 350,
                          child: Text(
                            'An Extra Authentication with your face',
                            style: subtitle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Scan your face to verify your identity',
                        style: TextStyle(
                            fontFamily: 'KumbhSans',
                            fontSize: 14,
                            color: ColorManager.lightOrange),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      CustomOutlineButton(
                          text: 'Scan face',
                          onPressed: () async {
                            pickImage(ImageSource.camera, CameraDevice.front);
                          }),
                      const SizedBox(
                        height: 66,
                      ),
                      const Text(
                        'Do this later',
                        style: skipText,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
