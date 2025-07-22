import 'package:hive/hive.dart';


class RoleManager {
  static String? currentRole;

  static void loadRole() {
    final box = Hive.box("userBox");
    currentRole = box.get("role");
  }

  static void clearRole() {
    final box = Hive.box("userBox");
    box.delete("role");
    currentRole = null;
  }
}
