import 'package:flutter/material.dart';
import 'package:flutter_project/pages/Sessionfinishedpage.dart';
import './Item1.dart';
import '../config/Config.dart';
import 'package:dio/dio.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Moodtracker extends StatefulWidget {
  int itemNumber;
  int sessionNumber;

  Moodtracker({this.itemNumber, this.sessionNumber});

  @override
  _MoodtrackerState createState() =>
      _MoodtrackerState(itemNumber, sessionNumber);
}

class _MoodtrackerState extends State<Moodtracker> {
  var images = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
  ];

  var pressedImage = [
    "assets/images/11.png",
    "assets/images/22.png",
    "assets/images/33.png",
    "assets/images/44.png",
    "assets/images/55.png",
  ];
  var temparrayA = [];
  var anixousScore;

  var temparrayH = [];
  var happyScore;

  var temparrayS = [];
  var sadScore;
  String id;
  var scoreArray = [];
  var flag = true;

  var _session;
  var _item;

  _MoodtrackerState(this._item, this._session);

  uploadmood() async {
    var api;
    if (widget.itemNumber == 18) {
      api = '${Config.domain}/rest/users/uploadaftersessionmood';
    } else {
      api = '${Config.domain}/rest/users/uploadsessionmood';
    }
    var sessiontime = "session" + widget.sessionNumber.toString();
    await Dio().post(api, data: {
      "userid": this.id,
      "sessionmood": this.scoreArray,
      "sessiontime": sessiontime
    });
  }

  getid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    this.id = pref.getString('userid');
  }

  ImageRadioController aController;
  ImageRadioController hController;
  ImageRadioController sController;

  @override
  void initState() {
    aController = new ImageRadioController();
    hController = new ImageRadioController();
    sController = new ImageRadioController();
    super.initState();
    getid();
  }

  addToArrayA(int number) {
    temparrayA.add(number);
    var newList = new List.from(temparrayA.reversed);
    try {
      anixousScore = newList[4];
    } on RangeError {
      anixousScore = -1;
    }
  }

  addToArrayS(int number) {
    temparrayS.add(number);
    var newList = new List.from(temparrayS.reversed);
    try {
      sadScore = newList[4];
    } on RangeError {
      sadScore = -1;
    }
  }

  addToArrayH(int number) {
    temparrayH.add(number);
    var newList = new List.from(temparrayH.reversed);
    try {
      happyScore = newList[4];
    } on RangeError {
      happyScore = -1;
    }
  }

  _uploadProgress() async {
    // store current progress in the db
    var api = '${Config.domain}/rest/users/uploadprogress';
    await Dio().post(api, data: {"id": id, "session": _session, "item": _item});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 0.0),
            child:
                // Adobe XD layer: '007 Sunny Morning' (shape)
                Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/background2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(34.0, 155.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.079,
                MediaQuery.of(context).size.height * 0.168),
            child: Container(
              // width: 362.0,
              // height: 676.0,
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.73,
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
            // offset: Offset(25.0, 100.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.058,
                MediaQuery.of(context).size.height * 0.107),
            child: Text(
              'How do you feel today？',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.036,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            // offset: Offset(34.0, 764.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.079,
                MediaQuery.of(context).size.height * 0.83),
            // child: PageLink(
            // links: [
            //   PageLinkInfo(
            //     transition: LinkTransition.PushLeft,
            //     ease: Curves.easeInOutExpo,
            //     duration: 1.0,
            //     pageBuilder: () => Item1(),
            //   ),
            // ],
            child: Container(
              // width: 362.0,
              // height: 67.0,
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.072,
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
              // offset: Offset(156.3, 775.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.36,
                  MediaQuery.of(context).size.height * 0.84),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: OutlineButton(
                    borderSide: BorderSide.none,
                    onPressed: () {
                      if (anixousScore != null) {
                        scoreArray.add(anixousScore);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'please fill anixous score',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER);
                        flag = false;
                      }
                      if (happyScore != null) {
                        scoreArray.add(happyScore);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'please fill happy field',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER);
                        flag = false;
                      }
                      if (sadScore != null) {
                        scoreArray.add(sadScore);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'please fill sad field',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER);
                        flag = false;
                      }
                      if (scoreArray.length == 3) {
                        flag = true;
                      }
                      if (flag == true) {
                        uploadmood();
                        if (_session != 4 && _item == 18) {
                          // After a session finished
                          _item = 1;
                          _session = _session + 1;
                          _uploadProgress();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sessionfinishedpage(
                                      itemNumber: _item,
                                      sessionNumber: _session,
                                    )),
                          );
                        } else if (_session == 4 && _item == 18) {
                          _uploadProgress();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sessionfinishedpage(
                                      itemNumber: _item,
                                      sessionNumber: _session + 1,
                                    )),
                          );
                        } else {
                          // Before a session starts
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Item1(
                                      itemNumber: _item,
                                      sessionNumber: _session,
                                    )),
                          );
                        }
                      } else {
                        scoreArray.clear();
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontFamily: 'ZiZhiQuXiMaiTi',
                        fontSize: MediaQuery.of(context).size.height * 0.037,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))),
          Transform.translate(
            // offset: Offset(149.5, 185.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.35,
                MediaQuery.of(context).size.height * 0.199),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.30,
              child: Text(
                'Anxious',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.032,
                  color: const Color.fromRGBO(32, 50, 80, 1.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(149.5, 370.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.348,
                MediaQuery.of(context).size.height * 0.4),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.302,
              child: Text(
                'Sad',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.032,
                  color: const Color.fromRGBO(32, 50, 80, 1.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(149.5, 555.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.348,
                MediaQuery.of(context).size.height * 0.6),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                'Happy',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.032,
                  color: const Color.fromRGBO(32, 50, 80, 1.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
              // offset: Offset(315.0, 240.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.73,
                  MediaQuery.of(context).size.height * 0.26),
              child: Stack(children: <Widget>[
                ImageRadio(
                  images[4],
                  pressedImage[4],
                  controller: aController,
                  onChange: (v) => addToArrayA(1),
                  width: MediaQuery.of(context).size.width * 0.14,
                  height: MediaQuery.of(context).size.height * 0.064,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Text(
                    'Not at all',
                    style: TextStyle(
                      fontFamily: 'ZiZhiQuXiMaiTi',
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      color: const Color.fromRGBO(32, 50, 80, 1.0),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ])),
          Transform.translate(
              // offset: Offset(250.0, 240.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.58,
                  MediaQuery.of(context).size.height * 0.26),
              child: ImageRadio(
                images[3],
                pressedImage[3],
                controller: aController,
                onChange: (value) => addToArrayA(2),
                // height: 60.0,
                // width: 60.0,
                width: MediaQuery.of(context).size.width * 0.14,
                height: MediaQuery.of(context).size.height * 0.064,
              )),
          Transform.translate(
              // offset: Offset(185.0, 240.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.43,
                  MediaQuery.of(context).size.height * 0.26),
              child: Stack(children: <Widget>[
                ImageRadio(
                  images[2],
                  pressedImage[2],
                  controller: aController,
                  onChange: (value) => addToArrayA(3),
                  width: MediaQuery.of(context).size.width * 0.14,
                  height: MediaQuery.of(context).size.height * 0.064,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Text(
                    'Somewhat',
                    style: TextStyle(
                      fontFamily: 'ZiZhiQuXiMaiTi',
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      color: const Color.fromRGBO(32, 50, 80, 1.0),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ])),
          Transform.translate(
              // offset: Offset(55.0, 240.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.127,
                  MediaQuery.of(context).size.height * 0.26),
              child: Stack(children: <Widget>[
                ImageRadio(
                  images[0],
                  pressedImage[0],
                  controller: aController,
                  onChange: (value) => addToArrayA(5),
                  width: MediaQuery.of(context).size.width * 0.14,
                  height: MediaQuery.of(context).size.height * 0.064,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Text(
                    'Very much',
                    style: TextStyle(
                      fontFamily: 'ZiZhiQuXiMaiTi',
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      color: const Color.fromRGBO(32, 50, 80, 1.0),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ])),
          Transform.translate(
              // offset: Offset(123.0, 243.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.286,
                  MediaQuery.of(context).size.height * 0.262),
              child: ImageRadio(
                images[1],
                pressedImage[1],
                controller: aController,
                onChange: (value) => addToArrayA(4),
                // height: 54.0,
                // width: 53.7,
                width: MediaQuery.of(context).size.width * 0.125,
                height: MediaQuery.of(context).size.height * 0.057,
              )),
          Transform.translate(
              // offset: Offset(315.0, 425.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.735,
                  MediaQuery.of(context).size.height * 0.459),
              child: Stack(children: <Widget>[
                ImageRadio(
                  images[4],
                  pressedImage[4],
                  controller: sController,
                  onChange: (value) => addToArrayS(1),
                  width: MediaQuery.of(context).size.width * 0.14,
                  height: MediaQuery.of(context).size.height * 0.064,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Text(
                    'Not at all',
                    style: TextStyle(
                      fontFamily: 'ZiZhiQuXiMaiTi',
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      color: const Color.fromRGBO(32, 50, 80, 1.0),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ])),
          Transform.translate(
              // offset: Offset(250.0, 425.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.585,
                  MediaQuery.of(context).size.height * 0.459),
              child: ImageRadio(
                images[3],
                pressedImage[3],
                controller: sController,
                onChange: (value) => addToArrayS(2),
                width: MediaQuery.of(context).size.width * 0.14,
                height: MediaQuery.of(context).size.height * 0.064,
              )),
          Transform.translate(
              // offset: Offset(185.0, 425.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.43,
                  MediaQuery.of(context).size.height * 0.459),
              child: Stack(children: <Widget>[
                ImageRadio(
                  images[2],
                  pressedImage[2],
                  controller: sController,
                  onChange: (value) => addToArrayS(3),
                  width: MediaQuery.of(context).size.width * 0.14,
                  height: MediaQuery.of(context).size.height * 0.064,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Text(
                    'Somewhat',
                    style: TextStyle(
                      fontFamily: 'ZiZhiQuXiMaiTi',
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      color: const Color.fromRGBO(32, 50, 80, 1.0),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ])),
          Transform.translate(
              // offset: Offset(55.0, 425.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.132,
                  MediaQuery.of(context).size.height * 0.459),
              child: Stack(children: <Widget>[
                ImageRadio(
                  images[0],
                  pressedImage[0],
                  controller: sController,
                  onChange: (value) => addToArrayS(5),
                  width: MediaQuery.of(context).size.width * 0.14,
                  height: MediaQuery.of(context).size.height * 0.064,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Text(
                    'Very much',
                    style: TextStyle(
                      fontFamily: 'ZiZhiQuXiMaiTi',
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      color: const Color.fromRGBO(32, 50, 80, 1.0),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ])),
          Transform.translate(
              // offset: Offset(123.0, 428.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.286,
                  MediaQuery.of(context).size.height * 0.463),
              child: ImageRadio(
                images[1],
                pressedImage[1],
                controller: sController,
                onChange: (value) => addToArrayS(4),
                width: MediaQuery.of(context).size.width * 0.125,
                height: MediaQuery.of(context).size.height * 0.057,
              )),
          Transform.translate(
              // offset: Offset(315.0, 610.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.732,
                  MediaQuery.of(context).size.height * 0.659),
              child: Stack(children: <Widget>[
                ImageRadio(
                  images[4],
                  pressedImage[4],
                  controller: hController,
                  onChange: (value) => addToArrayH(1),
                  width: MediaQuery.of(context).size.width * 0.14,
                  height: MediaQuery.of(context).size.height * 0.064,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Text(
                    'Very much',
                    style: TextStyle(
                      fontFamily: 'ZiZhiQuXiMaiTi',
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      color: const Color.fromRGBO(32, 50, 80, 1.0),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ])),
          Transform.translate(
              // offset: Offset(250.0, 610.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.586,
                  MediaQuery.of(context).size.height * 0.659),
              child: ImageRadio(
                images[3],
                pressedImage[3],
                controller: hController,
                onChange: (value) => addToArrayH(2),
                width: MediaQuery.of(context).size.width * 0.14,
                height: MediaQuery.of(context).size.height * 0.064,
              )),
          Transform.translate(
              // offset: Offset(185.0, 610.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.43,
                  MediaQuery.of(context).size.height * 0.659),
              child: Stack(children: <Widget>[
                ImageRadio(
                  images[2],
                  pressedImage[2],
                  controller: hController,
                  onChange: (value) => addToArrayH(3),
                  width: MediaQuery.of(context).size.width * 0.14,
                  height: MediaQuery.of(context).size.height * 0.064,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Text(
                    'Somewhat',
                    style: TextStyle(
                      fontFamily: 'ZiZhiQuXiMaiTi',
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      color: const Color.fromRGBO(32, 50, 80, 1.0),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ])),
          Transform.translate(
              // offset: Offset(55.0, 610.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.128,
                  MediaQuery.of(context).size.height * 0.659),
              child: Stack(children: <Widget>[
                ImageRadio(
                  images[0],
                  pressedImage[0],
                  controller: hController,
                  onChange: (value) => addToArrayH(5),
                  width: MediaQuery.of(context).size.width * 0.14,
                  height: MediaQuery.of(context).size.height * 0.064,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Text(
                    'Not at all',
                    style: TextStyle(
                      fontFamily: 'ZiZhiQuXiMaiTi',
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                      color: const Color.fromRGBO(32, 50, 80, 1.0),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ])),
          Transform.translate(
              // offset: Offset(123.0, 613.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.286,
                  MediaQuery.of(context).size.height * 0.662),
              child: ImageRadio(
                images[1],
                pressedImage[1],
                controller: hController,
                onChange: (value) => addToArrayH(4),
                width: MediaQuery.of(context).size.width * 0.125,
                height: MediaQuery.of(context).size.height * 0.057,
              )),
          Transform.translate(
            // offset: Offset(409.0, 195.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.96,
                MediaQuery.of(context).size.height * 0.21),
            child: Container(
              // width: 20.0,
              // height: 594.0,
              width: MediaQuery.of(context).size.width * 0.046,
              height: MediaQuery.of(context).size.height * 0.64,
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
        ],
      ),
    );
  }
}

class ImageRadio extends StatefulWidget {
  ImageRadio(@required this.imageUrl, @required this.imageUrl2,
      {this.isSeleted: false,
      this.controller,
      this.onChange,
      this.width: 60.0,
      this.height: 60.0});

  bool isSeleted;

  VoidCallback callMe;

  final String imageUrl;
  final String imageUrl2;

  final ImageRadioController controller;
  final ValueChanged<bool> onChange;
  final double width;
  final double height;

  @override
  _ImageRadioState createState() => _ImageRadioState();
}

class _ImageRadioState extends State<ImageRadio> {
  VoidCallback makeMeUnselect;

  @override
  void initState() {
    // init
    makeMeUnselect = () {
      setState(() {
        widget.isSeleted = false;
      });

      if (widget.onChange != null) {
        widget.onChange(false);
      }
    };

    // backup
    widget.callMe = makeMeUnselect;

    // add
    if (widget.controller != null) {
      // print("initState() add callback--->$makeMeUnselect");
      widget.controller.add(makeMeUnselect);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSeleted = true;
        });

        if (widget.onChange != null) {
          widget.onChange(true);
        }

        widget.controller.unselectOthers(makeMeUnselect);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: widget.isSeleted
                ? AssetImage(widget.imageUrl2)
                : AssetImage(widget.imageUrl),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class ImageRadioController {
  List<VoidCallback> _callbackList;

  ImageRadioController() {
    _callbackList = [];
  }

  void add(VoidCallback callback) {
    if (_callbackList == null) _callbackList = [];
    _callbackList.add(callback);
  }

  void remove(VoidCallback callback) {
    if (_callbackList != null) _callbackList.remove(callback);
  }

  void unselectOthers(VoidCallback currentCallback) {
    if (_callbackList != null && _callbackList.length > 0) {
      for (int i = 0, len = _callbackList.length; i < len; i++) {
        VoidCallback callback = _callbackList[i];

        if (callback == currentCallback) continue;

        callback();
      }
    }
  }
}
