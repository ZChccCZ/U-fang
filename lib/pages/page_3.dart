import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/pages/page_3/page_3_1.dart';


class Page_3 extends StatefulWidget{
  _Page_3State createState()=> _Page_3State();
}

class _Page_3State extends State<Page_3> {

  int length=5;//TODO:实现动态添加
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: length,
        child: Scaffold(
          body:TabBarView(
            children: <Widget>[
              Hxzs(),
              Hxzs(),
              Text("户型3"),
              Text("户型4"),
              Text("户型5"),
//              Text("户型1"),
//              Text("户型2"),
//              Text("户型3"),
//              Text("户型4"),
//              Text("户型5"),
            ],
          ),
          bottomSheet: TabBar(
            isScrollable: true,
            labelColor: Colors.black,

            tabs: <Widget>[
              Text(" 户型1 ",style: TextStyle(fontSize: 20,fontFamily: "Rock Salt"),),
              Text(" 户型2 ",style: TextStyle(fontSize: 20),),
              Text(" 户型3 ",style: TextStyle(fontSize: 20),),
              Text(" 户型4 ",style: TextStyle(fontSize: 20),),
              Text(" 户型5 ",style: TextStyle(fontSize: 20),),
//              Text("户型6"),
//              Text("户型7"),
//              Text("户型8"),
//              Text("户型9"),
//              Text("户型10"),
            ],
          ),
        ),
      ),
    );
  }
}