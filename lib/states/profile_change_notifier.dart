import 'package:flutter/foundation.dart';

import '../common/global.dart';
import '../models/profile.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); //保存 Profile 变更
    super.notifyListeners(); //通知依赖的 Widget更新
  }
}
