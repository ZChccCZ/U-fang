import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/pages/page_3/page_3_1.dart';


class Page_3 extends StatefulWidget{
  _Page_3State createState()=> _Page_3State();
}

class _Page_3State extends State<Page_3> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 10,
        child: Scaffold(
          body:TabBarView(
            children: <Widget>[
              Hxzs(),
              Text("户型2"),
              Text("户型3"),
              Text("户型4"),
              Text("户型5"),
              Text("户型1"),
              Text("户型2"),
              Text("户型3"),
              Text("户型4"),
              Text("户型5"),
            ],
          ),
          bottomSheet: TabBar(
            isScrollable: true,
            labelColor: Colors.black,

            tabs: <Widget>[
              Text("户型1"),
              Text("户型2"),
              Text("户型3"),
              Text("户型4"),
              Text("户型5"),
              Text("户型6"),
              Text("户型7"),
              Text("户型8"),
              Text("户型9"),
              Text("户型10"),
            ],
          ),
        ),
      ),
    );
  }
}