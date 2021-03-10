import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:adobe_xd/pinned.dart';
import './Relax.dart';
import 'package:adobe_xd/page_link.dart';
import './Item1.dart';

class attentionpage extends StatelessWidget {
  attentionpage({
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
            offset: Offset(79.0, 467.0),
            child:
                // Adobe XD layer: 'Bottom Actions' (group)
                SizedBox(
              width: 270.0,
              height: 44.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(136.0, 0.0, 134.0, 44.0),
                    size: Size(270.0, 44.0),
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Right Action' (group)
                        PageLink(
                      links: [
                        PageLinkInfo(
                          transition: LinkTransition.PushDown,
                          ease: Curves.easeOut,
                          duration: 1.0,
                          pageBuilder: () => Relax(),
                        ),
                      ],
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(0.0, 0.0, 134.0, 44.0),
                            size: Size(134.0, 44.0),
                            pinLeft: true,
                            pinRight: true,
                            pinTop: true,
                            pinBottom: true,
                            child:
                                // Adobe XD layer: 'Frame' (shape)
                                Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(53.0, 11.0, 28.0, 22.0),
                            size: Size(134.0, 44.0),
                            fixedWidth: true,
                            fixedHeight: true,
                            child:
                                // Adobe XD layer: 'Label' (text)
                                Text(
                              'Yes',
                              style: TextStyle(
                                fontFamily: 'ZiZhiQuXiMaiTi',
                                fontSize: 17,
                                color: const Color(0xfffeaa72),
                                letterSpacing: -0.40800000000000003,
                                height: 1.2941176470588236,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 134.0, 44.0),
                    size: Size(270.0, 44.0),
                    pinLeft: true,
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Left Action' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 134.0, 44.0),
                          size: Size(134.0, 44.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Frame' (shape)
                              PageLink(
                            links: [
                              PageLinkInfo(
                                transition: LinkTransition.PushDown,
                                ease: Curves.easeOut,
                                duration: 1.0,
                                pageBuilder: () => Item1(),
                              ),
                            ],
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(56.0, 11.0, 22.0, 22.0),
                          size: Size(134.0, 44.0),
                          fixedWidth: true,
                          fixedHeight: true,
                          child:
                              // Adobe XD layer: 'Label' (text)
                              Text(
                            'No',
                            style: TextStyle(
                              fontFamily: 'ZiZhiQuXiMaiTi',
                              fontSize: 17,
                              color: const Color(0xfffda672),
                              letterSpacing: -0.40800000000000003,
                              height: 1.2941176470588236,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(135.0, 0.5, 0.5, 43.5),
                    size: Size(270.0, 44.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child:
                        // Adobe XD layer: 'Separator' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 0.5, 43.5),
                          size: Size(0.5, 43.5),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Separator' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0x5c3c3c43),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 270.0, 1.0),
                    size: Size(270.0, 44.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    fixedHeight: true,
                    child:
                        // Adobe XD layer: 'Top Border' (group)
                        Stack(
                      children: <Widget>[
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 270.0, 1.0),
                          size: Size(270.0, 1.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Frame' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Pinned.fromSize(
                          bounds: Rect.fromLTWH(0.0, 0.0, 270.0, 0.5),
                          size: Size(270.0, 1.0),
                          pinLeft: true,
                          pinRight: true,
                          pinTop: true,
                          pinBottom: true,
                          child:
                              // Adobe XD layer: 'Separator' (shape)
                              Container(
                            decoration: BoxDecoration(
                              color: const Color(0x5c3c3c43),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(96.0, 416.0),
            child:
                // Adobe XD layer: 'Description' (text)
                SizedBox(
              width: 236.0,
              height: 32.0,
              child: Text(
                'Do you want to rest for a while？',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 14,
                  color: const Color(0xff000000),
                  letterSpacing: -0.112,
                  height: 1.1428571428571428,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(96.0, 366.0),
            child:
                // Adobe XD layer: 'Title' (text)
                SizedBox(
              width: 236.0,
              height: 23.0,
              child: SingleChildScrollView(
                  child: Text(
                'Hi，XXX',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 23,
                  color: const Color(0xff000000),
                  letterSpacing: -0.736,
                  height: 0.9565217391304348,
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
