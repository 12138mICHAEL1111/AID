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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/background.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(16.0, 212.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.037,
                MediaQuery.of(context).size.height * 0.23),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.92,
              child: Text(
                'Now imagine the situation \nthat you have just read and \nwhat happened next…… for example…..',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.021,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            // offset: Offset(156.3, 775.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.36,
                MediaQuery.of(context).size.height * 0.837),
            child: FlatButton(
                color: Colors.transparent,
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: MediaQuery.of(context).size.height * 0.045,
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
                    if (!(_item == 18 && _session == 4)) {
                      _item = _item + 1;
                    }
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
            // offset: Offset(33.0, 329.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.076,
                MediaQuery.of(context).size.height * 0.355),
            child: Container(
              // width: 363.0,
              // height: 76.0,
              width: MediaQuery.of(context).size.width * 0.84,
              height: MediaQuery.of(context).size.height * 0.082,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(16.0, 324.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.0372,
                MediaQuery.of(context).size.height * 0.349),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                '${widget.situation}',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.021,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(73.0, 422.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.17,
                MediaQuery.of(context).size.height * 0.455),
            child:
                // Adobe XD layer: 'image here' (shape)
                Container(
              // width: 283.0,
              // height: 212.0,
                  width: MediaQuery.of(context).size.width * 0.658,
                  height: MediaQuery.of(context).size.height * 0.229,
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
