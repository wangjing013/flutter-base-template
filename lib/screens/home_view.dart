import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../routers/app_routes.dart';
import '../states/user.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print("HomeView");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Consumer<UserModel>(
            builder: (context, value, child) =>
                Text(value.isLogin ? '已登录' : '未登录'),
          ),
          MaterialButton(
            onPressed: () => {GoRouter.of(context).go(Routes.animate)},
            child: const Text("跳转动画"),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
