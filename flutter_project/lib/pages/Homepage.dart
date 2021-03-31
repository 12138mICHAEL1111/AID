import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_project/pages/Item1.dart';
import 'package:flutter_project/pages/ScheduleDatepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './User.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Moodtracker.dart';

class Homepage extends StatefulWidget {
  int sessionNumber;
  int itemNumber;

  Homepage({this.sessionNumber, this.itemNumber});
  @override
  _HomepageState createState() => _HomepageState(sessionNumber, itemNumber);
}

class _HomepageState extends State<Homepage> {
  var _sessionNumber;
  var _itemNumber;
  var _date;

  _HomepageState(this._sessionNumber, this._itemNumber);

  @override
  void initState() {
    super.initState();
    if (_sessionNumber == null) {
      _sessionNumber = 1;
    }
    if (_sessionNumber > 4) {
      _sessionNumber = 4;
    }
    if (_itemNumber == null) {
      _itemNumber = 1;
    }
    _getDate();
    print(_sessionNumber);
    print(_itemNumber);
  }

  _getDate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _date = pref.get('session$_sessionNumber');
      if (_date == null) {
        _date = 'Not selected';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'WechatIMG1201' (shape)
          Container(
            width: 428.0,
            height: 537.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70.0),
                bottomLeft: Radius.circular(70.0),
              ),
              image: DecorationImage(
                image:
                    const AssetImage('assets/images/homepage_background.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(25.0, 56.0),
            child:
                // Adobe XD layer: 'caidan' (shape)
                Container(
              width: 53.0,
              height: 53.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/menu.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(38.0, 326.0),
            child: SizedBox(
              width: 352.0,
              child: Text(
                'Welcome back！',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 41,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(24.3, 549.0),
            child: SizedBox(
              width: 188.0,
              child: Text(
                "Session ${_sessionNumber}",
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 39,
                  color: const Color(0xfff6c16d),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(229.1, 574.0),
            child: SizedBox(
              width: 152.0,
              child: Text(
                '$_date',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 15,
                  color: const Color(0xfff6c16d),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(34.0, 623.0),
            child: Text(
              'Welcome! Are you ready to start\nsession ${_sessionNumber} today?',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 23,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),

          // Transform.translate(
          //   offset: Offset(87.0, 731.0),
          //   child: PageLink(
          //     links: [
          //       PageLinkInfo(
          //         transition: LinkTransition.PushDown,
          //         ease: Curves.easeInOutExpo,
          //         duration: 1.0,
          //         pageBuilder: () => Moodtracker(),
          //       ),
          //     ],
          //     child: Container(
          //       width: 254.0,
          //       height: 59.0,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(23.0),
          //         color: const Color(0xfffdb56f),
          //         boxShadow: [
          //           BoxShadow(
          //             color: const Color(0x29000000),
          //             offset: Offset(0, 13),
          //             blurRadius: 6,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            margin: EdgeInsets.fromLTRB(87, 706, 50, 50),
            child: FlatButton(
                minWidth: 254,
                height: 59.0,
                hoverColor: Color(0x29000000),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                color: const Color(0xfffdb56f),
                child: Text(
                  '''Let's begin!''',
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: 26,
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  if (_itemNumber == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Moodtracker(
                              itemNumber: _itemNumber,
                              sessionNumber: _sessionNumber)),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Item1(
                              itemNumber: _itemNumber,
                              sessionNumber: _sessionNumber)),
                    );
                  }
                }),
          ),

          Transform.translate(
            offset: Offset(0.0, 831.0),
            child: Container(
              width: 428.0,
              height: 95.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0),
                ),
                color: const Color(0xfff2f2f2),
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(42.0, 849.0),
            child:
                // Adobe XD layer: '主页' (shape)
                Container(
              width: 58.0,
              height: 58.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/home.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(328, 849, 50, 50),
            // child: RaisedButton(
            //   // minWidth: 254,
            //   // height: 59.0,

            //   hoverColor: Color(0x29000000),
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(20))),
            //   color: const Color(0xfffdb56f),
            //   child: Text(
            //     '''''',
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            child: OutlineButton(
              borderSide: BorderSide.none,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),
          Transform.translate(
            offset: Offset(328.0, 849.0),
            // child:
            //     // Adobe XD layer: '用户' (shape)
            //     PageLink(
            //   links: [
            //     PageLinkInfo(
            //       transition: LinkTransition.PushLeft,
            //       ease: Curves.slowMiddle,
            //       duration: 1.0,
            //       pageBuilder: () => User(),
            //     ),
            //   ],
            child: Container(
              width: 58.0,
              height: 58.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/gray_profile.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // ),

          Transform.translate(
            offset: Offset(328.0, 849.0),
            child: SizedBox(
              width: 58.0,
              height: 58.0,
              child: OutlineButton(
                borderSide: BorderSide.none,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => User(),
                    ),
                  );
                },
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(185.0, 850.0),
            // child:
            //     // Adobe XD layer: '日历' (shape)
            //     PageLink(
            //   links: [
            //     PageLinkInfo(
            //       transition: LinkTransition.PushLeft,
            //       ease: Curves.easeOut,
            //       duration: 1.0,
            //       pageBuilder: () => ScheduleDatepage(),
            //     ),
            //   ],
            child: Container(
              width: 58.0,
              height: 58.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/gray_calendar.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // ),

          Transform.translate(
            offset: Offset(185.0, 850.0),
            child: SizedBox(
              width: 58.0,
              height: 58.0,
              child: OutlineButton(
                borderSide: BorderSide.none,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScheduleDatepage(),
                    ),
                  );
                },
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(14.9, 403.0),
            child: SizedBox(
              width: 398.0,
              child: Text(
                'May you be full of sunshine\n like a sun.',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 28,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(109.0, 121.0),
            child:
                // Adobe XD layer: 'WechatIMG1138的副本' (shape)
                Container(
              width: 195.0,
              height: 180.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/logoOfStart.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
