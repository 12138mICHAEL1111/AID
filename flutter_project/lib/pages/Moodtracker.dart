import 'package:flutter/material.dart';
import './Item1.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter/rendering.dart';

class Moodtracker extends StatefulWidget {
  @override
  _MoodtrackerState createState() => _MoodtrackerState();
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

  ImageRadioController aController;
  ImageRadioController hController;
  ImageRadioController sController;

  @override
  void initState() {
    aController = new ImageRadioController();
    hController = new ImageRadioController();
    sController = new ImageRadioController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-1.0, 0.0),
            child:
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
          ),
          Transform.translate(
            offset: Offset(34.0, 155.0),
            child: Container(
              width: 362.0,
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
            offset: Offset(25.0, 100.0),
            child: Text(
              'How do you feel today？',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 33,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(34.0, 764.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushLeft,
                  ease: Curves.easeInOutExpo,
                  duration: 1.0,
                  pageBuilder: () => Item1(),
                ),
              ],
              child: Container(
                width: 362.0,
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
          ),
          Transform.translate(
              offset: Offset(156.3, 775.0),
              child: SizedBox(
                  width: 116.0,
                  child: OutlineButton(
                    borderSide: BorderSide.none,
                    onPressed: () {
                      Navigator.pushNamed(context, '/session');
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontFamily: 'ZiZhiQuXiMaiTi',
                        fontSize: 38,
                        color: const Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))),
          Transform.translate(
            offset: Offset(149.5, 185.0),
            child: SizedBox(
              width: 130.0,
              child: Text(
                'Anxious',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 30,
                  color: const Color.fromRGBO(32, 50, 80, 1.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(149.5, 370.0),
            child: SizedBox(
              width: 130.0,
              child: Text(
                'Happy',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 30,
                  color: const Color.fromRGBO(32, 50, 80, 1.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(149.5, 555.0),
            child: SizedBox(
              width: 130.0,
              child: Text(
                'Sad',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 30,
                  color: const Color.fromRGBO(32, 50, 80, 1.0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(315.0, 240.0),
              child: ImageRadio(
                images[4],
                pressedImage[4],
                controller: aController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(250.0, 240.0),
              child: ImageRadio(
                images[3],
                pressedImage[3],
                controller: aController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(185.0, 240.0),
              child: ImageRadio(
                images[2],
                pressedImage[2],
                controller: aController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(55.0, 240.0),
              child: ImageRadio(
                images[0],
                pressedImage[0],
                controller: aController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(123.0, 243.0),
              child: ImageRadio(
                images[1],
                pressedImage[1],
                controller: aController,
                height: 54.0,
                width: 53.7,
              )),
          Transform.translate(
              offset: Offset(315.0, 425.0),
              child: ImageRadio(
                images[4],
                pressedImage[4],
                controller: hController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(250.0, 425.0),
              child: ImageRadio(
                images[3],
                pressedImage[3],
                controller: hController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(185.0, 425.0),
              child: ImageRadio(
                images[2],
                pressedImage[2],
                controller: hController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(55.0, 425.0),
              child: ImageRadio(
                images[0],
                pressedImage[0],
                controller: hController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(123.0, 428.0),
              child: ImageRadio(
                images[1],
                pressedImage[1],
                controller: hController,
                height: 54.0,
                width: 53.7,
              )),
          Transform.translate(
              offset: Offset(315.0, 610.0),
              child: ImageRadio(
                images[4],
                pressedImage[4],
                controller: sController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(250.0, 610.0),
              child: ImageRadio(
                images[3],
                pressedImage[3],
                controller: sController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(185.0, 610.0),
              child: ImageRadio(
                images[2],
                pressedImage[2],
                controller: sController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(55.0, 610.0),
              child: ImageRadio(
                images[0],
                pressedImage[0],
                controller: sController,
                height: 60.0,
                width: 60.0,
              )),
          Transform.translate(
              offset: Offset(123.0, 613.0),
              child: ImageRadio(
                images[1],
                pressedImage[1],
                controller: sController,
                height: 54.0,
                width: 53.7,
              )),
          Transform.translate(
            offset: Offset(42.0, 310.0),
            child: Text(
              '  Very much                Somewhat                 Not at all',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 15,
                color: const Color.fromRGBO(32, 50, 80, 1.0),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 495.0),
            child: Text(
              '  Very much                Somewhat                 Not at all',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 15,
                color: const Color.fromRGBO(32, 50, 80, 1.0),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(42.0, 680.0),
            child: Text(
              '  Very much                Somewhat                 Not at all',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 15,
                color: const Color.fromRGBO(32, 50, 80, 1.0),
              ),
              textAlign: TextAlign.left,
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