import 'package:flutter/material.dart';
import './Correct6.dart';
import 'package:adobe_xd/page_link.dart';
import './Item7.dart';
import './Item5.dart';

class Wrong6 extends StatelessWidget {
  Wrong6({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
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
          Transform.translate(
            offset: Offset(41.0, 154.0),
            child: Container(
              width: 347.0,
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
            offset: Offset(0.0, 195.0),
            child: Container(
              width: 20.0,
              height: 594.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x5a000000),
                    offset: Offset(0, 3),
                    blurRadius: 40,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(37.9, 253.0),
            child: SizedBox(
              width: 354.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: 21,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text:
                          '   You turn the kettle on and wait\n for the water to boil.\n\nYou get a teabag out of the tin ,\nwhich you put into a mug, and \npourThe boiling water onto the\n teabag.\n\nNext, you add the …\n\n\n',
                    ),
                    TextSpan(
                      text: 'm _ _ k',
                      style: TextStyle(
                        fontSize: 55,
                        color: const Color(0xffff001d),
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(108.4, 630.0),
            child: SizedBox(
              width: 211.0,
              child: Text(
                'Good! You can try again.',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 17,
                  color: const Color(0xfff50634),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(182.0, 575.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.linear,
                  duration: 1.0,
                  pageBuilder: () => Correct6(),
                ),
              ],
              child: Container(
                width: 32.0,
                height: 28.0,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(230.0, 575.0),
            child: Container(
              width: 32.0,
              height: 28.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(41.0, 763.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushLeft,
                  ease: Curves.easeInOutExpo,
                  duration: 1.0,
                  pageBuilder: () => Item7(),
                ),
              ],
              child: Container(
                width: 347.0,
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
              child: Text(
                'Next',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 43,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(),
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
                  pageBuilder: () => Item5(),
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
          Transform.translate(
            offset: Offset(27.0, 97.0),
            child: SizedBox(
              width: 136.0,
              child: Text(
                'Session X',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 28,
                  color: const Color(0xfff7f7f7),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(140.0, 107.0),
            child:
                // Adobe XD layer: '截屏2021-03-02 19.23.…' (shape)
                Container(
              width: 131.0,
              height: 131.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/35%.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(273.3, 89.0),
            child: SizedBox(
              width: 108.0,
              child: Text(
                '6/18',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 39,
                  color: const Color(0xfff8eaea),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(365.0, 45.0),
            child:
                // Adobe XD layer: 'tingzhi' (shape)
                Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/stop.png'),
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
