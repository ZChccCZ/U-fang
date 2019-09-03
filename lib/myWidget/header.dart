import 'package:flutter/material.dart';
import 'package:houses/main.dart';

class Header extends StatefulWidget{
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: screamHeight/60,
          ),
          Row(
            //多重嵌套实现两个按钮平行左右分布
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: MaterialButton(//透明按钮
                    child: Text("返回",style: TextStyle(fontSize: 20),),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Expanded(
                flex:1,
                child: Container(
                  alignment: Alignment.topRight,
                  child: MaterialButton(//透明按钮
                    child: Text("我有意向>",style: TextStyle(fontSize: 20),),
                    onPressed: (){
                      Navigator.pushNamed(context, '/page_1_1');
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}
