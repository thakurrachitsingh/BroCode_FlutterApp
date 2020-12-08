import 'package:BroCode_FlutterApp/Style/style.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final int index;
  const CustomTabBar({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: primaryColor),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: CustomTabBarButton(
            text: "CHATS",
            textColor: index == 1 ? textIconColorGray : Colors.white,
            borderColor: index == 1 ? Colors.white : Colors.transparent,
          )),
          Expanded(
              child: CustomTabBarButton(
            text: "STATUS",
            textColor: index == 2 ? textIconColorGray : Colors.white,
            borderColor: index == 2 ? Colors.white : Colors.transparent,
          )),
          Expanded(
              child: CustomTabBarButton(
            text: "CALLS",
            textColor: index == 3 ? textIconColorGray : Colors.white,
            borderColor: index == 3 ? Colors.white : Colors.transparent,
          ))
        ],
      ),
    );
  }
}

class CustomTabBarButton extends StatelessWidget {
  final Color borderColor;
  final String text;
  final Color textColor;
  final double borderWidth;

  const CustomTabBarButton(
      {Key key,
      this.borderColor,
      this.text,
      this.textColor,
      this.borderWidth = 3})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: borderColor, width: borderWidth),
      )),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
      ),
    );
  }
}
