import 'package:flutter/material.dart';
import 'package:flutter_project/pages/Item1.dart';
import 'package:flutter_project/pages/Moodtracker.dart';
import 'package:flutter_project/pages/SessionFinishedpage.dart';

class itemImaginePage extends StatefulWidget {
  String situation;
  int itemNumber;
  int sessionNumber;
  itemImaginePage({this.situation, this.itemNumber, this.sessionNumber});

  @override
  _ImagineState createState() => _ImagineState();
}

class _ImagineState extends State<itemImaginePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'WechatIMG1201' (shape)
          Container(
            width: 430.0,
            height: 926.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/background.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 212.0),
            child: SizedBox(
              width: 396.0,
              child: Text(
                'Now imagine the situation \nthat you have just read and \nwhat happened next…… for example…..',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 19,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
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
                  var number =  widget.itemNumber;
                  // if (widget.itemNumber == 17) {
                  //   number = 0;
                  // } else {
                  //   number = widget.itemNumber;
                  // }
                  var number1 = widget.sessionNumber;

                  if (number != 0 && number % 18 == 0) {  //session finished
                    print("here2");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Moodtracker(
                                itemNumber: number,
                                sessionNumber: number1,
                              )),
                    );
                  } else {
                    print("here");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Item1(
                                itemNumber: number + 1,
                                sessionNumber: number1,
                              )),
                    );
                  }
                }),
          ),
          Transform.translate(
            offset: Offset(33.0, 329.0),
            child: Container(
              width: 363.0,
              height: 76.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 324.0),
            child: SizedBox(
              width: 383.0,
              child: Text(
                '${widget.situation}',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 20,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(73.0, 422.0),
            child:
                // Adobe XD layer: 'image here' (shape)
                Container(
              width: 283.0,
              height: 212.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/image place.png'),
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
