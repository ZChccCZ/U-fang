import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/myWidget/header.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:houses/pages/page_3/page_3_2.dart';
import 'package:houses/pages/page_3/page_3_3.dart';



class Hxzs extends StatefulWidget{
  _HxzsState createState()=> _HxzsState();
}

class _HxzsState extends State<Hxzs> {


/*
* 页面跳转*/
  int _currentIndex=0;

  List _pageList=[
    Ybf(),
    Pmt(),
    VRpage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Header(),//头顶按键
          Container(
            child: _pageList[this._currentIndex],
          ),
          SizedBox(height: 20,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("样板房",style: TextStyle(fontSize: 15),),
                  onPressed: (){
                    setState(() {
                      _currentIndex=0;
                    });
                  },
                ),
                SizedBox(width: 20,),
                FlatButton(
                  child: Text("平面图",style: TextStyle(fontSize: 15),),
                  onPressed: (){
                    setState(() {
                      _currentIndex=1;
                    });
                  },
                ),
                SizedBox(width: 20,),
                FlatButton(
                  child: Text("全景展示",style: TextStyle(fontSize: 15),),
                  onPressed: (){
                    setState(() {
                      _currentIndex=2;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}