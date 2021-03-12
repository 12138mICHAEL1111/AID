import 'package:flutter/material.dart';
import './Createdsuccessfullypage.dart';
import 'package:adobe_xd/page_link.dart';
import './Loginpage.dart';

class Signuppage extends StatelessWidget {
  Signuppage({
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
            height: 419.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60.0),
                bottomLeft: Radius.circular(60.0),
              ),
              image: DecorationImage(
                image: const AssetImage('assets/images/background2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(26.0, 136.0),
            child: Text(
              'Create your account',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 40,
                color: const Color(0xfff8f4f4),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(117.0, 208.0),
            child:
                // Adobe XD layer: 'WechatIMG1138的副本' (shape)
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
          Transform.translate(
            offset: Offset(49.0, 419.0),
            child: Text(
              'Password:',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 30,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(76.0, 463.0),
            child: Container(
              width: 276.0,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xf2f4f4f4),
                border: Border.all(width: 1.0, color: const Color(0xf2707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(49.0, 517.0),
            child: Text(
              'Email:',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 30,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(69.0, 561.0),
            child: Container(
              width: 276.0,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xf2f4f4f4),
                border: Border.all(width: 1.0, color: const Color(0xf2707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(100.0, 818.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushLeft,
                  ease: Curves.easeOut,
                  duration: 1.0,
                  pageBuilder: () => Createdsuccessfullypage(),
                ),
              ],
              child: Container(
                width: 197.0,
                height: 56.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.0),
                  color: const Color(0xfffaaf7b),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(139.5, 827.0),
            child: SizedBox(
              width: 119.0,
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 30,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(49.0, 517.0),
            child: Text(
              'Email:',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 30,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(113.0, 623.0),
            child: Text(
              '<Purpose of collecting email> ',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 13,
                color: const Color(0xffc9c9c9),
              ),
              textAlign: TextAlign.left,
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
                  pageBuilder: () => Loginpage(),
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
