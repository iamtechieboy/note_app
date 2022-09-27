part of 'guidance_cubit.dart';

@immutable
class GuidanceState {
  const GuidanceState(this.images);

  final File? images;

  GuidanceState copyWith(File? images) =>
      GuidanceState(images ?? this.images);
}
