import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:houses/http/http_help.dart';
import 'package:houses/http/http_url.dart';

import 'dart:convert';

class Ybf extends StatefulWidget{
  _YbfState createState()=> _YbfState();
}

class _YbfState extends State<Ybf> {

  static HttpUrl httpUrl=new HttpUrl();

  HttpHelp httpHelp=new HttpHelp(httpUrl.house_houseType_houseTypeImage_get);

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


  List<Widget> imageList = List();

  List<String> imageTitle=[
    "公园展示图",
    "廊桥展示图",
//    "运动设施展示图",
//    "喷泉展示图",
  ];

  @override
  void initState() {
    get();
//    imageList
//      ..add(Image.network(
//        url[0],
//        fit: BoxFit.fill,
//      ))
//      ..add(Image.network(
//        url[1],
//        fit: BoxFit.fill,
//      ))
//      ..add(Image.network(
//        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
//        fit: BoxFit.fill,
//      ));
//      ..add(Image.network(
//        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
//        fit: BoxFit.fill,
//      ));
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
//            padding: const EdgeInsets.fromLTRB(0, 50, 0, 5),
        width: MediaQuery.of(context).size.width,
        height: screamHeight/4,
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
          onTap:(index) => print('点击了第$index'),
        ),
      ),
    );
  }

  Widget swiperBuilder(BuildContext context, int i) {
    return Column(
      children: <Widget>[
        Container(
          height: 360,
          width: screamWidth,
          child: Image.network(url[i]==null?"":url[i]),
        ),
        Text(pecture_description[i]==null?"":pecture_description[i])
      ],
    );
  }
}


class Pmt extends StatefulWidget{
  _PmtState createState()=> _PmtState();
}

class _PmtState extends State<Pmt> {
  static HttpUrl httpUrl=new HttpUrl();
  HttpHelp httpHelp=new HttpHelp(httpUrl.house_houseType_Image_get);

  String requestBody="";
  String url="";
  void getUrl()async{
    await httpHelp.get();
    requestBody=httpHelp.getResponsBody();
    url=jsonDecode(requestBody)["data"]["url"];
  }
  void initState(){
    getUrl();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screamHeight/4,
      child: Image.network('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg'),
    );
  }

}

