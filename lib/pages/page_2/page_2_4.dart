import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/myWidget/header.dart';
import 'package:houses/http/http_help.dart';
import 'package:houses/http/http_url.dart';

import 'dart:convert';

class Qywh extends StatefulWidget{
  _QywhState createState() => _QywhState();
}

class _QywhState extends State<Qywh> {

  static HttpUrl httpUrl=new HttpUrl();

  HttpHelp httpHelp_P=new HttpHelp(httpUrl.brand_culture_image_get);
  HttpHelp httpHelp_I=new HttpHelp(httpUrl.brand_culture_get);

  String requestBody_P="";
  String requestBody_I="";
  String pageUrl="";
  String cultureUrl="";

  List<String> culture_title=new List(4);
  List<String> culture_info=new List(4);
  String culture_title_0="";
  String culture_title_1="";
  String culture_title_2="";
  String culture_title_3="";
  String culture_title_4="";
  String culture_info_0="";
  String culture_info_1="";
  String culture_info_2="";
  String culture_info_3="";



  void getP()async{
    await httpHelp_P.get();
    setState(() {
      requestBody_P=httpHelp_P.getResponsBody();
      pageUrl=jsonDecode(requestBody_P)["data"]["pageUrl"];
      cultureUrl=jsonDecode(requestBody_P)["data"]["cultureUrl"];


    });

  }

  void getI()async{
    await httpHelp_I.get();
    setState(() {
      requestBody_I=httpHelp_I.getResponsBody();
      for(int i=0;i<4;i++){
        culture_title[i]=jsonDecode(requestBody_I)["data"][i]["culture_title"];
        culture_info[i]=jsonDecode(requestBody_I)["data"][i]["culture_info"];
      }


      culture_title_0=jsonDecode(requestBody_I)["data"][0]["culture_title"];
      culture_info_0=jsonDecode(requestBody_I)["data"][0]["culture_info"];

      culture_title_1=jsonDecode(requestBody_I)["data"][1]["culture_title"];
      culture_info_1=jsonDecode(requestBody_I)["data"][1]["culture_info"];

      culture_title_2=jsonDecode(requestBody_I)["data"][2]["culture_title"];
      culture_info_2=jsonDecode(requestBody_I)["data"][2]["culture_info"];

      culture_title_3=jsonDecode(requestBody_I)["data"][3]["culture_title"];
      culture_info_3=jsonDecode(requestBody_I)["data"][3]["culture_info"];

    });
    print(requestBody_I);
  }


  void initState(){
    getI();
    getP();
    super.initState();
  }

  String imageUrl="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565885489979&di=566710b0fcab2e32d19d585ae665498f&imgtype=0&src=http%3A%2F%2Fpic25.nipic.com%2F20121112%2F9252150_150552938000_2.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Header(),
          Container(
            height: 250,
            width: screamWidth,
            child:Image.network(imageUrl,fit: BoxFit.fill,),//TODO:改图片
          ),
//          ListView(
//            shrinkWrap: true,
//            padding: const EdgeInsets.all(20.0),
//            children: <Widget>[
//              const Text('I\'m dedicating every day to you'),
//              const Text('Domestic life was never quite my style'),
//              const Text('When you smile, you knock me out, I fall apart'),
//              const Text('And I thought I was so smart'),
//              const Text('I\'m dedicating every day to you'),
//              const Text('Domestic life was never quite my style'),
//              const Text('When you smile, you knock me out, I fall apart'),
//              const Text('And I thought I was so smart'),
//              const Text('I\'m dedicating every day to you'),
//              const Text('Domestic life was never quite my style'),
//              const Text('When you smile, you knock me out, I fall apart'),
//              const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//              const Text('Domestic life was never quite my style'),
//              const Text('When you smile, you knock me out, I fall apart'),
//              const Text('And I thought I was so smart'),
//              const Text('I\'m dedicating every day to you'),
//              const Text('Domestic life was never quite my style'),
//              const Text('When you smile, you knock me out, I fall apart'),
//              const Text('And I thought I was so smart'),
//
//            ],
//          ),
//          CustomScrollView(
//            shrinkWrap: true,
//            scrollDirection: Axis.vertical,
//            slivers: <Widget>[
//              new SliverPadding(
//                padding: const EdgeInsets.all(20.0),
//                sliver: new SliverList(
//                    delegate: new SliverChildListDelegate(<Widget>[
//                      const Text('I\'m dedicating every day to you'),
//                      const Text('Domestic life was never quite my style'),
//                      const Text('When you smile, you knock me out, I fall apart'),
//                      const Text('And I thought I was so smart'),
//                      const Text('I\'m dedicating every day to you'),
//                      const Text('Domestic life was never quite my style'),
//                      const Text('When you smile, you knock me out, I fall apart'),
//                      const Text('And I thought I was so smart'),
//                      const Text('I\'m dedicating every day to you'),
//                      const Text('Domestic life was never quite my style'),
//                      const Text('When you smile, you knock me out, I fall apart'),
//                      const Text('And I thought I was so smart'),
//                      const Text('I\'m dedicating every day to you'),
//                      const Text('Domestic life was never quite my style'),
//                      const Text('When you smile, you knock me out, I fall apart'),
//                      const Text('And I thought I was so smart'),const Text('I\'m dedicating every day to you'),
//                      const Text('Domestic life was never quite my style'),
//                      const Text('When you smile, you knock me out, I fall apart'),
//                      const Text('And I thought I was so smart'),
//                      const Text('I\'m dedicating every day to you'),
//                      const Text('Domestic life was never quite my style'),
//                      const Text('When you smile, you knock me out, I fall apart'),
//                      const Text('And I thought I was so smart'),
//                    ])),
//              )
//            ],
//          ),
          SizedBox(height: 20,),
          Text(culture_title_0,style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text(culture_info_0),
          SizedBox(height: 20,),
          Text(culture_title_1,style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text(culture_info_1),
          SizedBox(height: 20,),
          Text(culture_title_2,style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text(culture_info_2),
          SizedBox(height: 20,),
          Text(culture_title_3,style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text(culture_info_3),
        ],
      ),
    );
  }
}