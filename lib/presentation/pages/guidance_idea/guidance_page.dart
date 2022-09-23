import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/config/constants/app_colors.dart';
import 'package:note_app/config/constants/app_decoration.dart';
import 'package:note_app/config/constants/app_text_style.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/circular_icon_place.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';

import '../../../config/constants/assets.dart';

class GuidancePage extends StatefulWidget {
  const GuidancePage({super.key});

  @override
  State<GuidancePage> createState() => _GuidancePageState();
}

class _GuidancePageState extends State<GuidancePage> {
  File? images;

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        images = imageTemporary;
      });
    } on PlatformException {
      debugPrint("Platform exepsion");
    } catch (e) {
      debugPrint("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: size.width - 32,
                    child: Flexible(
                      child: TextFormField(
                        style: AppTextStyle.bold2Xl,
                        maxLines: null,
                        minLines: null,
                        keyboardType: TextInputType.multiline,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Title Here",
                          hintStyle: AppTextStyle.bold2Xl.copyWith(
                            color: AppColors.neutralColor.baseGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  images != null
                      ? Container(
                          decoration: AppDecoration.defDecor.copyWith(
                              borderRadius: BorderRadius.circular(15)),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  images!,
                                  width: double.infinity,
                                  height: 350,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            leading:
                                                const Icon(Icons.camera_alt),
                                            title: const Text("Camera"),
                                            onTap: () {
                                              pickImage(ImageSource.camera);
                                            },
                                          ),
                                          ListTile(
                                            leading: const Icon(Icons.image),
                                            title: const Text("Gallery"),
                                            onTap: () {
                                              pickImage(ImageSource.gallery);
                                            },
                                          ),
                                          ListTile(
                                            leading: SvgPicture.asset(
                                                "assets/icons/delete.svg"),
                                            title: const Text("Delete"),
                                            onTap: () {
                                              setState(() {
                                                images = null;
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(15),
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.neutralColor.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: SvgPicture.asset(
                                      "assets/icons/pencil.svg"),
                                ),
                              ),
                            ],
                          ),
                        )
                      : DottedBorder(
                          dashPattern: const [12, 12],
                          strokeWidth: 1.3,
                          color: AppColors.neutralColor.baseGrey,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(15),
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              alignment: Alignment.center,
                              height: 300,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularIconPlace(
                                    height: 58,
                                    icon: Assets.icons.photo,
                                    iconColor: AppColors.primaryColor.base,
                                    background: AppColors.primaryColor.light,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                      "Upload an Image to your guidance can be choose for you",
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.mediumSm.copyWith(
                                        color: AppColors.neutralColor.baseGrey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      pickImage(ImageSource.gallery);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor.base,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Text(
                                        "Choose a file",
                                        style: AppTextStyle.mediumXl.copyWith(
                                            color: AppColors.primaryColor.light,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Flexible(
                      child: TextFormField(
                        style: AppTextStyle.mediumBase
                            .copyWith(color: AppColors.neutralColor.darkGrey),
                        maxLines: null,
                        minLines: null,
                        keyboardType: TextInputType.multiline,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Title Here",
                          hintStyle: AppTextStyle.mediumBase.copyWith(
                            color: AppColors.neutralColor.baseGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomTaskBar(context: context),
        ],
      ),
    );
  }
}
