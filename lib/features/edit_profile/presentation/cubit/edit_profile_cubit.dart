import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(const EditProfileState(null));

  Future<void> openingCamera() async {
    pickImage(ImageSource.camera);
  }

  Future<void> openGallery() async {
    pickImage(ImageSource.gallery);
  }

  Future<void> deleteingImage() async {
    emit(const EditProfileState(null));
  }

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imageTemporary = File(image.path);
      emit(EditProfileState(imageTemporary));
    } on PlatformException {
      debugPrint("Platform expansion");
    } catch (e) {
      debugPrint("Failed to pick image: $e");
    }
  }
}
