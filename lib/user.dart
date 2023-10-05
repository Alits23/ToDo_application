import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 3)
class User {
  User({required this.name, required this.age, required this.number});
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? age;
  @HiveField(2)
  int? number;
}
