import 'package:flutter/material.dart';
import './Practicepage1.dart';
import 'package:adobe_xd/page_link.dart';

class IntroductionPage extends StatefulWidget {
  IntroductionPage({Key key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  next() {
    Navigator.pushNamed(context, '/practice1');
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
          ),
          Container(),
          Transform.translate(
            // offset: Offset(40.0, 152.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.09,
                MediaQuery.of(context).size.height * 0.16),
            child: Container(
              // width: 331.0,
              // height: 243.0,
              width: MediaQuery.of(context).size.width * 0.77,
              height: MediaQuery.of(context).size.height * 0.57,
              decoration: BoxDecoration(
                color: const Color(0x01ffffff),
                border: Border.all(width: 1.0, color: const Color(0x01707070)),
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(31.4, 546.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.073,
                MediaQuery.of(context).size.height * 0.59),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'Before starting our session, \nhere is a little practice, let’s start!',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.023,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(120.0, 649.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.28,
                MediaQuery.of(context).size.height * 0.7),
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
                // width: 171.0,
                // height: 62.0,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.066,
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
            // offset: Offset(130.8, 654.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.32,
                MediaQuery.of(context).size.height * 0.705),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.32,
              child: FlatButton(
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Color.fromRGBO(252, 181, 111, 1.0), fontSize: 18),
                ),
                color: Colors.white,
                onPressed: next,
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(117.0, 209.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.27,
                MediaQuery.of(context).size.height * 0.22),
            child: Container(
              // width: 195.0,
              // height: 180.0,
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.19,
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
