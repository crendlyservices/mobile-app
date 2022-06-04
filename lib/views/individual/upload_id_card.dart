import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:crendly/controller/select_id_card.dart';
import 'package:crendly/service/cloudinary_service.dart';
import 'package:crendly/service/cloudinary_service_impl.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/color_manager.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/textfield_input.dart';

class UploadIdCardView extends StatefulWidget {
  const UploadIdCardView({Key? key}) : super(key: key);

  @override
  _UploadIdCardViewState createState() => _UploadIdCardViewState();
}

class _UploadIdCardViewState extends State<UploadIdCardView> {
  final _selectIdCardController = Get.find<SelectIdCardController>();
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
            text: 'Select ID card',
            value: 0.4,
          ),
          const SizedBox(
            height: 47,
          ),
          SizedBox(
            width: 344,
            height: image != null ? 219 : 267,
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
                          : SvgPicture.asset('assets/images/id.svg'),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    image != null
                        ? Container()
                        : TextButton(
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
                                                  alignment:
                                                  Alignment.topRight,
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
                                                      margin: const EdgeInsets
                                                          .only(
                                                        left: 31,
                                                      ),
                                                      padding:
                                                      const EdgeInsets
                                                          .only(
                                                        top: 14,
                                                      ),
                                                      decoration:
                                                      BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8),
                                                          color: const Color(
                                                              0xff4700E0),
                                                          border:
                                                          Border.all(
                                                            color: const Color(
                                                                0xff4700E0),
                                                          )),
                                                      height: 84,
                                                      width: 84,
                                                      child: GestureDetector(
                                                          onTap: () async{
                                                            Future<String>
                                                            imagePath =
                                                            selectImageFromCamera();

                                                            _selectIdCardController
                                                                .imagePath =
                                                                await imagePath;

                                                          },
                                                          child: SvgPicture
                                                              .asset(
                                                              "assets/images/carbon_scan-alt.svg"))),
                                                  const SizedBox(
                                                    width: 34,
                                                  ),
                                                  Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(top: 14),
                                                      decoration:
                                                      BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8),
                                                          color: const Color(
                                                              0xff4700E0),
                                                          border:
                                                          Border.all(
                                                            color: const Color(
                                                                0xff4700E0),
                                                          )),
                                                      height: 84,
                                                      width: 84,
                                                      child: GestureDetector(
                                                          onTap: () async {
                                                            Future<String>
                                                            imagePath =
                                                            selectImageFromGallery();

                                                            _selectIdCardController
                                                                .imagePath =
                                                            await imagePath;
                                                          },
                                                          child: SvgPicture
                                                              .asset(
                                                              "assets/images/bx_upload.svg"))),
                                                ]),
                                              ],
                                            ))));
                        //Get.toNamed('/verify_id_card');
                      },
                      child: const Text(
                        'Upload Id card',
                        style: skipText,
                      ),
                    )
                  ],
                )),
          ),
          const SizedBox(
            height: 37,
          ),
          image != null
              ? Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Column(
                  children: [
                    TextFieldInput(
                      textEditingController:
                      _selectIdCardController.idNumberController,
                      label: 'ID Number',
                      hintText: '43245678912',
                      textInputType: TextInputType.text,
                      onChanged: (val) {
                        _selectIdCardController.idNumber = val;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 164,
                          child: TextFieldInput(
                            textEditingController: _selectIdCardController
                                .issuanceDateController,
                            label: 'Issue Date',
                            hintText: 'DD/MM/YY',
                            textInputType: TextInputType.text,
                            onChanged: (val) {
                              _selectIdCardController.issuanceDate = val;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 164,
                            child: TextFieldInput(
                              textEditingController:
                              _selectIdCardController
                                  .expiryDateController,
                              label: 'Expiry Date',
                              hintText: 'DD/MM/YY',
                              textInputType: TextInputType.text,
                              onChanged: (val) {
                                _selectIdCardController.expiryDate = val;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomELevatedButton(
                        text: 'Continue',
                        onPressed: () {
                          _selectIdCardController.uploadIdCard();
                        }),
                    const SizedBox(
                      height: 34,
                    ),
                    const Text(
                      'Provide another ID card',
                      style: skipText,
                    )
                  ],
                ),
              ),
            ),
          )
              : Container()
        ],
      ),
    );
  }

//Widget buildSheet() {}
}
