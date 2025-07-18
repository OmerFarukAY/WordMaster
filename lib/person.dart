import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 0)
class person {
  person({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
});
  @HiveField(0)
  int id;

  @HiveField(1)
  String username;

  @HiveField(2)
  String password;

  @HiveField(3)
  String role;
}