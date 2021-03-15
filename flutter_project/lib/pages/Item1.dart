import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './itemImaginePage.dart';
import 'package:adobe_xd/page_link.dart';
import './Moodtracker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../config/Config.dart';
import 'package:dio/dio.dart';
import 'SessionFinishedpage.dart';

class Item1 extends StatefulWidget {
  int itemNumber;
  int sessionNumber;
  Item1({this.itemNumber, this.sessionNumber}); //Start from 1 and 1
  @override
  _Item1State createState() => _Item1State(itemNumber, sessionNumber);
}

class _Item1State extends State<Item1> {
  var _answer;
  var _displayQuestion;
  var _displayOption2_1;
  var _displayOption2_2;
  var _displayOption1;
  var _next;
  var _feedback;
  var _length;
  var _items;
  var _id;
  var _category;
  var _question;
  var _questionNumber;
  var _context;
  var _blank;
  var _itemNumber;
  var _sessionNumber;
  var _situation;
  var _control;
  var _displayText = '';
  var _images = [
    "assets/images/6%.png",
    "assets/images/12%.png",
    "assets/images/17%.png",
    "assets/images/23%.png",
    "assets/images/29%.png",
    "assets/images/35%.png",
    "assets/images/41%.png",
    "assets/images/47%.png",
    "assets/images/50%.png",
    "assets/images/52%.png",
    "assets/images/63%.png",
    "assets/images/69%.png",
    "assets/images/74%.png",
    "assets/images/80%.png",
    "assets/images/85%.png",
    "assets/images/90%.png",
    "assets/images/95%.png",
    "assets/images/100%.png",
  ];

  _Item1State(this._itemNumber, this._sessionNumber);

  @override
  void initState() {
    super.initState();
    _answer = "";
    _next = false;
    _feedback = "";
    _length = 0;
    _items = [];
    _id = "";
    _control = false;
    _category = "";
    _question = "";
    _situation = "";
    if (_sessionNumber == null) {
      _sessionNumber = 1;
    }
    if (_itemNumber == null) {
      _itemNumber = 1;
    }
    print('''sessionnumber1 : $_sessionNumber''');
    _questionNumber = 1;
    _getData();
  }

  _sendData() async {
    var api = '${Config.domain}/rest/response/senddata';
    var response = await Dio().post(api, data: {
      "userid": _id,
      "trailNumber": _itemNumber,
      "category": _category,
      "sessionNumber": _sessionNumber,
      // following could be implemented with stopWatch()
      //             "readingDuration": "10",
      //             "wordRT1": "100" ,
      //             "wordAccuracy1": "1" ,
      //             "clueRequired": "0",
      //             "wordRT2": "0",
      //             "wordAccuracy2": "0",
      //             "questionRT1": "100",
      //             "questionAccuracy1": "1",
      //             "questionRT2":  "0",
      //             "questionAccuracy2":"0"
    });
    if (response.data["message"] == 'success') {
      print(response.data);
    }
  }

  _getData() async {
    var api = '${Config.domain}/rest/users/uploadcategory';
    var response = await Dio().get(api);
    var currentUser = response.data[0];
    _id = currentUser["userid"];
    print(_id);
    var api2 = "";
    _control = currentUser["controlitem"];
    if (_control == false) {
      print("training");
      _category = currentUser["category"];
      api2 = '${Config.domain}/rest/$_category/session$_sessionNumber';
    } else {
      print("control");
      api2 = '${Config.domain}/rest/controlitems/session$_sessionNumber';
    }
    var response2 = await Dio().get(api2);
    _items = response2.data;
    _processData(_itemNumber - 1);
  }

