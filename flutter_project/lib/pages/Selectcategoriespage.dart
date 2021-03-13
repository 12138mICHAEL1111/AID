import 'package:flutter/material.dart';
import 'package:flutter_screen_adapter/flutter_screen_adapter.dart';
import './SchedulaerDatepage.dart';
import 'package:adobe_xd/page_link.dart';
import './Practicepage2.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Selectcategoriespage extends StatefulWidget {
  Selectcategoriespage({Key key}) : super(key: key);
  @override
  _SelectPageState createState() => _SelectPageState();
}


class _SelectPageState extends State<Selectcategoriespage> {
  //The list store all the option
  var _list = List<int>.filled(10, 0);
  var _check = false;
  //user id
  ///////////////////////////////////////////////////////////////////////////////////
  var _id = 24;
  var _id1 = 23;
  
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
  bool check() {
    int length = 0;
    for (int i = 0; i < _list.length; ++i) {
      if (_list[i] == 1) ++length;
    }
    if(length == 6) {
      _check = true;
      if(_id%2 == 1) {
        print(0);
      } else {
        for(int i = 1; i < 8; ++i) {
          if(_list[i] == 0) {
            //////////////////////////////////////////////////////////////////////////////////////////////////
            print("giao $i");
          }
        }
      }
    } else {
      _check =  false;
    }
    return _check;
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
  //used to get the question number
  int result() {
    if(_id%2 == 1) {
      return 0;
    } else {
      for(int i = 1; i < 8; ++i) {
        if(_list[i] == 0) {
          return i;
        }
      }
    }
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
            width: 428.0,
            height: 926.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/background.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(31.0, 156.0),
            child: Text(
              'Congratulations!',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 47,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(14.9, 232.0),
            child: SizedBox(
              width: 398.0,
              child: Text(
                'You have completed your practice run. \nYou can now choose 6 most relevant categories from all 7 categories below.',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 21,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          //!!!!!!!!!!!!
          Transform.translate(
              offset: Offset(41.0, 344.0), child: cons(1, "Social")),
          Transform.translate(
              offset: Offset(232.0, 344.0), child: cons(2, "Academic")),
          Transform.translate(
              offset: Offset(41.0, 417.0), child: cons(3, "Hobbies")),
          Transform.translate(
              offset: Offset(41.0, 492.0), child: cons(4, "Family")),
          Transform.translate(
              offset: Offset(232.0, 417.0), child: cons(5, "Work")),
          Transform.translate(
              offset: Offset(232.0, 492.0), child: cons(6, "Relationships")),
          Transform.translate(
              offset: Offset(136.5, 565.0), child: cons(7, "Mood and Health")),
          Transform.translate(
            offset: Offset(120.2, 644.0),
            child: InkWell(
              onTap: () {       
                check();
                print("tapped");
                if(check()) {
                  print(result());
                } else {
                  _showToast();
                } 
              },

              // child: PageLink(
              //   links: [
              //     check()
              //     ?PageLinkInfo(
              //       transition: LinkTransition.PushLeft,
              //       ease: Curves.easeOut,
              //       duration: 1.0,
              //       pageBuilder: () => SchedulaerDatepage(),
              //     )
              //     :null
              //   ],
                child: Container(
                  width: 171.0,
                  height: 62.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.0),
                    color: const Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 13),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: _check?PageLink(
                    links: [
                      PageLinkInfo(
                        transition: LinkTransition.PushLeft,
                        ease: Curves.easeOut,
                        duration: 1.0,
                        pageBuilder: () => SchedulaerDatepage(),
                      )
                    ],
                  )
                  :null
                ),
              ),
            ),

          // Transform.translate(
          //   offset: Offset(129.0, 644.0),
          //   child: PageLink(
          //     links: [
          //       PageLinkInfo(
          //         transition: LinkTransition.PushLeft,
          //         ease: Curves.easeOut,
          //         duration: 1.0,
          //         pageBuilder: () => SchedulaerDatepage(),
          //       ),
          //     ],
          //     child: Container(
          //       width: 171.0,
          //       height: 62.0,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(23.0),
          //         color: const Color(0xffffffff),
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
          Transform.translate(
            offset: Offset(150.2, 649.0),
            child: SizedBox(
              width: 111.0,
              child: Text(
                'Next',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 41,
                  color: const Color(0xfffdb56f),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
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
                    pageBuilder: () => Practicepage2(),
                  )
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
