import 'package:flutter/material.dart';
import './SchedulaerDatepage.dart';
import 'package:adobe_xd/page_link.dart';
import './Practicepage2.dart';

class Selectcategoriespage extends StatefulWidget {
  Selectcategoriespage({Key key}) : super(key: key);
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<Selectcategoriespage> {
  //The list store all the option
  var _list = List<int>.filled(10,0);

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
    return _list.length == 6;
  }

  //construct options
  Widget cons(int i, String str) {
    return InkWell(
        onTap: () {
          setState(() {
            tap(i);
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
                color:
                    (_list[i] == 1 ? Color(0xffffffff) : Color(0xfffda873)),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ));
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
                'You have completed your exercises, \nyou can choose 6 of the 7 categories \nbelow you like now.',
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
            offset: Offset(41.0, 344.0),
            child: cons(1, "Social")
          ),
          Transform.translate(
            offset: Offset(232.0, 344.0),
            child: cons(2, "Academic")
          ),
          Transform.translate(
            offset: Offset(41.0, 417.0),
            child: cons(3, "Hobbies")
          ),
          Transform.translate(
            offset: Offset(41.0, 492.0),
            child: cons(4, "Family")
          ),
          Transform.translate(
            offset: Offset(232.0, 417.0),
            child: cons(5, "Work")
          ),
          Transform.translate(
            offset: Offset(222.0, 492.0),
            child: cons(6, "Relationships")
          ),
          Transform.translate(
            offset: Offset(106.0, 565.0),
            child: cons(7, "Mood and Health")
          ),
          // Transform.translate(
          //   offset: Offset(75.0, 356.0),
          //   child: SizedBox(
          //     width: 78.0,
          //     child: Text(
          //       'Social',
          //       style: TextStyle(
          //         fontFamily: 'ZiZhiQuXiMaiTi',
          //         fontSize: 24,
          //         color: const Color(0xfffda873),
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
          // Transform.translate(
          //   offset: Offset(244.0, 356.0),
          //   child: SizedBox(
          //     width: 122.0,
          //     child: Text(
          //       'Academic',
          //       style: TextStyle(
          //         fontFamily: 'ZiZhiQuXiMaiTi',
          //         fontSize: 24,
          //         color: const Color(0xfffca772),
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
          // Transform.translate(
          //   offset: Offset(63.0, 427.0),
          //   child: SizedBox(
          //     width: 102.0,
          //     child: Text(
          //       'Hobbies',
          //       style: TextStyle(
          //         fontFamily: 'ZiZhiQuXiMaiTi',
          //         fontSize: 24,
          //         color: const Color(0xfffda672),
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
          // Transform.translate(
          //   offset: Offset(262.0, 427.0),
          //   child: SizedBox(
          //     width: 86.0,
          //     child: Text(
          //       'Family',
          //       style: TextStyle(
          //         fontFamily: 'ZiZhiQuXiMaiTi',
          //         fontSize: 24,
          //         color: const Color(0xfffca772),
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
          // Transform.translate(
          //   offset: Offset(72.0, 504.0),
          //   child: SizedBox(
          //     width: 74.0,
          //     child: Text(
          //       'Work',
          //       style: TextStyle(
          //         fontFamily: 'ZiZhiQuXiMaiTi',
          //         fontSize: 24,
          //         color: const Color(0xfffca772),
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
          // Transform.translate(
          //   offset: Offset(221.4, 504.0),
          //   child: SizedBox(
          //     width: 167.0,
          //     child: Text(
          //       'Relationships',
          //       style: TextStyle(
          //         fontFamily: 'ZiZhiQuXiMaiTi',
          //         fontSize: 24,
          //         color: const Color(0xfffda873),
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
          // Transform.translate(
          //   offset: Offset(104.5, 577.0),
          //   child: SizedBox(
          //     width: 209.0,
          //     child: Text(
          //       'Mood and Health',
          //       style: TextStyle(
          //         fontFamily: 'ZiZhiQuXiMaiTi',
          //         fontSize: 24,
          //         color: const Color(0xfffda873),
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
          Transform.translate(
            offset: Offset(129.0, 644.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushLeft,
                  ease: Curves.easeOut,
                  duration: 1.0,
                  pageBuilder: () => SchedulaerDatepage(),
                ),
              ],
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
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(158.8, 649.0),
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
