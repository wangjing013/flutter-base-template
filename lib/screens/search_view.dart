import 'package:flutter/widgets.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print("SearchView");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("查询中心"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
