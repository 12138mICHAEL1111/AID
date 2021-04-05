import 'package:flutter/material.dart';
import './Practicepage1.dart';
import 'package:adobe_xd/page_link.dart';


class IntroductionPage extends StatefulWidget {
  IntroductionPage({Key key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  next(){
    Navigator.pushNamed(context,'/practice1');
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
          ),
          Container(),
          Transform.translate(
            offset: Offset(40.0, 152.0),
            child: Container(
              width: 331.0,
              height: 243.0,
              decoration: BoxDecoration(
                color: const Color(0x01ffffff),
                border: Border.all(width: 1.0, color: const Color(0x01707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(31.4, 546.0),
            child: SizedBox(
              width: 365.0,
              child: Text(
                'Before starting our session, \nhere is a little practice, let’s start!',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(120.0, 649.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushLeft,
                  ease: Curves.easeOut,
                  duration: 1.0,
                  pageBuilder: () => Practicepage1(),
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
            offset: Offset(130.8, 654.0),
            child: SizedBox(
              width: 139.0,
              child: FlatButton(
              child: Text("Next",
                style: TextStyle(
                  color: Color.fromRGBO(252,181,111,1.0),
                  fontSize: 18
                ),
              ),
              color: Colors.white,
              onPressed: next,
            ),
            ),
          ),
          Transform.translate(
            offset: Offset(117.0, 209.0),
            child:
                Container(
              width: 195.0,
              height: 180.0,
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