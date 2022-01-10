import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarItemShu extends StatefulWidget {
  const SliverAppBarItemShu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SliverAppBarItemShu> {
  @override
  Widget build(BuildContext context) {
    return bodyWidget();
  }

  Widget bodyWidget() {
    return ListView.separated(
      itemCount: 200,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 36,
          width: double.infinity,
          child: Text(index.toString()),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
        );
      },
    );
  }
}
