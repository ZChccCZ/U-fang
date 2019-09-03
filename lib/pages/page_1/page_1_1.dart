import 'package:flutter/material.dart';
import 'package:houses/main.dart';
import 'package:houses/http/http_help.dart';
import 'package:houses/http/http_url.dart';

import 'dart:convert';

class Page_1_1 extends StatefulWidget{
  _Page_1_1State createState()=> _Page_1_1State();
}

class _Page_1_1State extends State<Page_1_1> {

  static HttpUrl httpUrl=new HttpUrl();

  HttpHelp httpHelp=new HttpHelp(httpUrl.guidePage_get);

  String responsBody="";
  Map requestBody=new Map();//上传
  String get_phone_number="";//上传
  String get_price="";//上传

  String guiance_id="";
  String company="";
  String site="";
  String phone_number="";
  String pageUrl="";
  String logoUrl="";

  void dooo()async{
    await httpHelp.get();
    setState(() {
      responsBody=httpHelp.getResponsBody();

      guiance_id=jsonDecode(responsBody)["data"]["guiance_id"];
      company=jsonDecode(responsBody)['data']['company'];
      site=jsonDecode(responsBody)['data']['site'];
      phone_number=jsonDecode(responsBody)['data']['phone_number'];
      logoUrl=jsonDecode(responsBody)['data']['logoUrl'];
      pageUrl=jsonDecode(responsBody)['data']['pageUrl'];

      print(responsBody);
      print(logoUrl);
      print(guiance_id);
      print(logoUrl);
      print(company);
    });
  }
  @override
  void initState(){
    dooo();
    super.initState();
  }
  //TODO:记得改接口
  void getRequestBody(){
    requestBody={"phone":get_phone_number,"price":get_price,"aim":chekboxList};
  }


  List chekboxList=[
    false,false,false,false,false
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: screamHeight/60,),
              Row(
                children: <Widget>[
                  MaterialButton(//透明按钮
                    child: Text("返回",style: TextStyle(fontSize: 20),),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              Text(guiance_id),
              Image.network(
                logoUrl,
                height: screamHeight/15,//120
                width: screamWidth/15,//150
              ),
              Text("客服电话："),
              Text(phone_number),
              SizedBox(height: screamHeight/95,),
              Row(
                children: <Widget>[
                  SizedBox(width: screamWidth/20,),
                  Text("您的电话",style: TextStyle(fontSize: 18),),
                  SizedBox(width: screamWidth/70,),
                  Expanded(
                    child:Container(
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
//                      hintText: " ",
                            border: OutlineInputBorder()//设置边框
                        ),
                        onChanged: (v){
                          get_phone_number=v;
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: screamWidth/20,)
                ],
              ),
              SizedBox(height: screamHeight/95,),
              Row(
                children: <Widget>[
                  SizedBox(width: screamWidth/20,),
                  Text("意向价格",style: TextStyle(fontSize: 18),),
                  SizedBox(width: screamWidth/70,),
                  Expanded(
                    child:Container(
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
//                      hintText: " ",
                            border: OutlineInputBorder()//设置边框
                        ),
                        onChanged: (v){
                          get_price=v;
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: screamWidth/20,)
                ],
              ),
              SizedBox(height: screamHeight/95,),
              Row(
                children: <Widget>[
                  SizedBox(width: screamWidth/20,),
                  Container(
                    height: 220,
                    alignment: Alignment.topCenter,
                    child: Text("意向户型",style: TextStyle(fontSize: 18),),
                  ),
                  SizedBox(width: screamWidth/70,),
                  Expanded(
                    child:Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(//单选
                              value: chekboxList[0],
                              onChanged: (v){
                                setState(() {
                                  chekboxList[0]=v;
                                });
                              },
                              activeColor: Colors.blue,//设置选中的颜色
                            ),
                            Text("一居室"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(//单选
                              value: chekboxList[1],
                              onChanged: (v){
                                setState(() {
                                  chekboxList[1]=v;
                                });
                              },
                              activeColor: Colors.blue,//设置选中的颜色
                            ),
                            Text("二居室"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(//单选
                              value: chekboxList[2],
                              onChanged: (v){
                                setState(() {
                                  chekboxList[2]=v;
                                });
                              },
                              activeColor: Colors.blue,//设置选中的颜色
                            ),
                            Text("三居室"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(//单选
                              value: chekboxList[3],
                              onChanged: (v){
                                setState(() {
                                  chekboxList[3]=v;
                                });
                              },
                              activeColor: Colors.blue,//设置选中的颜色
                            ),
                            Text("四居室"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(//单选
                              value: chekboxList[4],
                              onChanged: (v){
                                setState(() {
                                  chekboxList[4]=v;
                                });
                              },
                              activeColor: Colors.blue,//设置选中的颜色
                            ),
                            Text("五居室以上"),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screamWidth/20,)
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        children: <Widget>[
          Expanded(
            child: MaterialButton(//透明按钮
              child: Text("提交",style: TextStyle(fontSize: 25),),
              onPressed: (){
                getRequestBody();
                httpHelp.post(requestBody);//上传
              },
            ),
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,//设置显示键盘是不要遮挡原布局
    );
  }
}