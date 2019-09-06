import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/pages/page_2/page_2_1.dart';
import 'package:houses/pages/page_2/page_2_2.dart';
import 'package:houses/pages/page_2/page_2_3.dart';
import 'package:houses/pages/page_2/page_2_4.dart';



class Page_2 extends StatefulWidget{
  _Page_2State createState()=> _Page_2State();
}

class _Page_2State extends State<Page_2> {

  int _currentIndex=0;

  List _pageList=[
    Qyjs(),
    Ppry(),
    Fzlc(),
    Qywh(),
  ];
  List colorList=[
    Colors.black,
    Colors.red
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pageList[this._currentIndex],
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: (){
              setState(() {
                this._currentIndex=0;
              });
            },
            child: Text("企业介绍",style: TextStyle(color: colorList[_currentIndex==0?1:0]),),
          ),
          Text("|"),
          FlatButton(
            onPressed: (){
              setState(() {
                this._currentIndex=1;
              });
            },
            child: Text("品牌荣誉",style: TextStyle(color: colorList[_currentIndex==1?1:0]),),
          ),
          Text("|"),
          FlatButton(
            onPressed: (){
              setState(() {
                this._currentIndex=2;
              });
            },
            child: Text("发展历程",style: TextStyle(color: colorList[_currentIndex==2?1:0]),),
          ),
          Text("|"),
          FlatButton(
            onPressed: (){
              setState(() {
                this._currentIndex=3;
              });
            },
            child: Text("企业文化",style: TextStyle(color: colorList[_currentIndex==3?1:0]),),
          ),
        ],
      ),
    );
  }
}



