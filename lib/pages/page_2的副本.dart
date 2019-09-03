import 'package:flutter/material.dart';
import 'package:houses/main.dart';





class Page_2 extends StatefulWidget{
  _Page_2State createState()=> _Page_2State();
}

class _Page_2State extends State<Page_2> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 122,),
            Divider(indent: 10.0,),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: <Widget>[
            Container(
              width: screamWidth/24,
              child: SizedBox(
                 width: screamWidth/24,
               ),
            ),
            Row(

              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: FlatButton(
//                    child: Text("hhh"),
//                    color: Colors.transparent,
//                    disabledTextColor: Colors.transparent,
//                    splashColor: Colors.transparent,
////              highlightColor: Colors.blue,
////              onHighlightChanged: ,
//                    onPressed: (){
//
//                    },
//                  ),
//                ),
//                Expanded(
//                  flex: 1,
//                  child: FlatButton(
//                    child: Text("hhh"),
//                    color: Colors.transparent,
//                    disabledTextColor: Colors.transparent,
//                    splashColor: Colors.transparent,
////              highlightColor: Colors.blue,
////              onHighlightChanged: ,
//                    onPressed: (){
//
//                    },
//                  ),
//                ),


              ],
            ),
            Container(
              width: screamWidth/24,
              child: SizedBox(
                width: screamWidth/24,
              ),
            ),
          ],
        ),
      ),

    );
  }
}



class Test extends StatefulWidget{
  _TestState createState()=> _TestState();
}

class _TestState extends State<Test> {


  int _currentIndex=0;
//  var _pageList=[
//    HttpTestRoute(),
//    HttpPage(),
//    JsonPage()
//
//  ];

  var _headTitleList=[
    "demoPage",
    "http请求",
    "解析json"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this._headTitleList[this._currentIndex]}"),
      ),
      body: Container(),//this._pageList[this._currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int Index){
          setState(() {
            this._currentIndex=Index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_roll),
              title: Text("Demo")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("请求")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.print),
              title: Text("解析")
          )
        ],
      ),
    );
  }
}