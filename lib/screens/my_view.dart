import 'package:flutter/material.dart';

class MyView extends StatefulWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("个人中心"),
    );
  }

  @override
  void initState() {
    super.initState();
    print("MyView");
  }

  @override
  bool get wantKeepAlive => true;
}
