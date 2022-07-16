import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const key = "com.obodo.taskapp";

  static setList(String json) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isSaved = await preferences.setString(key, json);
    print("$json save $isSaved");
  }

  static Future<String> getList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String json = preferences.getString(key);
    return json;
  }
}
