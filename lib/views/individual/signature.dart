import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:crendly/controller/facial_scan_and_signature.dart';
import 'package:crendly/service/cloudinary_service.dart';
import 'package:crendly/service/cloudinary_service_impl.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/loading_screen.dart';
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
  final _faceScanAndSignatureController =
      Get.find<FaceScanAndSignatureController>();
  final CloudinaryService _cloudinaryService = CloudinaryServiceImpl();
  File? image;
  final ImagePicker _imagePicker = ImagePicker();

  pickImage(ImageSource imageSource) async {
    final image = await _imagePicker.pickImage(source: imageSource);
    if (image != null) {
      setState(() {
        this.image = File(image.path);
      });
    } else {
      throw Exception("Image is null");
    }
  }

  Future<String> saveImageToCloudinary(File fileImage) async {
    CloudinaryResponse response;
    try {
      response = await _cloudinaryService.uploadFileOnCloudinary(
          fileImage.path, CloudinaryResourceType.Auto);

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
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const OnboardingNavigation(
            text: 'Signature',
            value: 0.4,
          ),
          Obx(() => _faceScanAndSignatureController.isLoading.value
              ? loadingScreen()
              : Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    child: Column(
                      children: [
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
                                    child: image != null
                                        ? Image.file(image!)
                                        : Container(),
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
                        image != null
                            ? CustomELevatedButton(
                                text: 'Continue',
                                onPressed: () async {
                                  if (image != null) {
                                    _faceScanAndSignatureController
                                        .showLoading();
                                    File faceScanImage =
                                        _faceScanAndSignatureController
                                            .fileImage!;
                                    Future<String> faceScanImagePath =
                                        saveImageToCloudinary(faceScanImage);
                                    Future<String> signatureImagePath =
                                        saveImageToCloudinary(image!);
                                    _faceScanAndSignatureController
                                            .faceScanImagePath =
                                        await faceScanImagePath;
                                    _faceScanAndSignatureController
                                            .signaturePath =
                                        await signatureImagePath;
                                    _faceScanAndSignatureController
                                        .updateUserFaceScanAndSignature();
                                  }
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
                                      builder: (context) =>
                                          DraggableScrollableSheet(
                                              initialChildSize: 0.3,
                                              builder: (_, controller) =>
                                                  Container(
                                                      color: backgroundColor,
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons.cancel,
                                                                  color:
                                                                      iconColor,
                                                                )),
                                                          ),
                                                          Row(children: [
                                                            Column(
                                                              children: [
                                                                Container(
                                                                    margin:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      left: 31,
                                                                    ),
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      top: 14,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                        color: const Color(0xff4700E0),
                                                                        border: Border.all(
                                                                          color:
                                                                              const Color(0xff4700E0),
                                                                        )),
                                                                    height: 84,
                                                                    width: 84,
                                                                    child: GestureDetector(
                                                                        onTap: () async {
                                                                          pickImage(
                                                                              ImageSource.camera);
                                                                        },
                                                                        child: SvgPicture.asset("assets/images/carbon_scan-alt.svg"))),
                                                                const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              31),
                                                                  child: Text(
                                                                    'Scan Signature',
                                                                    style:
                                                                        smallText,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              width: 34,
                                                            ),
                                                            Column(
                                                              children: [
                                                                Container(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            14),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                        color: const Color(0xff4700E0),
                                                                        border: Border.all(
                                                                          color:
                                                                              const Color(0xff4700E0),
                                                                        )),
                                                                    height: 84,
                                                                    width: 84,
                                                                    child: GestureDetector(
                                                                        onTap: () async {
                                                                          pickImage(
                                                                              ImageSource.gallery);
                                                                        },
                                                                        child: SvgPicture.asset("assets/images/bx_upload.svg"))),
                                                                const Text(
                                                                  'From File',
                                                                  style:
                                                                      smallText,
                                                                )
                                                              ],
                                                            ),
                                                          ]),
                                                        ],
                                                      ))));
                                }),
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
                  ),
                ))
        ],
      ),
    );
  }

//Widget buildSheet() {}
}
