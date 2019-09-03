import 'http_help.dart';

import 'package:flutter/material.dart';

class HttpUrl extends StatelessWidget{

  static String _main_url="http://39.107.142.107:3000/mock/32/";//主地址
  String homepage_get=_main_url+"homepage/get";//首页
  String guidePage_get=_main_url+"guidePage/get";//引导页
  String project_info_get=_main_url+"project/info/get";//项目介绍
  String brand_introduction_get=_main_url+"brand/introduction/get";//品牌概括-企业简介
  String brand_honor_get=_main_url+"brand/honor/get";//品牌概括-荣誉-文字信息
  String brand_honor_image_get=_main_url+"brand/honor/image/get";//品牌概括-荣誉-图片信息
  String brand_culture_image_get=_main_url+"brand/culture/image/get";//品牌概括-企业文化-图片信息
  String brand_culture_get=_main_url+"brand/culture/get";//品牌概括-企业文化-展示全部文化
  String brand_develop_backgroundImage_get=_main_url+"brand/develop/backgroundImage/get";//品牌概括-发展历程-展示背景图片
  String brand_develop_get=_main_url+"brand/develop/get";//品牌概括—发展历程—展示历程信息
  String brand_introduction_image_get=_main_url+"brand/introduction/image/get";//品牌概括-企业简介-展示图片
  String landscape_get1=_main_url+"landscape/get1";//楼盘周边-园林景观-公共设施
  String landscape_get2=_main_url+"landscape/get2";//楼盘周边-园林景观-园林美景
  String surrounding_facilities_get=_main_url+"surrounding-facilities/get";//楼盘周边-周边设施
  String house_houseType_get=_main_url+"house/houseType/get";//户型展示-获取所有户型
  String house_houseType_houseTypeImage_get=_main_url+"house/houseType/houseTypeImage/get";//户型展示-获取户型的样板间图片
  String house_houseType_Image_get=_main_url+"house/houseType/Image/get";//户型展示-获取户型的平面图片


  @override
  Widget build(BuildContext context) {
    return null;
  }
}