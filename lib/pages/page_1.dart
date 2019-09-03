import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/myWidget/header.dart';
import 'package:houses/http/http_url.dart';
import 'package:houses/http/http_help.dart';

import 'dart:convert';

class Page_1 extends StatefulWidget{
  _Page_1State createState()=> _Page_1State();
}

class _Page_1State extends State<Page_1> {

  static HttpUrl httpUrl=new HttpUrl();

  HttpHelp httpHelp=new HttpHelp(httpUrl.project_info_get);

  String requestBody="";
  String title="";
  String description="";
  String pageUrl="";

  void dooo()async{
    await httpHelp.get();
    setState(() {
      requestBody=httpHelp.getResponsBody();
      title=jsonDecode(requestBody)['data']['title'];
      description=jsonDecode(requestBody)['data']['description'];
      pageUrl=jsonDecode(requestBody)['data']['pageUrl'];
    });
//    print(requestBody);
//    print(logoUrl);
//    print(introduce_url);
  }

  void initState(){
    super.initState();
    dooo();
  }
  @override
  Widget build(BuildContext context) {
//    print(screamHeight);//打印屏幕的高度
    return Scaffold(
      body: Container(
        height: screamHeight,
        width: screamWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
//            matchTextDirection: true,
            image: NetworkImage(pageUrl),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: <Widget>[
            Header(),
          ],
        ),
      ),
      bottomSheet: Container(
        child: Text(description, style: TextStyle(fontSize: 20,)),
        color: Colors.grey,
      ),
    );
  }
}