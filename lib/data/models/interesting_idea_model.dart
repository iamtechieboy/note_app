import 'package:hive/hive.dart';

/// note_type : ""
/// title : "Interesting idea"
/// note_body : " Create a mobile app UI Kit that provide a basic notes functionality but with some improveme "
/// reminded_time : "09/28/2022 14:30"
/// last_edited_time : "09/28/2022 14:30"
/// item_color : 1
/// labels : ["important","Top Priority","Should be done this week"]
/// isFinished : false

part 'interesting_idea_model.g.dart';

@HiveType(typeId: 1)
class InterestingIdeaModel extends HiveObject {
  InterestingIdeaModel({
    String? noteType,
    String? title,
    String? noteBody,
    String? remindedTime,
    String? lastEditedTime,
    num? itemColor,
    List<String>? labels,
    bool? isFinished,
  }) {
    _noteType = noteType;
    _title = title;
    _noteBody = noteBody;
    _remindedTime = remindedTime;
    _lastEditedTime = lastEditedTime;
    _itemColor = itemColor;
    _labels = labels;
    _isFinished = isFinished;
  }

  InterestingIdeaModel.fromJson(dynamic json) {
    _noteType = json['note_type'];
    _title = json['title'];
    _noteBody = json['note_body'];
    _remindedTime = json['reminded_time'];
    _lastEditedTime = json['last_edited_time'];
    _itemColor = json['item_color'];
    _labels = json['labels'] != null ? json['labels'].cast<String>() : [];
    _isFinished = json['isFinished'];
  }

  @HiveField(0)
  String? _noteType;
  @HiveField(1)
  String? _title;
  @HiveField(2)
  String? _noteBody;
  @HiveField(3)
  String? _remindedTime;
  @HiveField(4)
  String? _lastEditedTime;
  @HiveField(5)
  num? _itemColor;
  @HiveField(6)
  List<String>? _labels;
  @HiveField(8)
  bool? _isFinished;

  InterestingIdeaModel copyWith({
    String? noteType,
    String? title,
    String? noteBody,
    String? remindedTime,
    String? lastEditedTime,
    num? itemColor,
    List<String>? labels,
    bool? isFinished,
  }) =>
      InterestingIdeaModel(
        noteType: noteType ?? _noteType,
        title: title ?? _title,
        noteBody: noteBody ?? _noteBody,
        remindedTime: remindedTime ?? _remindedTime,
        lastEditedTime: lastEditedTime ?? _lastEditedTime,
        itemColor: itemColor ?? _itemColor,
        labels: labels ?? _labels,
        isFinished: isFinished ?? _isFinished,
      );

  String? get noteType => _noteType;

  String? get title => _title;

  String? get noteBody => _noteBody;

  String? get remindedTime => _remindedTime;

  String? get lastEditedTime => _lastEditedTime;

  num? get itemColor => _itemColor;

  List<String>? get labels => _labels;

  bool? get isFinished => _isFinished;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['note_type'] = _noteType;
    map['title'] = _title;
    map['note_body'] = _noteBody;
    map['reminded_time'] = _remindedTime;
    map['last_edited_time'] = _lastEditedTime;
    map['item_color'] = _itemColor;
    map['labels'] = _labels;
    map['isFinished'] = _isFinished;
    return map;
  }
}
