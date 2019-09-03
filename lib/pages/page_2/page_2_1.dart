import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/myWidget/header.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:houses/http/http_help.dart';
import 'package:houses/http/http_url.dart';

import 'dart:convert';



class Qyjs extends StatefulWidget{
  _QyjsState createState()=> _QyjsState();
}

class _QyjsState extends State<Qyjs> {


  static HttpUrl httpUrl=new HttpUrl();

  HttpHelp httpHelp=new HttpHelp(httpUrl.brand_introduction_image_get);
  HttpHelp httpHelp1=new HttpHelp(httpUrl.brand_introduction_get);
  

  String requestBody="";
  String requestBody1="";
  String p1="";
  String p2="";
  String p3="";

  String name="";
  String description="";


  void getP()async{
    await httpHelp.get();
    setState(() {
      requestBody=httpHelp.getResponsBody();

      p1=jsonDecode(requestBody)["data"][0]["url"];
      p2=jsonDecode(requestBody)["data"][1]["url"];
      p3=jsonDecode(requestBody)["data"][2]["url"];
      print(p1);
      print(p2);
      print(p3);
    });

  }

  void getI()async{
    await httpHelp1.get();
    setState(() {
      requestBody1=httpHelp1.getResponsBody();
      name=jsonDecode(requestBody1)["data"]["name"];
      description=jsonDecode(requestBody1)["data"]["description"];
    });

  }


  
//静态添加图片
  List<Widget> imageList = List();

  @override
  void initState() {
    imageList
      ..add(Image.network(
      "http://139.9.80.230:8081/static/image/2458492820746082918_original.jpg",
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        "http://139.9.80.230:8081/static/image/2458492854691790616_original.jpg",
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        "http://139.9.80.230:8081/static/image/2458492962726817422_original.jpg",
        fit: BoxFit.fill,
      ));
    super.initState();
    getP();
    getI();
  }



  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Header(),//头顶按钮
                Container(
//            padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Swiper(
                    itemCount: 3,
                    itemBuilder:  _swiperBuilder,
                    pagination: SwiperPagination(
                        alignment: Alignment.bottomRight,
                        margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.black54,
                            activeColor: Colors.white
                        )
                    ),
//              controller: SwiperController(),
//                    control: SwiperControl(),
                    scrollDirection: Axis.horizontal,
                    autoplay: true,
                    onTap: (index) => print('点击了第$index'),
                  ),
                )
              ],
            ),
          ),
          Container(
            height:(screamHeight*10)/62,//750,//
//            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                Text(
                  "中海地产",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: 15
                  ),
                )
              ],
            ),
          )


        ],
      ),
    );
  }
  Widget _swiperBuilder(BuildContext context, int index) {
    return imageList[index];
  }
}