  void _processData(int i) {
    if (_sessionNumber == null) {
      _sessionNumber = 1;
    }
    if (_itemNumber == null) {
      _itemNumber = 1;
    }
    setState(() {
      _context = _items[i]["context"];
      _blank = _items[i]["blank"];
      _situation = _items[i]["situation"];
      _feedback = "";
      _next = false;
      if (_questionNumber == 1) {
        print(0);
        _question = _items[i]["question1"];
        _answer = _items[i]["answer1"];
        _displayText = '$_context\n\n$_question';
        _displayOption2_1 = null;
        _displayOption2_2 = null;
        updateQuestion();
        updateOption1();
      } else {
        print(3);
        _question = _items[i]["question2"];
        _answer = _items[i]["answer2"];
        _displayText =
            'Now use the passage to answer the following question: \n\n\n$_question';
        _displayOption1 = null;
        updateQuestion();
        updateOption2();
      }
    });
  }

  void toggle() {
    print("toggle");
    print(_questionNumber);
    if (_questionNumber == 1) {
      _questionNumber = 2;
    } else {
      _questionNumber = 1;
      _route();
    }
  }

  void _route() {
    if (_control == false) {
      //training items have imagine page, control dont
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => itemImaginePage(
                  situation: _situation,
                  itemNumber: _itemNumber,
                  sessionNumber: _sessionNumber,
                )),
      );
    } else {
      if (_itemNumber != 0 && _itemNumber % 18 == 0) {
        print("here2");
        print('$_itemNumber');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Sessionfinishedpage(
                    itemNumber: 1,
                    sessionNumber: _sessionNumber,
                  )),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Item1(
                    itemNumber: _itemNumber + 1,
                    sessionNumber: _sessionNumber,
                  )),
        );
      }
    }
  }

  void updateQuestion() {
    _displayQuestion = Transform.translate(
      offset: Offset(45.9, 253.0),
      child: SizedBox(
        width: 320.0,
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'ZiZhiQuXiMaiTi',
              fontSize: 21,
              color: const Color(0xff000000),
            ),
            children: [
              TextSpan(
                text: '$_displayText',
              ),
            ],
          ),
          // textHeightBehavior:
          //     TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void updateOption1() {
    _displayOption1 = Transform.translate(
        offset: Offset(110, 513.0),
        child: Container(
          width: 250.0,
          child: TextField(
            decoration: InputDecoration(
                labelText: "$_blank",
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none),
            onChanged: (value) {
              _length = value.length;
              if (_length == _answer.length) {
                _next = _validateData(value);
              } else if (_length > _answer.length) {
                setState(() {
                  _feedback = '↺ Please fill in less characters.';
                });
              } else {
                _next = false;
                setState(() {
                  _feedback = '↺ Please fill in more characters.';
                });
              }
            },
            style: TextStyle(
              fontSize: 45,
              color: const Color(0xfffaae7c),
            ),
          ),
        ));
  }

  void updateOption2() {
    _displayOption2_1 = Transform.translate(
      offset: Offset(120.6, 458.0),
      child: FlatButton(
          minWidth: 180.0,
          height: 50,
          hoverColor: Color(0xfffaaf7b),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          color: Colors.grey[300],
          child: Text(
            'Yes',
            style: TextStyle(
              fontFamily: 'ZiZhiQuXiMaiTi',
              fontSize: 21,
              color: const Color(0xff000000),
            ),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            _next = _validateData("Yes");
          }),
    );

    _displayOption2_2 = Transform.translate(
      offset: Offset(120.6, 531.0),
      child: FlatButton(
          minWidth: 180.0,
          height: 50,
          hoverColor: Color(0xfffaaf7b),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          color: Colors.grey[300],
          child: Text(
            'No',
            style: TextStyle(
              fontFamily: 'ZiZhiQuXiMaiTi',
              fontSize: 21,
              color: const Color(0xff000000),
            ),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            _next = _validateData("No");
          }),
    );
  }

  bool _compareData(String string1, String string2) {
    if (string1 == null || string2 == null) {
      return false;
    }
    return string1.toLowerCase() == string2.toLowerCase();
  }

  bool _validateData(value) {
    if (_compareData(_answer, value)) {
      setState(() {
        _feedback = '✔ Great, this is a good answer!';
      });
      return true;
    } else {
      setState(() {
        _feedback = '✗ Good. But what would be a different answer?';
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: '007 Sunny Morning' (shape)
          Container(
            width: 428.0,
            height: 926.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/background2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 154.0),
            child: Container(
              width: 347.0,
              height: 676.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 195.0),
            child: Container(
              width: 20.0,
              height: 594.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x5a000000),
                    offset: Offset(0, 3),
                    blurRadius: 40,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(409.0, 195.0),
            child: Container(
              width: 20.0,
              height: 594.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(40, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          // Adobe XD layer: 'Status Bars - iPhon…' (group)
          SizedBox(
            width: 428.0,
            height: 44.0,
            child: Stack(
              children: <Widget>[
                Pinned.fromSize(
                  bounds: Rect.fromLTWH(0.0, 0.0, 428.0, 44.0),
                  size: Size(428.0, 44.0),
                  pinLeft: true,
                  pinRight: true,
                  pinTop: true,
                  pinBottom: true,
                  child:
                      // Adobe XD layer: 'Status Bar' (group)
                      Stack(
                    children: <Widget>[
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.5, 0.0, 427.5, 44.0),
                        size: Size(428.0, 44.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child:
                            // Adobe XD layer: 'BG' (shape)
                            Container(),
                      ),
                      Pinned.fromSize(
                        bounds: Rect.fromLTWH(0.0, 0.0, 428.0, 44.0),
                        size: Size(428.0, 44.0),
                        pinLeft: true,
                        pinRight: true,
                        pinTop: true,
                        pinBottom: true,
                        child:
                            // Adobe XD layer: 'Status Bar' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 428.0, 44.0),
                              size: Size(428.0, 44.0),
                              pinLeft: true,
                              pinRight: true,
                              pinTop: true,
                              pinBottom: true,
                              child:
                                  // Adobe XD layer: 'Bars/Status Bars/iP…' (shape)
                                  Container(),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(388.8, 17.3, 24.3, 11.3),
                              size: Size(428.0, 44.0),
                              pinRight: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Battery' (group)
                                  Stack(
                                children: <Widget>[
                                  Pinned.fromSize(
                                    bounds: Rect.fromLTWH(0.0, 0.0, 22.0, 11.3),
                                    size: Size(24.3, 11.3),
                                    pinLeft: true,
                                    pinRight: true,
                                    pinTop: true,
                                    pinBottom: true,
                                    child:
                                        // Adobe XD layer: 'Border' (shape)
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.67),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0x59ffffff)),
                                      ),
                                    ),
                                  ),
                                  // Pinned.fromSize(
                                  //   bounds: Rect.fromLTWH(23.0, 3.7, 1.3, 4.0),
                                  //   size: Size(24.3, 11.3),
                                  //   pinRight: true,
                                  //   fixedWidth: true,
                                  //   fixedHeight: true,
                                  //   child:
                                  //       // Adobe XD layer: 'Cap' (shape)
                                  //       SvgPicture.string(
                                  //     _svg_5e5um9,
                                  //     allowDrawingOutsideViewBox: true,
                                  //     fit: BoxFit.fill,
                                  //   ),
                                  // ),
                                  Pinned.fromSize(
                                    bounds: Rect.fromLTWH(2.0, 2.0, 18.0, 7.3),
                                    size: Size(24.3, 11.3),
                                    pinLeft: true,
                                    pinTop: true,
                                    pinBottom: true,
                                    fixedWidth: true,
                                    child:
                                        // Adobe XD layer: 'Capacity' (shape)
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.33),
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(368.5, 17.3, 15.3, 11.0),
                              size: Size(428.0, 44.0),
                              pinRight: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Wifi' (shape)
                                  SvgPicture.string(
                                _svg_ya1094,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(337.1, 17.7, 17.0, 10.7),
                              size: Size(428.0, 44.0),
                              fixedWidth: true,
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Cellular Connection' (shape)
                                  SvgPicture.string(
                                _svg_gbmjcf,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(21.5, 13.0, 54.0, 21.0),
                              size: Size(428.0, 44.0),
                              pinLeft: true,
                              fixedWidth: true,
                              fixedHeight: true,
                              child:
                                  // Adobe XD layer: 'Time Style' (group)
                                  Stack(
                                children: <Widget>[
                                  Pinned.fromSize(
                                    bounds: Rect.fromLTWH(0.0, 0.0, 54.0, 21.0),
                                    size: Size(54.0, 21.0),
                                    pinLeft: true,
                                    pinRight: true,
                                    pinTop: true,
                                    pinBottom: true,
                                    child:
                                        // Adobe XD layer: 'Time - Dark' (group)
                                        Stack(
                                      children: <Widget>[
                                        Pinned.fromSize(
                                          bounds: Rect.fromLTWH(
                                              0.0, 0.0, 54.0, 21.0),
                                          size: Size(54.0, 21.0),
                                          pinLeft: true,
                                          pinRight: true,
                                          pinTop: true,
                                          pinBottom: true,
                                          child:
                                              // Adobe XD layer: 'Time - Light backgr…' (shape)
                                              Container(),
                                        ),
                                        Pinned.fromSize(
                                          bounds: Rect.fromLTWH(
                                              0.0, 2.0, 54.0, 18.0),
                                          size: Size(54.0, 21.0),
                                          pinLeft: true,
                                          pinRight: true,
                                          pinTop: true,
                                          pinBottom: true,
                                          child:
                                              // Adobe XD layer: 'Time' (text)
                                              Text(
                                            '9:41',
                                            style: TextStyle(
                                              fontFamily: 'SFProText-Semibold',
                                              fontSize: 15,
                                              color: const Color(0xffffffff),
                                              letterSpacing: -0.3,
                                            ),
                                            textAlign: TextAlign.center,
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
          Transform.translate(
            offset: Offset(27.0, 97.0),
            child: SizedBox(
              width: 136.0,
              child: Text(
                'Session ${_sessionNumber}',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 28,
                  color: const Color(0xfff7f7f7),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Container(
            child: _displayQuestion,
          ),

          Container(
            child: _displayOption1,
          ),

          Container(
            child: _displayOption2_1,
          ),

          Container(
            child: _displayOption2_2,
          ),

          // Transform.translate(
          //   offset: Offset(45.9, 253.0),
          //   child: SizedBox(
          //     width: 320.0,
          //     child: Text.rich(
          //       TextSpan(
          //         style: TextStyle(
          //           fontFamily: 'ZiZhiQuXiMaiTi',
          //           fontSize: 21,
          //           color: const Color(0xff000000),
          //         ),
          //         children: [
          //           TextSpan(
          //             text: '${_context}\n\n${_question}',
          //           ),
          //         ],
          //       ),
          //       // textHeightBehavior:
          //       //     TextHeightBehavior(applyHeightToFirstAscent: false),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),

          // Transform.translate(
          //     offset: Offset(110, 503.0),
          //     child: Container(
          //       width: 250.0,
          //       child: TextField(
          //         decoration: InputDecoration(
          //             labelText: "${_blank}",
          //             contentPadding: EdgeInsets.all(0),
          //             border: InputBorder.none),
          //         onChanged: (value) {
          //           _length = value.length;
          //           if (_length >= _answer.length) {
          //             _next = _validateData(value);
          //           }
          //           if (_length >= 6) {
          //             setState(() {
          //               _feedback = '↺ Please fill in less characters.';
          //             });
          //           }
          //         },
          //         style: TextStyle(
          //           fontSize: 55,
          //           color: const Color(0xfffaae7c),
          //         ),
          //       ),
          //     )),

          // Transform.translate(
          //   offset: Offset(37.9, 253.0),
          //   child: SizedBox(
          //     width: 354.0,
          //     child: Text.rich(
          //       TextSpan(
          //         style: TextStyle(
          //           fontFamily: 'ZiZhiQuXiMaiTi',
          //           fontSize: 21,
          //           color: const Color(0xff000000),
          //         ),
          //         children: [
          //           TextSpan(
          //             text: '${_context}',
          //           ),
          //           TextSpan(
          //             text: '${_blank}',
          //             style: TextStyle(
          //               fontSize: 55,
          //               color: const Color(0xfffaae7c),
          //             ),
          //           ),
          //         ],
          //       ),
          //       textHeightBehavior:
          //           TextHeightBehavior(applyHeightToFirstAscent: false),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),

          Transform.translate(
            offset: Offset(274.3, 89.0),
            child: SizedBox(
              width: 106.0,
              child: Text(
                '${_itemNumber}/18',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 39,
                  color: const Color(0xfff8eaea),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(97.4, 628.0),
            child: SizedBox(
              width: 233.0,
              child: Text(
                'Type in the first missing letter',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 15,
                  color: const Color(0xffb9b9b9),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 763.0),
            // child: PageLink(
            //   links: [
            //     PageLinkInfo(
            //       transition: LinkTransition.PushLeft,
            //       ease: Curves.easeInOutExpo,
            //       duration: 1.0,
            //       pageBuilder: () => Item2(),
            //     ),
            //   ],
            child: Container(
              width: 347.0,
              height: 67.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  colors: [
                    const Color(0xfff0660e),
                    const Color(0xfff4b77e),
                    const Color(0xffffffff),
                    const Color(0xfffaaf7b)
                  ],
                  stops: [0.0, 0.0, 0.0, 1.0],
                ),
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(156.3, 775.0),
            child: FlatButton(
              color: Colors.transparent,
              child: Text(
                'Next',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 43,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                if (_next == true) {
                  toggle();
                  _processData(_itemNumber - 1);
                } else if (_length == 0) {
                  setState(() {
                    _feedback = '↺ Please fill in all missing characters.';
                  });
                }
              },
            ),
          ),

          Transform.translate(
            offset: Offset(108.4, 685.0),
            child: SizedBox(
              width: 211.0,
              child: Text(
                "${_feedback}",
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 21,
                  color: const Color(0xfff0660e),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Transform.translate(
          //   offset: Offset(177.0, 568.0),
          //   child: PageLink(
          //     links: [
          //       PageLinkInfo(
          //         transition: LinkTransition.Fade,
          //         ease: Curves.linear,
          //         duration: 1.0,
          //         pageBuilder: () => Wrong1(),
          //       ),
          //     ],
          //     child: Container(
          //       width: 38.0,
          //       height: 33.0,
          //       decoration: BoxDecoration(
          //         color: const Color(0xffffffff),
          //       ),
          //     ),
          //   ),
          // ),
          // Transform.translate(
          //   offset: Offset(224.0, 568.0),
          //   child: Container(
          //     width: 37.0,
          //     height: 33.0,
          //     decoration: BoxDecoration(
          //       color: const Color(0xffffffff),
          //     ),
          //   ),
          // ),
          Transform.translate(
            offset: Offset(140.0, 107.0),
            child:
                // Adobe XD layer: '截屏2021-03-02 19.21.…' (shape)
                Container(
              width: 139.0,
              height: 131.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(76.0),
                image: DecorationImage(
                  image: AssetImage('${_images[_itemNumber - 1]}'),
                  //const AssetImage('assets/images/6%.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // Transform.translate(
          //   offset: Offset(365.0, 45.0),
          //   child:
          //       // Adobe XD layer: 'tingzhi' (shape)
          //       Container(
          //     width: 45.0,
          //     height: 45.0,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage('assets/images/stop.png'),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),

          Transform.translate(
            offset: Offset(20.0, 42.0),
            child:
                // Adobe XD layer: 'jiantou' (shape)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushRight,
                  ease: Curves.easeIn,
                  duration: 1.0,
                  pageBuilder: () => Moodtracker(),
                ),
              ],
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/goback.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_5e5um9 =
    '<svg viewBox="23.0 3.7 1.3 4.0" ><path transform="translate(23.0, 3.67)" d="M 0 0 L 0 4 C 0.8047311305999756 3.661223411560059 1.328037977218628 2.873133182525635 1.328037977218628 2 C 1.328037977218628 1.126866698265076 0.8047311305999756 0.3387765288352966 0 0" fill="#ffffff" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ya1094 =
    '<svg viewBox="368.5 17.3 15.3 11.0" ><path transform="translate(368.5, 17.33)" d="M 7.444817543029785 10.90732574462891 L 5.438717365264893 8.885025024414062 C 5.376617431640625 8.824725151062012 5.342417240142822 8.741024971008301 5.345117092132568 8.653725624084473 C 5.346917152404785 8.567325592041016 5.383817195892334 8.485424995422363 5.448617458343506 8.426925659179688 C 6.729317188262939 7.344225406646729 8.604917526245117 7.344225406646729 9.885617256164551 8.426925659179688 C 9.950417518615723 8.485424995422363 9.987317085266113 8.567325592041016 9.989117622375488 8.653725624084473 C 9.990917205810547 8.741024971008301 9.956717491149902 8.824725151062012 9.894617080688477 8.885025024414062 L 7.889417171478271 10.90732574462891 C 7.830917358398438 10.96672534942627 7.75081729888916 11.00002574920654 7.667117118835449 11.00002574920654 C 7.583417415618896 11.00002574920654 7.503317356109619 10.96672534942627 7.444817543029785 10.90732574462891 Z M 10.97461700439453 7.365825176239014 C 10.06831741333008 6.545925140380859 8.889317512512207 6.092325210571289 7.667117118835449 6.092325210571289 C 6.445817470550537 6.093225002288818 5.267717361450195 6.546825408935547 4.362317085266113 7.365825176239014 C 4.239917278289795 7.481925487518311 4.046417236328125 7.480125427246094 3.92761754989624 7.360425472259521 L 2.768417358398438 6.189525127410889 C 2.707217454910278 6.12832498550415 2.673017501831055 6.045525074005127 2.673917531967163 5.95912504196167 C 2.674817562103271 5.871825218200684 2.709917545318604 5.789925098419189 2.772917509078979 5.729625225067139 C 5.531417369842529 3.165525197982788 9.804617881774902 3.165525197982788 12.5640172958374 5.729625225067139 C 12.62611770629883 5.789925098419189 12.66211700439453 5.871825218200684 12.66301727294922 5.95912504196167 C 12.66391754150391 6.045525074005127 12.62971782684326 6.12832498550415 12.56851768493652 6.189525127410889 L 11.40931701660156 7.360425472259521 C 11.34854698181152 7.421195983886719 11.26901149749756 7.451574802398682 11.18938732147217 7.451567649841309 C 11.11217403411865 7.451561450958252 11.03487586975098 7.422982215881348 10.97461700439453 7.365825176239014 Z M 13.64401721954346 4.67032527923584 C 12.03121757507324 3.138525247573853 9.89191722869873 2.284425020217896 7.667117118835449 2.284425020217896 C 5.442317485809326 2.284425020217896 3.302117586135864 3.138525247573853 1.689317345619202 4.67032527923584 C 1.568717360496521 4.789124965667725 1.374317288398743 4.787325382232666 1.25461733341217 4.666725158691406 L 0.09361732751131058 3.496725082397461 C 0.03331732377409935 3.435525178909302 -0.0008826774428598583 3.353625059127808 1.73225998878479e-05 3.26722526550293 C 0.0009173226426355541 3.181725263595581 0.03511732444167137 3.099825143814087 0.09631732851266861 3.039525032043457 C 4.329017162322998 -1.013175010681152 11.00521755218506 -1.013175010681152 15.23701763153076 3.039525032043457 C 15.2982177734375 3.099825143814087 15.33241748809814 3.181725263595581 15.33331775665283 3.26722526550293 C 15.3342170715332 3.353625059127808 15.30001735687256 3.435525178909302 15.23971748352051 3.496725082397461 L 14.07871723175049 4.666725158691406 C 14.0181884765625 4.727709770202637 13.93880367279053 4.758315086364746 13.85938453674316 4.758310794830322 C 13.78174877166748 4.758306503295898 13.70407772064209 4.729050636291504 13.64401721954346 4.67032527923584 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_gbmjcf =
    '<svg viewBox="337.1 17.7 17.0 10.7" ><path transform="translate(337.11, 17.67)" d="M 15.00030040740967 10.6668004989624 C 14.44770050048828 10.6668004989624 14.00040054321289 10.21860027313232 14.00040054321289 9.666900634765625 L 14.00040054321289 0.9999000430107117 C 14.00040054321289 0.4473000168800354 14.44770050048828 0 15.00030040740967 0 L 16.00020027160645 0 C 16.55190086364746 0 17.00010108947754 0.4473000168800354 17.00010108947754 0.9999000430107117 L 17.00010108947754 9.666900634765625 C 17.00010108947754 10.21860027313232 16.55190086364746 10.6668004989624 16.00020027160645 10.6668004989624 L 15.00030040740967 10.6668004989624 Z M 10.33290004730225 10.6668004989624 C 9.781200408935547 10.6668004989624 9.333000183105469 10.21860027313232 9.333000183105469 9.666900634765625 L 9.333000183105469 3.333600044250488 C 9.333000183105469 2.781000137329102 9.781200408935547 2.333699941635132 10.33290004730225 2.333699941635132 L 11.33370018005371 2.333699941635132 C 11.88539981842041 2.333699941635132 12.33360004425049 2.781000137329102 12.33360004425049 3.333600044250488 L 12.33360004425049 9.666900634765625 C 12.33360004425049 10.21860027313232 11.88539981842041 10.6668004989624 11.33370018005371 10.6668004989624 L 10.33290004730225 10.6668004989624 Z M 5.666399955749512 10.6668004989624 C 5.114700317382812 10.6668004989624 4.666500091552734 10.21860027313232 4.666500091552734 9.666900634765625 L 4.666500091552734 5.666399955749512 C 4.666500091552734 5.114700317382812 5.114700317382812 4.666500091552734 5.666399955749512 4.666500091552734 L 6.666300296783447 4.666500091552734 C 7.218900203704834 4.666500091552734 7.667099952697754 5.114700317382812 7.667099952697754 5.666399955749512 L 7.667099952697754 9.666900634765625 C 7.667099952697754 10.21860027313232 7.218900203704834 10.6668004989624 6.666300296783447 10.6668004989624 L 5.666399955749512 10.6668004989624 Z M 0.9999000430107117 10.6668004989624 C 0.4473000168800354 10.6668004989624 0 10.21860027313232 0 9.666900634765625 L 0 7.667099952697754 C 0 7.114500045776367 0.4473000168800354 6.666300296783447 0.9999000430107117 6.666300296783447 L 1.999800086021423 6.666300296783447 C 2.5524001121521 6.666300296783447 2.99970006942749 7.114500045776367 2.99970006942749 7.667099952697754 L 2.99970006942749 9.666900634765625 C 2.99970006942749 10.21860027313232 2.5524001121521 10.6668004989624 1.999800086021423 10.6668004989624 L 0.9999000430107117 10.6668004989624 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
