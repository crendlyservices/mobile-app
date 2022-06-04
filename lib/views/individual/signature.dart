import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:crendly/controller/facial_scan_and_signature.dart';
import 'package:crendly/service/cloudinary_service.dart';
import 'package:crendly/service/cloudinary_service_impl.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/outline_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/color_manager.dart';
import '../../widgets/custom_elevated_button.dart';

class SignatureView extends StatefulWidget {
  const SignatureView({Key? key}) : super(key: key);

  @override
  _SignatureViewState createState() => _SignatureViewState();
}

class _SignatureViewState extends State<SignatureView> {
  final _signatureController = Get.find<FaceScanAndSignatureController>();
  final CloudinaryService _cloudinaryService = CloudinaryServiceImpl();
  File? image;
  final ImagePicker _imagePicker = ImagePicker();

  Future<String> selectImageFromGallery() async {
    CloudinaryResponse response;
    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final imageTemporary = File(image.path);
        response = await _cloudinaryService.uploadFileOnCloudinary(
            image.path, CloudinaryResourceType.Auto);
        setState(() {
          this.image = imageTemporary;
        });
        print("Cloudinary response ${response.url}");
        return Future.value(response.secureUrl);
      } else {
        throw Exception();
      }
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
      throw Exception();
    }
  }

  Future<String> selectImageFromCamera() async {
    final image = await _imagePicker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    CloudinaryResponse response;
    try {
      if (image != null) {
        final imageTemporary = File(image.path);
        response = await _cloudinaryService.uploadFileOnCloudinary(
            image.path, CloudinaryResourceType.Auto);
        setState(() {
          this.image = imageTemporary;
        });
        print("Cloudinary response ${response.url}");
        return Future.value(response.secureUrl);
      } else {
        throw Exception();
      }
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const OnboardingNavigation(
            text: 'Signature',
            value: 0.4,
          ),
          const SizedBox(
            height: 47,
          ),
          SizedBox(
            width: 344,
            height: 165,
            child: DottedBorder(
                color: ColorManager.dottedBorderColor,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 17,
                      ),
                      width: 310,
                      height: 157,
                      child: image != null ? Image.file(image!) : Container(),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 29,
          ),
          const Text(
            'Your signature for document authentication',
            style: regularBoldFont,
          ),
          const SizedBox(
            height: 10,
          ),
          image != null
              ? Container()
              : const Text(
                  'Please upload your signature',
                  style: TextStyle(
                      fontFamily: 'KumbhSans',
                      fontSize: 14,
                      color: ColorManager.lightOrange),
                ),
          const SizedBox(
            height: 103,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: image != null
                ? CustomELevatedButton(
                    text: 'Continue',
                    onPressed: () {
                      _signatureController.updateUserFaceScanAndSignature();
                    })
                : CustomOutlineButton(
                    text: "Upload Signature",
                    onPressed: () {
                      showModalBottomSheet(
                          isDismissible: false,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          context: context,
                          builder: (context) => DraggableScrollableSheet(
                              initialChildSize: 0.3,
                              builder: (_, controller) => Container(
                                  color: backgroundColor,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: const Icon(
                                              Icons.cancel,
                                              color: iconColor,
                                            )),
                                      ),
                                      Row(children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                              left: 31,
                                            ),
                                            padding: const EdgeInsets.only(
                                              top: 14,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xff4700E0),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xff4700E0),
                                                )),
                                            height: 84,
                                            width: 84,
                                            child: GestureDetector(
                                                onTap: () async {
                                                  Future<String> imagePath =
                                                      selectImageFromCamera();

                                                  _signatureController
                                                          .signaturePath =
                                                      await imagePath;
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/images/carbon_scan-alt.svg"))),
                                        const SizedBox(
                                          width: 34,
                                        ),
                                        Container(
                                            padding:
                                                const EdgeInsets.only(top: 14),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color(0xff4700E0),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xff4700E0),
                                                )),
                                            height: 84,
                                            width: 84,
                                            child: GestureDetector(
                                                onTap: () async {
                                                  Future<String> imagePath =
                                                      selectImageFromGallery();

                                                  _signatureController
                                                          .signaturePath =
                                                      await imagePath;
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/images/bx_upload.svg"))),
                                      ]),
                                    ],
                                  ))));
                    }),
          ),
          const SizedBox(
            height: 86,
          ),
          image != null
              ? TextButton(
                  child: const Text(
                    'Provide New Signature',
                    style: skipText,
                  ),
                  onPressed: () {
                    setState(() {
                      image = null;
                    });
                  })
              : const Text(
                  'Do this later',
                  style: skipText,
                ),
        ],
      ),
    );
  }

//Widget buildSheet() {}
}
