import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/homeContent.dart';
import 'route.dart';
import 'dart:ui';

//获取屏幕高度和宽度
double screamWidth=window.physicalSize.width;
double screamHeight=window.physicalSize.height;

void main() => runApp(MyApp());
//设置状态栏沉浸
//SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor:Colors.transparent);
//SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: routes,
      debugShowCheckedModeBanner: false,
//initialRoute: '/page_2',
//      onGenerateRoute: onGenerateRoute,//用来处理传值切换的方法
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeContent(),
    );
  }
}
