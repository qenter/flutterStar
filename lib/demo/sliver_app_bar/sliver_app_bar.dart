import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstar/util/density_utils.dart';

class SliverAppBarPage extends StatefulWidget {
  const SliverAppBarPage({Key? key}) : super(key: key);

  static skip(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SliverAppBarPage()));
  }

  @override
  State<SliverAppBarPage> createState() => _State();
}

class _State extends State<SliverAppBarPage> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  double bodyHeight = 0;
  double headHeight = 160;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double screenHeight = DensityUtils.getScreenHeight();
    bodyHeight = screenHeight - headHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // physics: NeverScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            backgroundColor: Colors.white,

            /// 控制返回按钮的样式，SizeBox() 可以去掉返回按钮
            // leading: const SizedBox(),
            foregroundColor: Colors.black,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              // titlePadding: const EdgeInsets.only(top: 20),
              title: Container(
                // height: 50,
                // color: Colors.red,
                child: const Text('SliverAppBar'),
              ),
              // background: FlutterLogo(),
              background: Image.asset(
                "assets/img/img_sliver_app_bar_header.jpg",
                fit: BoxFit.cover,
              ),
            ),
            // flexibleSpace: Container(
            //   child: Image.asset(
            //     "assets/img/img_sliver_app_bar_header.jpg",
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: bodyHeight,
              width: double.infinity,
              color: Colors.orange,
              child: Center(
                child: Text('Scroll to see the SliverAppBar in effect.'),
              ),
            ),
            // child: SliverAppBarItemShu(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),

      // bottomNavigationBar: BottomAppBar(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8),
      //     child: OverflowBar(
      //       overflowAlignment: OverflowBarAlignment.center,
      //       children: <Widget>[
      //         Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: <Widget>[
      //             const Text('pinned'),
      //             Switch(
      //               onChanged: (bool val) {
      //                 setState(() {
      //                   _pinned = val;
      //                 });
      //               },
      //               value: _pinned,
      //             ),
      //           ],
      //         ),
      //         Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: <Widget>[
      //             const Text('snap'),
      //             Switch(
      //               onChanged: (bool val) {
      //                 setState(() {
      //                   _snap = val;
      //                   // Snapping only applies when the app bar is floating.
      //                   _floating = _floating || _snap;
      //                 });
      //               },
      //               value: _snap,
      //             ),
      //           ],
      //         ),
      //         Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: <Widget>[
      //             const Text('floating'),
      //             Switch(
      //               onChanged: (bool val) {
      //                 setState(() {
      //                   _floating = val;
      //                   _snap = _snap && _floating;
      //                 });
      //               },
      //               value: _floating,
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
