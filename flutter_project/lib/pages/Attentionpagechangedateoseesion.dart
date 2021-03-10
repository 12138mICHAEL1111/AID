import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Attentionpagechangedateoseesion extends StatelessWidget {
  Attentionpagechangedateoseesion({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(79.0, 333.0),
            child:
                // Adobe XD layer: 'Platter' (shape)
                ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  width: 270.0,
                  height: 178.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38.0),
                    color: const Color(0xccf2f2f2),
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(96.0, 409.0),
            child:
                // Adobe XD layer: 'Title' (text)
                SizedBox(
              width: 236.0,
              height: 27.0,
              child: SingleChildScrollView(
                  child: Text(
                'Save uccessfully ！',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 25,
                  color: const Color(0xff000000),
                  letterSpacing: -0.8,
                  height: 0.88,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
