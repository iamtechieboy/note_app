abstract class Assets {
  const Assets._();

  static _Icons get icons => const _Icons();

  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super("assets/icons");

// String get homeMenu => '$basePath/';

}

class _Images extends _AssetsHolder {
  const _Images() : super("assets/images");

// String get userAvatar1 => "$basePath/"

}
