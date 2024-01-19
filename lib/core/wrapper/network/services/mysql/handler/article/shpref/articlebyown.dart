import 'package:shared_preferences/shared_preferences.dart';

class Artibywn {
  static Future<void> saveList(List<String> list) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = list.toList();
    await prefs.setStringList('articleCreatedByThis', jsonList);
  }

  static Future<void> addValue(String articleID) async {
    List<String> list = await getList();
    list.add(articleID);
    await saveList(list);
  }

  static Future<List<String>> getList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('articleCreatedByThis');
    if (jsonList == null) {
      return [];
    }
    return jsonList;
  }
}
