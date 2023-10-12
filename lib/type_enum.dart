import 'package:hive_flutter/hive_flutter.dart';
part 'type_enum.g.dart';

@HiveType(typeId: 3)
enum TaskTypeEnum {
  @HiveField(0)
  working,
  @HiveField(1)
  friendlyDate,
  @HiveField(2)
  focus,
  @HiveField(3)
  OfficeWork,
  @HiveField(4)
  workMeeting,
}
