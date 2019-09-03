import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/http/http_help.dart';
import 'package:houses/http/http_url.dart';

import 'dart:convert';


class HomeContent extends StatefulWidget{
  _HomeContentState createState()=> _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  static HttpUrl httpUrl=new HttpUrl();

  HttpHelp httpHelp=new HttpHelp(httpUrl.homepage_get);

  String requestBody="";
  String introduce_url="";
  String honor_url="";
  String type_url="";
  String rim_url="";
  String logoUrl="";

  void dooo()async{
    await httpHelp.get();
    setState(() {
      requestBody=httpHelp.getResponsBody();
      logoUrl=jsonDecode(requestBody)['data']['logoUrl'];
      introduce_url=jsonDecode(requestBody)['data']['introduce_url'];
      honor_url=jsonDecode(requestBody)['data']['honor_url'];
      type_url=jsonDecode(requestBody)['data']['type_url'];
      rim_url=jsonDecode(requestBody)['data']['rim_url'];
    });

//    print(requestBody);
//    print(logoUrl);
//    print(introduce_url);
  }

  void initState(){
    super.initState();//控件初始化
    dooo();
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: screamHeight/11,),
//            Text(screamHeight.toString()),
            SizedBox(
              width: 300,
              height: 200,
              child: Image.network(logoUrl),
            ),
            SizedBox(height: screamHeight/21,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/page_1');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0
                        )
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.network(introduce_url,height: 25,width: 25,),
                        Text("项目介绍",style: TextStyle(fontSize: 25.0,color: Colors.black),),
                        SizedBox(width: 10,)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: screamWidth/18,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/page_2');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0
                        )
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.network(honor_url,height: 25,width: 25,),
                        Text("品牌概况",style: TextStyle(fontSize: 25.0,color: Colors.black),),
                        SizedBox(width: 10,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screamHeight/30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/page_3');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0
                        )
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.network(type_url,height: 25,width: 25,),
                        Text("户型展示",style: TextStyle(fontSize: 25.0,color: Colors.black),),
                        SizedBox(width: 10,)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: screamWidth/18,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/page_4');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0
                        )
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.network(rim_url,height: 25,width: 25,),
                        Text("楼盘周边",style: TextStyle(fontSize: 25.0,color: Colors.black),),
                        SizedBox(width: 10,)
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}