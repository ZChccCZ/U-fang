import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/myWidget/header.dart';
import 'package:houses/http/http_help.dart';
import 'package:houses/http/http_url.dart';

import 'dart:convert';


class Fzlc extends StatefulWidget{
  _FzlcState createState() => _FzlcState();
}

class _FzlcState extends State<Fzlc>{



  int _currentIndex=0;

  List _pageList=[
//    Ybf(),
//    Ybf(),
//    VRpage(),
  ];

  static HttpUrl httpUrl=new HttpUrl();

  HttpHelp httpHelp_P=new HttpHelp(httpUrl.brand_develop_backgroundImage_get);
  HttpHelp httpHelp_I=new HttpHelp(httpUrl.brand_develop_get);


  String requestBody_P="";
  String requestBody_I="";

  List<String> course_time=new List(4);
  List<String> course_title=new List(4);
  List<String> course_info=new List(4);
  List<String> course_Url=new List(4);

  void get_I()async{
    await httpHelp_I.get();
    setState(() {
      requestBody_I=httpHelp_I.getResponsBody();
      for(int i=0;i<4;i++){
        course_time[i]=jsonDecode(requestBody_I)["data"][i]["course_time"];
        course_title[i]=jsonDecode(requestBody_I)["data"][i]["course_title"];
        course_info[i]=jsonDecode(requestBody_I)["data"][i]["course_info"];
        course_Url[i]=jsonDecode(requestBody_I)["data"][i]["courseUrl"];
      }
    });
//    print(course_Url[1]);
  }

  void initState(){
    try{
      get_I();
      super.initState();
    }catch(e){
      print("加载");
    }
  }

  //TODO:获取项目信息，单独项目获取年月日等

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Header(),//头顶按钮
          Container(
            height: screamHeight/4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(course_Url[_currentIndex]==null?"":course_Url[_currentIndex],height: 315,),
                Text(course_time[_currentIndex]==null?"":course_time[_currentIndex],style: TextStyle(fontSize: 27),),
                SizedBox(height: 10,),
                Text(course_title[_currentIndex]==null?"":course_title[_currentIndex],style: TextStyle(fontSize: 22),),
                SizedBox(height: 5,),
                Text(course_info[_currentIndex]==null?"":course_info[_currentIndex],style: TextStyle(fontSize: 14),),
              ],
            ),
          ),
          SizedBox(height: 20,),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("1",style: TextStyle(fontSize: 15),),
                  onPressed: (){
                    setState(() {
                      _currentIndex=0;
                    });
                  },
                ),
                SizedBox(width: 20,),
                FlatButton(
                  child: Text("2",style: TextStyle(fontSize: 15),),
                  onPressed: (){
                    setState(() {
                      _currentIndex=1;
                    });
                  },
                ),
                SizedBox(width: 20,),
                FlatButton(
                  child: Text("3",style: TextStyle(fontSize: 15),),
                  onPressed: (){
                    setState(() {
                      _currentIndex=2;
                    });
                  },
                ),
                FlatButton(
                  child: Text("4",style: TextStyle(fontSize: 15),),
                  onPressed: (){
                    setState(() {
                      _currentIndex=3;
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