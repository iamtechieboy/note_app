import 'package:hive/hive.dart';

part 'interesting_idea_model.g.dart';

@HiveType(typeId: 1)
class InterestingIdeaModel extends HiveObject {
  InterestingIdeaModel({
    this.noteType,
    this.title,
    this.noteBody,
    this.remindedDay,
    this.remindedTime,
    this.lastEditedTime,
    this.itemColor,
    this.labels,
    this.isFinished,
    this.isPinned,
  });

  InterestingIdeaModel.fromJson(dynamic json) {
    noteType = json['note_type'];
    title = json['title'];
    noteBody = json['note_body'];
    remindedDay = json['reminded_day'];
    remindedTime = json['reminded_time'];
    lastEditedTime = json['last_edited_time'];
    itemColor = json['item_color'];
    labels = json['labels'] != null ? json['labels'].cast<String>() : [];
    isFinished = json['isFinished'];
    isPinned = json['isPinned'];
  }

  @HiveField(0)
  String? noteType;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? noteBody;
  @HiveField(3)
  String? remindedDay;
  @HiveField(4)
  String? remindedTime;
  @HiveField(5)
  String? lastEditedTime;
  @HiveField(6)
  int? itemColor;
  @HiveField(7)
  List<String>? labels;
  @HiveField(8)
  bool? isFinished;
  @HiveField(9)
  bool? isPinned;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['note_type'] = noteType;
    map['title'] = title;
    map['note_body'] = noteBody;
    map['reminded_day'] = remindedDay;
    map['reminded_time'] = remindedTime;
    map['last_edited_time'] = lastEditedTime;
    map['item_color'] = itemColor;
    map['labels'] = labels;
    map['isFinished'] = isFinished;
    map['isPinned'] = isPinned;
    return map;
  }
}
