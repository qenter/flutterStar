import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstar/demo/sliver_app_bar/sliver_app_bar_new.dart';
import 'package:flutterstar/demo/tab_page_selector/tab_page_selector_demo_page.dart';

class DemoMainPage extends StatefulWidget {
  const DemoMainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<DemoMainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('测试入口'),
        ),
        body: bodyWidget(),
      ),
    );
  }

  Widget bodyWidget() {
    ButtonStyle _textButtonStyle = TextButton.styleFrom(
        backgroundColor: Colors.black12,
        primary: Colors.black,
        padding: const EdgeInsets.fromLTRB(16, 4, 8, 4));
    // TextStyle _textStyle = const TextStyle(color: Colors.orange);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              style: _textButtonStyle,
              onPressed: () {
                // SliverAppBarPage.skip(context);
                SliverAppBarNewPage.skip(context);
              },
              child: const Text(
                "SliverAppBar",
                // style: _textStyle,
              )),
          TextButton(
              style: _textButtonStyle,
              onPressed: () {
                // SliverAppBarPage.skip(context);
                TabPageSelectorDemoPage.skip(context);
              },
              child: const Text(
                "TabPageSelector",
                // style: _textStyle,
              ))
        ],
      ),
    );
  }
}
