import 'package:flutter/material.dart';

class SliverAppBarNewPage extends StatefulWidget {
  const SliverAppBarNewPage({Key? key}) : super(key: key);

  static skip(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SliverAppBarNewPage()));
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SliverAppBarNewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _tabs = [
    "Tab 1",
    "Tab 2",
    "Tab 3",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          /// 加TabBar
          NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                foregroundColor: Colors.black,
                // title: const Text('标题'),
                title: TabBar(
                  controller: _tabController,
                  tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                ),
                leading: const SizedBox(),
                centerTitle: false,
                pinned: true,
                floating: false,
                snap: false,
                primary: true,
                expandedHeight: 230.0,

                elevation: 10,
                //是否显示阴影，直接取值innerBoxIsScrolled，展开不显示阴影，合并后会显示
                forceElevated: innerBoxIsScrolled,

                // actions: <Widget>[
                //   new IconButton(
                //     icon: Icon(Icons.more_horiz),
                //     onPressed: () {
                //       print("更多");
                //     },
                //   ),
                // ],

                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                      "assets/img/img_sliver_app_bar_header.jpg",
                      fit: BoxFit.fill),
                ),

                // bottom: TabBar(
                //   controller: _tabController,
                //   tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                // ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          // These are the contents of the tab views, below the tabs.
          children: _tabs.map((String name) {
            //SafeArea 适配刘海屏的一个widget
            return SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(10.0),
                        sliver: SliverFixedExtentList(
                          itemExtent: 50.0, //item高度或宽度，取决于滑动方向
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return ListTile(
                                title: Text('Item $index'),
                              );
                            },
                            childCount: 30,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),

      /// 不加TabBar
      //     new CustomScrollView(
      //   slivers: <Widget>[
      //     new SliverAppBar(
      //       leading: new IconButton(
      //         icon: Icon(Icons.arrow_back),
      //         onPressed: () {},
      //       ),
      //       title: Text("标题"),
      //       actions: <Widget>[
      //         new IconButton(
      //           icon: Icon(Icons.add),
      //           onPressed: () {
      //             print("添加");
      //           },
      //         ),
      //         new IconButton(
      //           icon: Icon(Icons.more_horiz),
      //           onPressed: () {
      //             print("更多");
      //           },
      //         ),
      //       ],
      //       expandedHeight: 230.0,
      //       floating: false,
      //       pinned: true,
      //       snap: false,
      //       brightness: Brightness.dark,
      //       flexibleSpace: new FlexibleSpaceBar(
      //         background: Image.asset(
      //             "assets/img/img_sliver_app_bar_header.jpg",
      //             fit: BoxFit.fill),
      //       ),
      //     ),
      //     new SliverFixedExtentList(
      //       itemExtent: 50.0,
      //       delegate: new SliverChildBuilderDelegate(
      //         (context, index) => new ListTile(
      //           title: new Text("Item $index"),
      //         ),
      //         childCount: 30,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
