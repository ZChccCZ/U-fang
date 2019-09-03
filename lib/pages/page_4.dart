import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/pages/page_4/page_4_1.dart';
import 'package:houses/pages/page_4/page_4_2.dart';



class Page_4 extends StatefulWidget{
  _Page_4State createState()=> _Page_4State();
}

class _Page_4State extends State<Page_4> {

  int _currentIndex=0;

  List _pageList=[
    Zbss(),
    Ylmj(),
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
            child: Text("周边设施",style: TextStyle(fontSize: 15),),
          ),
          SizedBox(width: 25,),
          FlatButton(
            onPressed: (){
              setState(() {
                this._currentIndex=1;
              });
            },
            child: Text("园林美景",style: TextStyle(fontSize: 15),),
          ),
        ],
      ),
    );
  }
}