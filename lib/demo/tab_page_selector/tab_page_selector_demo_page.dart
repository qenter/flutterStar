import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstar/demo/app_bar/app_bar_factory.dart';
import 'package:flutterstar/util/density_utils.dart';

class TabPageSelectorDemoPage extends StatefulWidget {
  const TabPageSelectorDemoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();

  static skip(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const TabPageSelectorDemoPage()));
  }
}

class _State extends State<TabPageSelectorDemoPage>
    with SingleTickerProviderStateMixin {
  List list = [
    "https://img97.mm3.cc:9797/attach/2021-06-05/1622824834SFNu.jpg",
    "https://img97.mm3.cc:9797/attach/2021-06-05/1622824835Hfpj.jpg",
    "https://img97.mm3.cc:9797/attach/2021-06-05/1622824838nnDI.jpg",
    "https://img97.mm3.cc:9797/attach/2021-06-05/1622824841guIA.jpg",
  ];

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: list.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.onlyBackAppBar("TabPageSelector Demo"),
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromRGBO(200, 200, 200, 0.5),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: DensityUtils.getScreenHeight() / 3 * 2,
              child: PageView.builder(
                  itemCount: list.length,
                  onPageChanged: (index) {
                    _tabController.index = index;
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      list[index],
                      width: 120,
                      fit: BoxFit.cover,
                    );
                  }),
            ),
            TabPageSelector(
              selectedColor: Colors.white,
              color: Colors.black45,
              controller: _tabController,
            ),
          ],
        ));
  }
}
