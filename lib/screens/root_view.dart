import 'package:flutter/material.dart';
import 'package:flutter_base_template/models/user.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import '../states/user.dart';
import 'home_view.dart';
import 'my_view.dart';
import 'search_view.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final PageController _pageContorl =
      PageController(initialPage: 0, keepPage: true);
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    var userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageContorl,
        scrollDirection: Axis.horizontal, // 滚动方向
        children: const [HomeView(), SearchView(), MyView()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          onTap: (value) {
            if (value == _currentIndex) {
              return;
            }
            _pageContorl.jumpToPage(value);
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "My",
              icon: Icon(Icons.account_circle),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {
          userModel.user = User.fromJson({"name": "张三", "age": 20})
        },
      ),
    );
  }
}
