import 'package:houses/main.dart';
import 'package:flutter/material.dart';
import 'package:houses/myWidget/header.dart';
import 'package:flutter_drag_scale/flutter_drag_scale.dart';

class Zbss extends StatefulWidget{
  _ZbssState createState() => _ZbssState();
}

class _ZbssState extends State<Zbss> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Header(),
          Container(
            height: (screamHeight*3)/10,
            width: screamWidth,
            child: Center(
              child: DragScaleContainer(
                doubleTapStillScale: true,
                child: new Image(
                  image: new NetworkImage(
                      'http://a1.qpic.cn/psb?/V10CHacp1oVh3G/oM76ewcvZWGMhpsaznGsnOeHuki133BkD.*cZU2kcUM!/b/dDQBAAAAAAAA&ek=1&kp=1&pt=0&bo=HQtABh0LQAYROQ4!&tl=1&vuin=2508035263&tm=1565953200&sce=60-2-2&rf=viewer_4',
                  ),
                ),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}