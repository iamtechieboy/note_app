import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'guidance_state.dart';

class GuidanceCubit extends Cubit<GuidanceState> {
  GuidanceCubit() : super(const GuidanceState(null));

  Future<void> openCamera() async {
    pickImage(ImageSource.camera);
  }

  Future<void> openGallery() async{
    pickImage(ImageSource.gallery);
  }

  Future<void> deleteImage() async{
    emit(const GuidanceState(null));
  }

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imageTemporary = File(image.path);
      emit(GuidanceState(imageTemporary));
    } on PlatformException {
      debugPrint("Platform expansion");
    } catch (e) {
      debugPrint("Failed to pick image: $e");
    }
  }
}
