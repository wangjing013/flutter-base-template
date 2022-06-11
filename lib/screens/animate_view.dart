import 'dart:async';

import 'package:flutter/material.dart';

class AnimateView extends StatefulWidget {
  const AnimateView({Key? key}) : super(key: key);

  @override
  State<AnimateView> createState() => _AnimateViewState();
}

class Item {
  String? value;
  bool? checked;
  Item({this.value = '', this.checked = false});
}

class _AnimateViewState extends State<AnimateView> {
  var data = <Item>[];
  int counter = 5;
  late Item selectedA;
  late Item selectedB;

  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    for (var i = 0; i < counter; i++) {
      data.add(Item(value: '张三', checked: false));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('动画'),
        ),
        body: Stack(
          children: [
            AnimatedList(
              key: globalKey,
              initialItemCount: data.length,
              itemBuilder: (
                BuildContext context,
                int index,
                Animation<double> animation,
              ) {
                //添加列表项时会执行渐显动画
                return FadeTransition(
                  opacity: animation,
                  child: buildItem(context, index),
                );
              },
            ),
            buildAddBtn(),
          ],
        ));
  }

  // 创建一个 “+” 按钮，点击后会向列表中插入一项
  Widget buildAddBtn() {
    return Positioned(
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // 添加一个列表项
          data.add(Item(value: '${++counter}', checked: false));
          // 告诉列表项有新添加的列表项
          globalKey.currentState!.insertItem(data.length - 1);
          print('添加 $counter');
        },
      ),
      bottom: 30,
      left: 0,
      right: 0,
    );
  }

  // 构建列表项
  Widget buildItem(context, index) {
    Item char = data[index];
    return Container(
      child: char.value == ''
          ? const Text('被删除了')
          : Checkbox(
              value: char.checked,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                var findIndex = -1;
                for (var i = 0; i < data.length; i++) {
                  if (data[i].checked == true) {
                    findIndex = i;
                    break;
                  }
                }
                if (findIndex == -1) {
                  char.checked = value;
                  setState(() {
                    data = data;
                  });
                } else {
                  char.checked = value;
                  if (char.checked == true) {
                    Timer(const Duration(milliseconds: 200), () {
                      onDelete(context, index, findIndex);
                    });
                  } else {
                    setState(() {
                      data = data;
                    });
                  }
                }
              },
            ),
    );
  }

  void onDelete(context, oneIndex, twoIndex) {
    // 待实现
    List<Item> tlp = data;
    tlp[oneIndex] = Item();
    tlp[twoIndex] = Item();
    setState(() {
      data = tlp;
    });
  }
}
