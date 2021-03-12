import 'package:flutter/material.dart';
import './Resetpasswordpage.dart';
import 'package:adobe_xd/page_link.dart';
import './Homepage.dart';
import './Signuppage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Loginpage extends StatelessWidget {
  Loginpage({
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
            offset: Offset(49.0, 55.0),
            child: Text(
              '\nWelcome back to \n        Traveling!',
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
            offset: Offset(49.0, 444.0),
            child: Text(
              'Account ID: ',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 30,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(76.0, 502.0),
            child: SvgPicture.string(
              _svg_1kkn3b,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(49.0, 570.0),
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
            offset: Offset(76.0, 628.0),
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
            offset: Offset(152.0, 696.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushUp,
                  ease: Curves.easeOut,
                  duration: 1.0,
                  pageBuilder: () => Resetpasswordpage(),
                ),
              ],
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 15,
                  color: const Color(0xffc7c7c7),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(109.0, 763.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushDown,
                  ease: Curves.slowMiddle,
                  duration: 1.0,
                  pageBuilder: () => Homepage(),
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
            offset: Offset(67.7, 772.0),
            child: SizedBox(
              width: 183.0,
              child: Text(
                '           Log In',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 30,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(109.0, 837.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushLeft,
                  ease: Curves.easeOut,
                  duration: 1.0,
                  pageBuilder: () => Signuppage(),
                ),
              ],
              child: Container(
                width: 197.0,
                height: 47.0,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border:
                      Border.all(width: 1.0, color: const Color(0xfffca772)),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(9.7, 854.0),
            child: SizedBox(
              width: 271.0,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: 15,
                    color: const Color(0xfffea672),
                  ),
                  children: [
                    TextSpan(
                      text:
                          '                                 Need an account?\n',
                    ),
                    TextSpan(
                      text: '\n',
                      style: TextStyle(
                        color: const Color(0xffffffff),
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
          Container(),
        ],
      ),
    );
  }
}

const String _svg_1kkn3b =
    '<svg viewBox="76.0 502.0 276.0 48.0" ><path transform="translate(76.0, 502.0)" d="M 24 0 L 252 0 C 265.2548217773438 0 276 10.74516487121582 276 24 C 276 37.25483703613281 265.2548217773438 48 252 48 L 24 48 C 10.74516487121582 48 0 37.25483703613281 0 24 C 0 10.74516487121582 10.74516487121582 0 24 0 Z" fill="#f4f4f4" fill-opacity="0.95" stroke="#707070" stroke-width="1" stroke-opacity="0.95" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
