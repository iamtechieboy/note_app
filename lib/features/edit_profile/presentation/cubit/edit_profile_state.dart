part of 'edit_profile_cubit.dart';

class EditProfileState {
  const EditProfileState(this.images);

  final File? images;

  EditProfileState copyWith(File? images) => EditProfileState(images ?? this.images);
}
