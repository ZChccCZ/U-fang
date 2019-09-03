import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpHelp extends StatelessWidget{


  String request_url="";
  String _responseBody="";
  Map requestBody=new Map();

  HttpHelp(String request_url){
    this.request_url=request_url;
    this.requestBody=requestBody;
  }


  void get()async{

    print("开始请求");
    HttpClient httpClient=new HttpClient();

    HttpClientRequest request=await httpClient.getUrl(Uri.parse(request_url));

    // request.headers.add("user-agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");

    HttpClientResponse response = await request.close();

    _responseBody = await response.transform(utf8.decoder).join();

    httpClient.close();
  }

  void post(Map requestBody) async {
    print('------loadData_sys_post--------');

    HttpClient httpClient = new HttpClient();

// queryParameters get请求的查询参数(适用于get请求？？？是吗？？？)
// Uri uri = Uri(
// scheme: "https", host: "app.xxx.com", path: homeRegularListUrl);
// HttpClientRequest request = await httpClient.postUrl(uri);

    var url = request_url;
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));

   /// 设置请求头
//    request.headers.set("loginSource", "IOS");
//    request.headers.set("useVersion", "3.1.0");
//    request.headers.set("isEncoded", "1");
//    request.headers.set("bundleId", "com.xxx.xxx");
// Content-Type大小写都ok
    request.headers.set('content-type', 'application/json');

    /// 添加请求体
    Map jsonMap = {"message":"操作成功","status":200,"data":requestBody};
    request.add(utf8.encode(json.encode(jsonMap)));

    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    if (response.statusCode == HttpStatus.ok) {
      print('请求成功');
      print(response.headers);
      print(responseBody);
    }
  }


  String getResponsBody(){
    return _responseBody;
  }
  String getJsonBody(){
    return jsonDecode(_responseBody);
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}