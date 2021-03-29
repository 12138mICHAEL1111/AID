import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/config/Config.dart';
import 'package:flutter_project/pages/Item1.dart';
import 'package:flutter_project/pages/Moodtracker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemImaginePage extends StatefulWidget {
  String situation;
  int itemNumber;
  int sessionNumber;
  ItemImaginePage({this.situation, this.itemNumber, this.sessionNumber});

  @override
  _ImagineState createState() => _ImagineState();
}

class _ImagineState extends State<ItemImaginePage> {
  String _id;
  var _session;
  var _item;

  @override
  void initState() {
    super.initState();
    _getid();
  }

  _getid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _id = pref.getString('userid');
  }

  _uploadProgress() async {
    // store current progress in the db
    var api = '${Config.domain}/rest/users/uploadprogress';
    await Dio()
        .post(api, data: {"id": _id, "session": _session, "item": _item});
  }

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
                  _session = widget.sessionNumber;
                  _item = widget.itemNumber;

                  if (_item != 0 && _item % 18 == 0) {
                    //session finished
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Moodtracker(
                                itemNumber: _item,
                                sessionNumber: _session,
                              )),
                    );
                  } else {
                    _item = _item + 1;
                    _uploadProgress();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Item1(
                                itemNumber: _item,
                                sessionNumber: _session,
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
