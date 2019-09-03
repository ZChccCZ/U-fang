import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/myWidget/header.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:houses/http/http_help.dart';
import 'package:houses/http/http_url.dart';

import 'dart:convert';

class Ppry extends StatefulWidget {
  _PpryState createState() => _PpryState();
}

class _PpryState extends State<Ppry> {
  // 声明一个list，存放image Widget


  static HttpUrl httpUrl=new HttpUrl();

  HttpHelp httpHelp_P=new HttpHelp(httpUrl.brand_honor_image_get);
  HttpHelp httpHelp_I=new HttpHelp(httpUrl.brand_honor_get);


  String requestBody_P="";
  String requestBody_I="";
  String p1="";
  String p2="";
  String p3="";

  String honor_info_1="";
  String honor_info_2="";
  String honor_info_3="";


  void getP()async{
    await httpHelp_P.get();
    setState(() {
      requestBody_P=httpHelp_P.getResponsBody();

      p1=jsonDecode(requestBody_P)["data"][0]["url"];
      p2=jsonDecode(requestBody_P)["data"][1]["url"];
      p3=jsonDecode(requestBody_P)["data"][2]["url"];
      print(p1);
      print(p2);
      print(p3);
    });

  }

  void getI()async{
    await httpHelp_I.get();
    setState(() {
      requestBody_I=httpHelp_I.getResponsBody();
      honor_info_1=jsonDecode(requestBody_I)["data"][0]["honor_info"];
      honor_info_2=jsonDecode(requestBody_I)["data"][1]["honor_info"];
      honor_info_3=jsonDecode(requestBody_I)["data"][2]["honor_info"];

    });
  }


  List<Widget> imageList = List();

  @override
  void initState() {
    getI();
    getP();
    imageList
      ..add(Image.network(
        p1,
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        p2,
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        p3,
        fit: BoxFit.fill,
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        backgroundColor: Colors.black12,
        body: firstSwiperView(),
    );
  }

  Widget firstSwiperView() {
    return Container(
      child: Column(
        children: <Widget>[
          Header(),//头顶按键
          Container(
//            padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: Swiper(
              itemCount: 3,
              itemBuilder: swiperBuilder,
              pagination: SwiperPagination(
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.black54,
                      activeColor: Colors.white
                  )
              ),
//              controller: SwiperController(),
              control: SwiperControl(),
              scrollDirection: Axis.horizontal,
              autoplay: true,
              onTap: (index) => print('点击了第$index'),
            ),
          ),
          Container(
            height:(screamHeight*8)/62,//750,//
//            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                Text(honor_info_1,style: TextStyle(fontSize: 20)),
                SizedBox(height: 10,),
                Text(honor_info_2,style: TextStyle(fontSize: 20)),
                SizedBox(height: 10,),
                Text(honor_info_3,style: TextStyle(fontSize: 20)),
              ]
            ),

          )
        ],
      ),
    );
  }

  Widget swiperBuilder(BuildContext context, int index) {
    try{
      return Image.network(jsonDecode(requestBody_P)["data"][index]["url"],fit: BoxFit.fill,);
    }catch(e){
      print("error");
    }
  }
}

