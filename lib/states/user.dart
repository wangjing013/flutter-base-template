import '../models/user.dart';
import 'profile_change_notifier.dart';

class UserModel extends ProfileChangeNotifier {
  User get user => profile.user;

  // APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => user.name != '';

  //用户信息发生变化，更新用户信息并通知依赖它的子孙 Widgets 更新
  set user(User user) {
    if (user.name != profile.user.name) {
      profile.user = user;
      notifyListeners();
    }
  }
}
