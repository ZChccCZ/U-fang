import 'package:houses/main.dart';
import 'package:flutter/material.dart';
import 'package:houses/myWidget/header.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:houses/http/http_help.dart';
import 'package:houses/http/http_url.dart';

import 'dart:convert';

class Ylmj extends StatefulWidget{
  _YlmjState createState() => _YlmjState();
}

class _YlmjState extends State<Ylmj> {

  static HttpUrl httpUrl=new HttpUrl();

  HttpHelp httpHelp=new HttpHelp(httpUrl.landscape_get1);

  String requestBody="";

  List<String> pecture_description =new List(3);
  List<String> url=new List(3);

  void get()async{
    await httpHelp.get();
    setState(() {
      requestBody=httpHelp.getResponsBody();
      for(int i=0;i<3;i++){
        pecture_description[i]=jsonDecode(requestBody)["data"][i]["picture_description"];
        url[i]=jsonDecode(requestBody)["data"][i]["url"];
      }
    });
    print(url[0]);
  }

  int index=0;
  List<Widget> imageList = List();

  @override
  void initState() {
    get();
    imageList
      ..add(Image.network(
        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Header(),
          Container(
//            padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
            width: MediaQuery.of(context).size.width,
            height: 450,
            child: Swiper(
              itemCount: 3,
              itemBuilder: swiperBuilder,
              pagination: SwiperPagination(
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                  builder: FractionPaginationBuilder(
                      color: Colors.black,
                      activeColor: Colors.redAccent,
                      activeFontSize: 40
                  )
              ),
//              controller: SwiperController(),
//              control: SwiperControl(),//设置是否有左右键
              scrollDirection: Axis.horizontal,
              autoplay: true,
              onTap: (i) {//暂时无用
                setState(() {
                  index=i;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget swiperBuilder(BuildContext context, int i) {
    return Column(
      children: <Widget>[
        Container(
          height: 420,
          width: screamWidth,
          child: imageList[i],//Image.network(url[i]==null?"":url[i])
        ),
        Text(pecture_description[i]==null?"":pecture_description[i])
      ],
    );
  }
}