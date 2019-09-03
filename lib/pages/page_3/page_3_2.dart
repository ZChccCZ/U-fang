import 'package:flutter/material.dart';
import 'package:houses/main.dart';

class VRpage extends StatefulWidget{
  _VRpageState createState()=> _VRpageState();
}

class _VRpageState extends State<VRpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screamHeight/4,
      child: Text("VR展示"),
    );
  }
}

