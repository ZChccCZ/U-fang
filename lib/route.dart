import 'package:flutter/material.dart';
import 'pages/homeContent.dart';
import 'pages/page_1.dart';
import 'pages/page_2.dart';
import 'pages/page_3.dart';
import 'pages/page_4.dart';
import 'package:houses/pages/page_1/page_1_1.dart';

//配置路由
final routes={
  'home':(context)=>HomeContent(),
  '/page_1':(context)=>Page_1(),
  '/page_2':(context)=>Page_2(),
  '/page_3':(context)=>Page_3(),
  '/page_4':(context)=>Page_4(),
  '/page_1_1':(context)=>Page_1_1(),
};


//用onGenerateRoute方法对参数处理判断
var onGenerateRoute=(RouteSettings settings){
  final String name=settings.name;
  final Function pageContentBuider=routes[name];
  if(pageContentBuider!=null){
    if(settings.arguments!=null){
      final Route route=MaterialPageRoute(builder: (context)=>pageContentBuider(context,arguments:settings.arguments));
      return route;
    }else{
      final Route route=MaterialPageRoute(builder: (context)=>pageContentBuider(context));
      return route;
    }
  }
};
