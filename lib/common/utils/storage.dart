import 'package:shared_preferences/shared_preferences.dart';

class SharedUtil {
  /// 根据Key取值
  static getValue(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String value = sp.get(key);
    if (value == null) return "";
    return value;
  }

  /// 根据key设置值
  static setValue(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }
}
