import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:crendly/service/cloudinary_service.dart';
import 'package:crendly/service/cloudinary_service_impl.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadIdCardView extends StatefulWidget {
  const UploadIdCardView({Key? key}) : super(key: key);

  @override
  _UploadIdCardViewState createState() => _UploadIdCardViewState();
}

class _UploadIdCardViewState extends State<UploadIdCardView> {
  final CloudinaryService _cloudinaryService = CloudinaryServiceImpl();
  File? image;
  final ImagePicker _imagePicker = ImagePicker();
  Future<CloudinaryResponse> selectImageFromGallery() async {
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
        return response;
      } else {
        throw Exception();
      }
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
      throw Exception();
    }
  }

  Future selectImageFromCamera() async {
    final image = await _imagePicker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    if (image == null) return;

    final imageTemporary = File(image.path);
    this.image = imageTemporary;
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
            height: 267,
            child: DottedBorder(
                child: Column(
              children: [
                image != null
                    ? Image.file(image!)
                    : SvgPicture.asset('assets/images/id.svg'),
                const SizedBox(
                  height: 35,
                ),
                TextButton(
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
                                child: Row(children: [
                                  Container(
                                      padding: const EdgeInsets.only(
                                        top: 14,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xff4700E0),
                                          border: Border.all(
                                            color: const Color(0xff4700E0),
                                          )),
                                      height: 84,
                                      width: 84,
                                      child: IconButton(
                                          onPressed: () {
                                            selectImageFromCamera();
                                          },
                                          icon: const Icon(
                                              Icons.settings_overscan_sharp,
                                              color: Colors.white,
                                              size: 55))),
                                  const SizedBox(
                                    width: 34,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 14),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xff4700E0),
                                          border: Border.all(
                                            color: const Color(0xff4700E0),
                                          )),
                                      height: 84,
                                      width: 84,
                                      child: IconButton(
                                          onPressed: () {
                                            selectImageFromGallery();
                                          },
                                          icon: const Icon(
                                            Icons.upload_outlined,
                                            color: Colors.white,
                                            size: 55,
                                          ))),
                                ]))));
                    //Get.toNamed('/verify_id_card');
                  },
                  child: image != null
                      ? Container()
                      : const Text(
                          'Upload Id card',
                          style: skipText,
                        ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }

  //Widget buildSheet() {}
}
