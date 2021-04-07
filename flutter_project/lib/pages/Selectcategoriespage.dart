import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/config/Config.dart';
import 'package:flutter_screen_adapter/flutter_screen_adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Selectcategoriespage extends StatefulWidget {
  Selectcategoriespage({Key key}) : super(key: key);
  @override
  _SelectPageState createState() => _SelectPageState();
}


class _SelectPageState extends State<Selectcategoriespage> {
  //The list store all the option
  var _list = List<int>.filled(10, 0);
  var result;
  var map = {1: "minussocial", 2: "minusacademic", 3: "minushobbies", 
  4: "minusfamily", 5: "minusworks", 6: "minusrelationships", 7: "minusmood"};
  //user id
  ///////////////////////////////////////////////////////////////////////////////////

  //Called when pressed, update the list
  void tap(int i) {
    if (_list[i] == 0) {
      _list[i] = 1;
      print("$i + is added");
    } else {
      _list[i] = 0;
      print("$i + is removed");
    }
  }

  //Check if exactly 6 are selected
  String cate() {
    for(int i = 1; i < 8; ++i) {
      if(_list[i] == 0) {
        return map[i];
      }
    }
  }

  bool check() {
    int length = 0;
    for (int i = 0; i < _list.length; ++i) {
      if (_list[i] == 1) ++length;
    }
    if(length == 6) {
      return true;
    } else {
      return false;
    }
  }

  upload() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var api = '${Config.domain}/rest/users/uploadcategory';
    var id = pref.get("userid");
    var response = await Dio().post(api,data:{"userid": id, "category": cate()});
    if(response.data["message"]=='success'){
      print(response.data);
      pref.setString('category',cate());
      Navigator.of(context).pushNamed('/date');
    }
  }
  //construct options
  Widget cons(int i, String str) {
    return InkWell(
        onTap: () {
          setState(() {
            tap(i);
            check();
          });
        },
        child: Container(
          width: 145.0,
          height: 54.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: (_list[i] == 0 ? Color(0xffffffff) : Color(0xfffda873)),
          ),
          child: Center(
            child: Text(
              str,
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 24,
                color: (_list[i] == 1 ? Color(0xffffffff) : Color(0xfffda873)),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
  _showToast() {
    Fluttertoast.showToast(
        msg: "Please select 6 options",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
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
            // offset: Offset(31.0, 156.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.072,
                MediaQuery.of(context).size.height * 0.168),
            child: Text(
              'Congratulations!',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.051,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            // offset: Offset(14.9, 232.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.035,
                MediaQuery.of(context).size.height * 0.25),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.926,
              child: Text(
                'You have completed your practice run. \nYou can now choose 6 most relevant categories from all 7 categories below.',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.0225,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          //!!!!!!!!!!!!
          Transform.translate(
              // offset: Offset(41.0, 344.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.095,
                  MediaQuery.of(context).size.height * 0.37),
              child: cons(1, "Social")),
          Transform.translate(
              // offset: Offset(232.0, 344.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.54,
                  MediaQuery.of(context).size.height * 0.37),
              child: cons(2, "Academic")),
          Transform.translate(
              // offset: Offset(41.0, 417.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.095,
                  MediaQuery.of(context).size.height * 0.45),
              child: cons(3, "Hobbies")),
          Transform.translate(
              // offset: Offset(41.0, 492.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.095,
                  MediaQuery.of(context).size.height * 0.53),
              child: cons(4, "Family")),
          Transform.translate(
              // offset: Offset(232.0, 417.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.54,
                  MediaQuery.of(context).size.height * 0.45),
              child: cons(5, "Work")),
          Transform.translate(
              // offset: Offset(232.0, 492.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.54,
                  MediaQuery.of(context).size.height * 0.53),
              child: cons(6, "Relationships")),
          Transform.translate(
              // offset: Offset(136.5, 565.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.317,
                  MediaQuery.of(context).size.height * 0.61),
              child: cons(7, "Mood and Health")),

          
          Transform.translate(
            // offset: Offset(120.2, 644.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.28,
                MediaQuery.of(context).size.height * 0.7),
            child: Container(
              // width: 171.0,
              // height: 62.0,
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.07,
              child: FlatButton(
                onPressed: () {
                  if(check()) upload();
                  else _showToast();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                    color: Color(0xffffffff),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: 'ZiZhiQuXiMaiTi',
                      fontSize: MediaQuery.of(context).size.height * 0.027,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(20.0, 42.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.047,
                  MediaQuery.of(context).size.height * 0.045),
            child:
                // Adobe XD layer: 'jiantou' (shape)
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  // width: 50.0,
                  // height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.117,
                  height: MediaQuery.of(context).size.height * 0.054,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/goback.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )
            ),
        ],
      ),
    );
  }
}
