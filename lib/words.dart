import 'package:hive/hive.dart';

part 'words.g.dart';

@HiveType(typeId: 1)
class words {
  words({
    required this.turkish,
    required this.english,

  });
  @HiveField(0)
  String turkish;

  @HiveField(1)
  String english;


}