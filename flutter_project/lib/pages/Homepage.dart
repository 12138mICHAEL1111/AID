import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/config/Config.dart';
import 'package:flutter_project/pages/Item1.dart';
import 'package:flutter_project/pages/ScheduleDatepage.dart';
import './User.dart';

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
  var _response;
  var _api;

  _HomepageState(this._sessionNumber, this._itemNumber);

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    _api = '${Config.domain}/rest/users/uploadcategory';
    _response = await Dio().get(_api);
    if (_itemNumber == null || _sessionNumber == null) {
      getSession();
      getItem();
    }
    if (_sessionNumber > 4) {
      _sessionNumber = 4;
    }
    getDate();
  }

  getSession() {
    setState(() {
      _sessionNumber = _response.data[0]["currentsession"];
    });
  }

  getItem() {
    setState(() {
      _itemNumber = _response.data[0]["currentitem"];
    });
  }

  getDate() async {
    var sessionTime = _response.data[0]["sessiontime"];
    if (sessionTime != null) {
      setState(() {
        _date = sessionTime["session$_sessionNumber"];
      });
    } else {
      _date = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'WechatIMG1201' (shape)
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6116,
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
            offset: Offset(MediaQuery.of(context).size.width * 0.05,
                MediaQuery.of(context).size.height * 0.3713),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.99,
              child: Text(
                'Welcome back！',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.055,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.05677,
                MediaQuery.of(context).size.height * 0.62528),
            child: SizedBox(
              width: 188.0,
              child: Text(
                "Session ${_sessionNumber}",
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.045,
                  color: const Color(0xfff6c16d),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.53528,
                MediaQuery.of(context).size.height * 0.63),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                '$_date' ?? "",
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.033,
                  color: const Color(0xfff6c16d),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.07944,
                MediaQuery.of(context).size.height * 0.7096),
            child: Text(
              'Welcome! Are you ready to \nstart session ${_sessionNumber} today?',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.20327,
                MediaQuery.of(context).size.height * 0.8041,
                MediaQuery.of(context).size.width * 0.11682,
                MediaQuery.of(context).size.height * 0.05695),
            child: FlatButton(
                minWidth: 254,
                height: MediaQuery.of(context).size.height * 0.0672,
                hoverColor: Color(0x29000000),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                color: const Color(0xfffdb56f),
                child: Text(
                  '''Let's begin!''',
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: MediaQuery.of(context).size.height * 0.033,
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
            offset: Offset(0.0, MediaQuery.of(context).size.height * 0.91647),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1082,
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
            offset: Offset(MediaQuery.of(context).size.width * 0.09813,
                MediaQuery.of(context).size.height * 0.93),
            child:
                // Adobe XD layer: '主页' (shape)
                Container(
              width: MediaQuery.of(context).size.width * 0.1355,
              height: MediaQuery.of(context).size.height * 0.06606,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/home.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.76636,
                MediaQuery.of(context).size.height * 0.93,
                MediaQuery.of(context).size.width * 0.11682,
                MediaQuery.of(context).size.height * 0.05695),
            child: OutlineButton(
              borderSide: BorderSide.none,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.766355,
                MediaQuery.of(context).size.height * 0.93),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.1355,
              height: MediaQuery.of(context).size.height * 0.06606,
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
            offset: Offset(MediaQuery.of(context).size.width * 0.766355,
                MediaQuery.of(context).size.height * 0.93),
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
            offset: Offset(MediaQuery.of(context).size.width * 0.432243,
                MediaQuery.of(context).size.height * 0.93),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.1355,
              height: MediaQuery.of(context).size.height * 0.06606,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/gray_calendar.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.432243,
                MediaQuery.of(context).size.height * 0.93),
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
            offset: Offset(MediaQuery.of(context).size.width * 0.034813,
                MediaQuery.of(context).size.height * 0.458998),
            child: SizedBox(
              width: 398.0,
              child: Text(
                'May you be full of sunshine\n like a sun.',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.033,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.254673,
                MediaQuery.of(context).size.height * 0.13781),
            child:
                // Adobe XD layer: 'WechatIMG1138的副本' (shape)
                Container(
              width: MediaQuery.of(context).size.width * 0.4556,
              height: MediaQuery.of(context).size.height * 0.205,
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
