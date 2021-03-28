import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './ScheduleDatepage.dart';
import 'package:adobe_xd/page_link.dart';

class Scheduler extends StatelessWidget {
  Scheduler({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(27.0, 57.0),
            child:
                // Adobe XD layer: 'Pickers - Compact -…' (group)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.SlideDown,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => ScheduleDatepage(),
                ),
              ],
              child: SizedBox(
                width: 375.0,
                height: 812.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 812.0),
                      size: Size(375.0, 812.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child:
                          // Adobe XD layer: 'Compact Picker - Li…' (group)
                          Stack(
                        children: <Widget>[
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(0.0, 0.0, 375.0, 812.0),
                            size: Size(375.0, 812.0),
                            pinLeft: true,
                            pinRight: true,
                            pinTop: true,
                            pinBottom: true,
                            child:
                                // Adobe XD layer: 'Overlay' (shape)
                                Container(
                              decoration: BoxDecoration(
                                color: const Color(0x29000000),
                              ),
                            ),
                          ),
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(16.0, 216.0, 343.0, 380.0),
                            size: Size(375.0, 812.0),
                            pinLeft: true,
                            pinRight: true,
                            fixedHeight: true,
                            child:
                                // Adobe XD layer: 'Background' (shape)
                                Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.0),
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x1a000000),
                                    offset: Offset(0, 10),
                                    blurRadius: 60,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(32.0, 544.0, 317.0, 36.0),
                            size: Size(375.0, 812.0),
                            fixedWidth: true,
                            fixedHeight: true,
                            child:
                                // Adobe XD layer: 'Time Picker Inline' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(119.0, 0.0, 86.0, 36.0),
                                  size: Size(317.0, 36.0),
                                  pinTop: true,
                                  pinBottom: true,
                                  fixedWidth: true,
                                  child:
                                      // Adobe XD layer: 'Time Picker' (group)
                                      Stack(
                                    children: <Widget>[
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(0.0, 0.0, 86.0, 36.0),
                                        size: Size(86.0, 36.0),
                                        pinLeft: true,
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        child:
                                            // Adobe XD layer: 'Background' (shape)
                                            Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            color: const Color(0x1f767680),
                                          ),
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            50.0, 9.0, 25.0, 22.0),
                                        size: Size(86.0, 36.0),
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child: Text(
                                          '41',
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 22,
                                            color: const Color(0xff000000),
                                            letterSpacing: 1.012,
                                            height: 1,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(39.0, 8.0, 6.0, 22.0),
                                        size: Size(86.0, 36.0),
                                        pinTop: true,
                                        fixedWidth: true,
                                        fixedHeight: true,
                                        child: Text(
                                          ':',
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 22,
                                            color: const Color(0xff000000),
                                            letterSpacing: 0.352,
                                            height: 1,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            11.0, 9.0, 25.0, 22.0),
                                        size: Size(86.0, 36.0),
                                        pinLeft: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child: Text(
                                          '09',
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 22,
                                            color: const Color(0xff000000),
                                            letterSpacing: 1.012,
                                            height: 1,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(0.0, 10.0, 45.0, 20.0),
                                  size: Size(317.0, 36.0),
                                  pinLeft: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child: Text(
                                    'Time',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 20,
                                      color: const Color(0xff000000),
                                      letterSpacing: 0.32,
                                      fontWeight: FontWeight.w600,
                                      height: 1.1,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds:
                                      Rect.fromLTWH(213.0, 0.0, 104.0, 36.0),
                                  size: Size(317.0, 36.0),
                                  pinRight: true,
                                  pinBottom: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child:
                                      // Adobe XD layer: 'Segmented Controls …' (group)
                                      Stack(
                                    children: <Widget>[
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            0.0, 0.0, 104.0, 36.0),
                                        size: Size(104.0, 36.0),
                                        pinLeft: true,
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        child:
                                            // Adobe XD layer: 'Segmented Controls …' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 104.0, 36.0),
                                              size: Size(104.0, 36.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              fixedHeight: true,
                                              child:
                                                  // Adobe XD layer: 'Segmented Control b…' (shape)
                                                  Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  color:
                                                      const Color(0x1f767680),
                                                ),
                                              ),
                                            ),
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  51.0, 12.0, 1.0, 16.0),
                                              size: Size(104.0, 36.0),
                                              fixedWidth: true,
                                              fixedHeight: true,
                                              child:
                                                  // Adobe XD layer: 'Segmented Controls …' (group)
                                                  Stack(
                                                children: <Widget>[
                                                  Pinned.fromSize(
                                                    bounds: Rect.fromLTWH(
                                                        0.0, 0.0, 1.0, 16.0),
                                                    size: Size(1.0, 16.0),
                                                    pinLeft: true,
                                                    pinRight: true,
                                                    pinTop: true,
                                                    pinBottom: true,
                                                    child:
                                                        // Adobe XD layer: 'Separator' (shape)
                                                        Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.5),
                                                        color: const Color(
                                                            0x4d8e8e93),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  2.0, 2.0, 50.0, 32.0),
                                              size: Size(104.0, 36.0),
                                              pinLeft: true,
                                              fixedWidth: true,
                                              fixedHeight: true,
                                              child:
                                                  // Adobe XD layer: 'Segmented Controls …' (group)
                                                  Stack(
                                                children: <Widget>[
                                                  Pinned.fromSize(
                                                    bounds: Rect.fromLTWH(
                                                        0.0, 0.0, 50.0, 32.0),
                                                    size: Size(50.0, 32.0),
                                                    pinLeft: true,
                                                    pinRight: true,
                                                    pinTop: true,
                                                    pinBottom: true,
                                                    child:
                                                        // Adobe XD layer: 'Segmented Controls …' (group)
                                                        Stack(
                                                      children: <Widget>[
                                                        Pinned.fromSize(
                                                          bounds: Rect.fromLTWH(
                                                              0.0,
                                                              0.0,
                                                              50.0,
                                                              32.0),
                                                          size:
                                                              Size(50.0, 32.0),
                                                          pinLeft: true,
                                                          pinRight: true,
                                                          fixedHeight: true,
                                                          child:
                                                              // Adobe XD layer: 'Frame' (shape)
                                                              Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7.0),
                                                              color: const Color(
                                                                  0xffffffff),
                                                              border: Border.all(
                                                                  width: 1.0,
                                                                  color: const Color(
                                                                      0x0a000000)),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: const Color(
                                                                      0x29000000),
                                                                  offset:
                                                                      Offset(
                                                                          0, 3),
                                                                  blurRadius: 8,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Pinned.fromSize(
                                                          bounds: Rect.fromLTWH(
                                                              15.3,
                                                              9.5,
                                                              20.0,
                                                              14.0),
                                                          size:
                                                              Size(50.0, 32.0),
                                                          fixedWidth: true,
                                                          fixedHeight: true,
                                                          child: Text(
                                                            'AM',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Text',
                                                              fontSize: 14,
                                                              color: const Color(
                                                                  0xff000000),
                                                              letterSpacing:
                                                                  -0.224,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              height: 1.5,
                                                            ),
                                                            textHeightBehavior:
                                                                TextHeightBehavior(
                                                                    applyHeightToFirstAscent:
                                                                        false),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  50.0, 1.0, 50.0, 33.0),
                                              size: Size(104.0, 36.0),
                                              pinRight: true,
                                              fixedWidth: true,
                                              fixedHeight: true,
                                              child:
                                                  // Adobe XD layer: 'Segmented Controls …' (group)
                                                  Stack(
                                                children: <Widget>[
                                                  Pinned.fromSize(
                                                    bounds: Rect.fromLTWH(
                                                        0.0, 0.0, 50.0, 33.0),
                                                    size: Size(50.0, 33.0),
                                                    pinLeft: true,
                                                    pinRight: true,
                                                    pinTop: true,
                                                    pinBottom: true,
                                                    child:
                                                        // Adobe XD layer: 'Segmented Controls …' (group)
                                                        Stack(
                                                      children: <Widget>[
                                                        Pinned.fromSize(
                                                          bounds: Rect.fromLTWH(
                                                              0.0,
                                                              0.0,
                                                              50.0,
                                                              33.0),
                                                          size:
                                                              Size(50.0, 33.0),
                                                          pinLeft: true,
                                                          pinRight: true,
                                                          pinTop: true,
                                                          pinBottom: true,
                                                          child:
                                                              // Adobe XD layer: 'Frame' (shape)
                                                              Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7.0),
                                                            ),
                                                          ),
                                                        ),
                                                        Pinned.fromSize(
                                                          bounds: Rect.fromLTWH(
                                                              15.3,
                                                              11.7,
                                                              20.0,
                                                              13.0),
                                                          size:
                                                              Size(50.0, 33.0),
                                                          fixedWidth: true,
                                                          fixedHeight: true,
                                                          child: Text(
                                                            'PM',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Text',
                                                              fontSize: 13,
                                                              color: const Color(
                                                                  0xff000000),
                                                              letterSpacing:
                                                                  -0.20800000000000002,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height:
                                                                  1.6153846153846154,
                                                            ),
                                                            textHeightBehavior:
                                                                TextHeightBehavior(
                                                                    applyHeightToFirstAscent:
                                                                        false),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(31.0, 271.0, 312.0, 256.0),
                            size: Size(375.0, 812.0),
                            fixedWidth: true,
                            fixedHeight: true,
                            child:
                                // Adobe XD layer: 'Month' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromSize(
                                  bounds:
                                      Rect.fromLTWH(4.0, 237.0, 116.0, 19.0),
                                  size: Size(312.0, 256.0),
                                  pinLeft: true,
                                  pinBottom: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child:
                                      // Adobe XD layer: 'Week 5' (group)
                                      Stack(
                                    children: <Widget>[
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            96.0, 0.0, 20.0, 19.0),
                                        size: Size(116.0, 19.0),
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 30' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '30',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            48.0, 0.0, 20.0, 19.0),
                                        size: Size(116.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 29' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '29',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(0.0, 0.0, 20.0, 19.0),
                                        size: Size(116.0, 19.0),
                                        pinLeft: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 28' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '28',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds:
                                      Rect.fromLTWH(4.0, 188.0, 308.0, 19.0),
                                  size: Size(312.0, 256.0),
                                  pinLeft: true,
                                  pinRight: true,
                                  fixedHeight: true,
                                  child:
                                      // Adobe XD layer: 'Week 4' (group)
                                      Stack(
                                    children: <Widget>[
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            288.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 27' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '27',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            240.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 26' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '26',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            192.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 25' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '25',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            144.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 24' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '24',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            96.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 23' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '23',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            48.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 22' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '22',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff007aff),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(0.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinLeft: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 21' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '21',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds:
                                      Rect.fromLTWH(4.0, 139.0, 308.0, 19.0),
                                  size: Size(312.0, 256.0),
                                  pinLeft: true,
                                  pinRight: true,
                                  fixedHeight: true,
                                  child:
                                      // Adobe XD layer: 'Week 3' (group)
                                      Stack(
                                    children: <Widget>[
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            288.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 20' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '20',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            240.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 19' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '19',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            192.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 18' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '18',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            144.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 17' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '17',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            96.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 16' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '16',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            48.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 15' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '15',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(0.0, 0.0, 20.0, 19.0),
                                        size: Size(308.0, 19.0),
                                        pinLeft: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 14' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '14',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(9.0, 90.0, 303.0, 19.0),
                                  size: Size(312.0, 256.0),
                                  pinLeft: true,
                                  pinRight: true,
                                  fixedHeight: true,
                                  child:
                                      // Adobe XD layer: 'Week 2' (group)
                                      Stack(
                                    children: <Widget>[
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            283.0, 0.0, 20.0, 19.0),
                                        size: Size(303.0, 19.0),
                                        pinRight: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 13' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '13',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            235.0, 0.0, 20.0, 19.0),
                                        size: Size(303.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 12' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '12',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            188.0, 0.0, 18.0, 19.0),
                                        size: Size(303.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 11' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 18.0, 19.0),
                                              size: Size(18.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '11',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            139.0, 0.0, 20.0, 19.0),
                                        size: Size(303.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 10' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 20.0, 19.0),
                                              size: Size(20.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '10',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            96.0, 0.0, 10.0, 19.0),
                                        size: Size(303.0, 19.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 9' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 10.0, 19.0),
                                              size: Size(10.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '9',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            48.0, 0.0, 10.0, 19.0),
                                        size: Size(303.0, 19.0),
                                        pinLeft: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 8' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 10.0, 19.0),
                                              size: Size(10.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '8',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds:
                                            Rect.fromLTWH(0.0, 0.0, 10.0, 19.0),
                                        size: Size(303.0, 19.0),
                                        pinLeft: true,
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 7' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 10.0, 19.0),
                                              size: Size(10.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '7',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds:
                                      Rect.fromLTWH(57.0, 27.0, 250.0, 44.0),
                                  size: Size(312.0, 256.0),
                                  pinRight: true,
                                  pinTop: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child:
                                      // Adobe XD layer: 'Week 1' (group)
                                      Stack(
                                    children: <Widget>[
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            240.0, 14.0, 10.0, 19.0),
                                        size: Size(250.0, 44.0),
                                        pinRight: true,
                                        fixedWidth: true,
                                        fixedHeight: true,
                                        child:
                                            // Adobe XD layer: 'Day 6' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 10.0, 19.0),
                                              size: Size(10.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '6',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            192.0, 14.0, 10.0, 19.0),
                                        size: Size(250.0, 44.0),
                                        fixedWidth: true,
                                        fixedHeight: true,
                                        child:
                                            // Adobe XD layer: 'Day 5' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 10.0, 19.0),
                                              size: Size(10.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '5',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            126.0, 0.0, 44.0, 44.0),
                                        size: Size(250.0, 44.0),
                                        pinTop: true,
                                        pinBottom: true,
                                        fixedWidth: true,
                                        child:
                                            // Adobe XD layer: 'Day 4' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 44.0, 44.0),
                                              size: Size(44.0, 44.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child:
                                                  // Adobe XD layer: 'Colour' (shape)
                                                  Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.elliptical(
                                                              9999.0, 9999.0)),
                                                  color:
                                                      const Color(0x1f007aff),
                                                ),
                                              ),
                                            ),
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  15.0, 13.0, 14.0, 24.0),
                                              size: Size(44.0, 44.0),
                                              fixedWidth: true,
                                              fixedHeight: true,
                                              child: Text(
                                                '4',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 24,
                                                  color:
                                                      const Color(0xff007aff),
                                                  letterSpacing:
                                                      0.14400000000000002,
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.9166666666666666,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            96.0, 14.0, 10.0, 19.0),
                                        size: Size(250.0, 44.0),
                                        fixedWidth: true,
                                        fixedHeight: true,
                                        child:
                                            // Adobe XD layer: 'Day 3' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 10.0, 19.0),
                                              size: Size(10.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '3',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            48.0, 14.0, 10.0, 19.0),
                                        size: Size(250.0, 44.0),
                                        fixedWidth: true,
                                        fixedHeight: true,
                                        child:
                                            // Adobe XD layer: 'Day 2' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 10.0, 19.0),
                                              size: Size(10.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '2',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Pinned.fromSize(
                                        bounds: Rect.fromLTWH(
                                            0.0, 14.0, 10.0, 19.0),
                                        size: Size(250.0, 44.0),
                                        pinLeft: true,
                                        fixedWidth: true,
                                        fixedHeight: true,
                                        child:
                                            // Adobe XD layer: 'Day 1' (group)
                                            Stack(
                                          children: <Widget>[
                                            Pinned.fromSize(
                                              bounds: Rect.fromLTWH(
                                                  0.0, 0.0, 10.0, 19.0),
                                              size: Size(10.0, 19.0),
                                              pinLeft: true,
                                              pinRight: true,
                                              pinTop: true,
                                              pinBottom: true,
                                              child: Text(
                                                '1',
                                                style: TextStyle(
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 19,
                                                  color:
                                                      const Color(0xff000000),
                                                  letterSpacing: -0.874,
                                                  height: 1.1578947368421053,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(287.0, 0.0, 24.0, 13.0),
                                  size: Size(312.0, 256.0),
                                  pinRight: true,
                                  pinTop: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child: Text(
                                    'SAT',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 13,
                                      color: const Color(0x4d3c3c43),
                                      letterSpacing: 0.078,
                                      fontWeight: FontWeight.w600,
                                      height: 1.6923076923076923,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(242.0, 0.0, 21.0, 13.0),
                                  size: Size(312.0, 256.0),
                                  pinTop: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child: Text(
                                    'FRI',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 13,
                                      color: const Color(0x4d3c3c43),
                                      letterSpacing: 0.078,
                                      fontWeight: FontWeight.w600,
                                      height: 1.6923076923076923,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(190.0, 0.0, 27.0, 13.0),
                                  size: Size(312.0, 256.0),
                                  pinTop: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child: Text(
                                    'THU',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 13,
                                      color: const Color(0x4d3c3c43),
                                      letterSpacing: 0.078,
                                      fontWeight: FontWeight.w600,
                                      height: 1.6923076923076923,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(141.0, 0.0, 30.0, 13.0),
                                  size: Size(312.0, 256.0),
                                  pinTop: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child: Text(
                                    'WED',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 13,
                                      color: const Color(0x4d3c3c43),
                                      letterSpacing: 0.078,
                                      fontWeight: FontWeight.w600,
                                      height: 1.6923076923076923,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(96.0, 0.0, 26.0, 13.0),
                                  size: Size(312.0, 256.0),
                                  pinTop: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child: Text(
                                    'TUE',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 13,
                                      color: const Color(0x4d3c3c43),
                                      letterSpacing: 0.078,
                                      fontWeight: FontWeight.w600,
                                      height: 1.6923076923076923,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(45.0, 0.0, 30.0, 13.0),
                                  size: Size(312.0, 256.0),
                                  pinLeft: true,
                                  pinTop: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child: Text(
                                    'MON',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 13,
                                      color: const Color(0x4d3c3c43),
                                      letterSpacing: 0.078,
                                      fontWeight: FontWeight.w600,
                                      height: 1.6923076923076923,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(0.0, 0.0, 28.0, 13.0),
                                  size: Size(312.0, 256.0),
                                  pinLeft: true,
                                  pinTop: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child: Text(
                                    'SUN',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 13,
                                      color: const Color(0x4d3c3c43),
                                      letterSpacing: 0.078,
                                      fontWeight: FontWeight.w600,
                                      height: 1.6923076923076923,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(287.0, 232.0, 66.0, 22.0),
                            size: Size(375.0, 812.0),
                            fixedWidth: true,
                            fixedHeight: true,
                            child:
                                // Adobe XD layer: 'Arrows - Next and P…' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(43.0, 0.0, 23.0, 22.0),
                                  size: Size(66.0, 22.0),
                                  pinRight: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  fixedWidth: true,
                                  child: Text(
                                    '􀆊',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 20,
                                      color: const Color(0xff007aff),
                                      letterSpacing: 0.26,
                                      fontWeight: FontWeight.w500,
                                      height: 1.1,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(0.0, 0.0, 23.0, 22.0),
                                  size: Size(66.0, 22.0),
                                  pinLeft: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  fixedWidth: true,
                                  child: Text(
                                    '􀆉',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 20,
                                      color: const Color(0xff007aff),
                                      letterSpacing: 0.26,
                                      fontWeight: FontWeight.w500,
                                      height: 1.1,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Pinned.fromSize(
                            bounds: Rect.fromLTWH(32.0, 233.0, 120.0, 20.0),
                            size: Size(375.0, 812.0),
                            fixedWidth: true,
                            fixedHeight: true,
                            child:
                                // Adobe XD layer: 'Month and Year' (group)
                                Stack(
                              children: <Widget>[
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(105.0, 2.0, 15.0, 14.0),
                                  size: Size(120.0, 20.0),
                                  pinRight: true,
                                  fixedWidth: true,
                                  fixedHeight: true,
                                  child: Text(
                                    '􀆊',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 13,
                                      color: const Color(0xff007aff),
                                      letterSpacing: 0.16899999999999998,
                                      fontWeight: FontWeight.w700,
                                      height: 1.6923076923076923,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Pinned.fromSize(
                                  bounds: Rect.fromLTWH(0.0, 0.0, 96.0, 20.0),
                                  size: Size(120.0, 20.0),
                                  pinLeft: true,
                                  pinRight: true,
                                  pinTop: true,
                                  pinBottom: true,
                                  child: Text(
                                    'June 2020',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 20,
                                      color: const Color(0xff000000),
                                      letterSpacing: 0.32,
                                      fontWeight: FontWeight.w600,
                                      height: 1.1,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(53.0, 589.0),
            child: Container(
              width: 327.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(305.0, 281.0),
            child: Container(
              width: 75.0,
              height: 33.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(58.0, 285.0),
            child: Container(
              width: 126.0,
              height: 23.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(45.8, 284.0),
            child: SizedBox(
              width: 136.0,
              child: Text(
                'Moth     Year',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 21,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
