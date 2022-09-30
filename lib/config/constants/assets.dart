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

  String get homeMenu => '$basePath/home.svg';

  String get homeMenuFilled => '$basePath/home_filled.svg';

  String get finishedMenu => '$basePath/clipboard_check.svg';

  String get finishedMenuFilled => '$basePath/clipboard_check_filled.svg';

  String get searchMenu => '$basePath/search.svg';

  String get settingMenu => '$basePath/cog.svg';

  String get interesting => '$basePath/light_bulb.svg';

  String get shoppingCart => '$basePath/shopping_cart.svg';

  String get goals => '$basePath/goals.svg';

  String get guidance => '$basePath/guidance.svg';

  String get routineTask => '$basePath/routine_task.svg';

  String get backWithText => '$basePath/arrow_back_small.svg';

  String get back => '$basePath/arrow_back.svg';

  String get arrowRight => '$basePath/arrow_right.svg';

  String get arrowIn => '$basePath/arrow_in.svg';

  String get notification => '$basePath/bell.svg';

  String get bookMark => '$basePath/bookmark.svg';

  String get check => '$basePath/check.svg';

  String get clock => '$basePath/clock.svg';

  String get close => '$basePath/close.svg';

  String get delete => '$basePath/delete.svg';

  String get dragHandler => '$basePath/drag_handler.svg';

  String get edit => '$basePath/edit.svg';

  String get lockClosed => '$basePath/lock_closed.svg';

  String get logOut => '$basePath/log_out.svg';

  String get mail => '$basePath/mail.svg';

  String get more => '$basePath/more.svg';

  String get pencil => '$basePath/pencil.svg';

  String get plus => '$basePath/plus.svg';

  String get reply => '$basePath/reply.svg';

  String get tag => '$basePath/tag.svg';

  String get textSize => '$basePath/text_size.svg';

  String get upload => '$basePath/upload.svg';

  String get photo => '$basePath/photo.svg';

  String get camera => '$basePath/camera.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super("assets/images");

  String get illustrationStart => "$basePath/illus_start.svg";

  String get arrowIndicator => "$basePath/arrow_indicator.svg";

  String get illustrationNoFinished => "$basePath/no_finished.svg";

  String get illustrationFinish => "$basePath/still_finish.svg";

  String get userSettings => "$basePath/user.png";
}
