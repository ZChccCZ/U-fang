import 'package:flutter/material.dart';

class ButtonWithPhoto extends StatelessWidget{

  final String url;
//  final IconData icon;
//  final Image image;
  final String title;
  final GestureTapCallback onTap;
  const ButtonWithPhoto(
       {//可选参数
          Key key,
          this.url,
//          this.image,
          this.title,
          this.onTap
       }
      ):super(key:key);


  @override
  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: this.onTap,
//      child: Container(
//        decoration: BoxDecoration(
//          border: Border.all(
//              width: 1.0
//          )
//        ),
//        child: Row(
//          children: <Widget>[
//          Image.network("http://139.9.80.230:8081/static/image/18814036818790022_original.png",height: 25,width: 25,),
////            Icon(this.icon,size: 45,),
//            Text(this.title==null?"":this.title,style: TextStyle(fontSize: 25.0,color: Colors.black),),
//            SizedBox(width: 10,)
//          ],
//        ),
//      ),
//      ),
//      ),
//    );
  }

}