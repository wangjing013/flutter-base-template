import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GuideView extends StatefulWidget {
  const GuideView({Key? key}) : super(key: key);

  @override
  State<GuideView> createState() => _GuideViewState();
}

class _GuideViewState extends State<GuideView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: const Text('前往首页'),
        onPressed: () {},
      ),
    );
  }
}
