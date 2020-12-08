import 'package:BroCode_FlutterApp/Page/call_page.dart';
import 'package:BroCode_FlutterApp/Page/camera_page.dart';
import 'package:BroCode_FlutterApp/Page/chat_page.dart';
import 'package:BroCode_FlutterApp/Page/status_page.dart';
import 'package:BroCode_FlutterApp/Style/custom_tabBar.dart';
import 'package:flutter/material.dart';
import 'package:BroCode_FlutterApp/Style/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int z = 0;
  int _currentPageIndex = 1;
  bool _isSearch = false;
  PageController _pageController = PageController(initialPage: 1);
  List<Widget> _page = [CameraPage(), ChatPage(), StatusPage(), CallPage()];

  _buildSearch() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
          // color: Colors.white,
          boxShadow: [
            // BoxShadow(
            //   color: Colors.black.withOpacity(.3),
            //   spreadRadius: 1,
            //   offset: Offset(0.0,0.50)
            // )
          ]),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search...",
            prefixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isSearch = false;
                });
              },
              child: Icon(Icons.arrow_back),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPageIndex != 0
          ? AppBar(
              elevation: 0.0,
              automaticallyImplyLeading: false,
              backgroundColor:
                  _isSearch == false ? primaryColor : Colors.transparent,
              title: _isSearch == false
                  ? Text("WhatsApp")
                  : Container(
                      height: 0.0,
                      width: 0.0,
                    ),
              flexibleSpace: _isSearch == false
                  ? Container(
                      height: 0.0,
                      width: 0.0,
                    )
                  : _buildSearch(),
              actions: <Widget>[
                InkWell(
                    onTap: () {
                      setState(() {
                        _isSearch = true;
                      });
                    },
                    child: Icon(Icons.search)),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.more_vert),
              ],
            )
          : null,
      body: Column(
        children: <Widget>[
          _isSearch == false
              ? _currentPageIndex != 0
                  ? CustomTabBar(index: _currentPageIndex)
                  : Container(
                      height: 0,
                      width: 0,
                    )
              : Container(
                  height: 0,
                  width: 0,
                ),
          Expanded(
              child: PageView.builder(
                  itemCount: _page.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  itemBuilder: (_, index) {
                    return _page[index];
                  })),
        ],
      ),
    );
  }
}
