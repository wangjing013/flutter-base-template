import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/profile.dart';
import '../utils/request.dart';

class Global {
  static late SharedPreferences _prefs;
  static Profile profile = Profile();
  // 全局的初始化功能
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }
    // 实例化请求
    Request();
  }

  // 持久化Profile信息
  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));
}
