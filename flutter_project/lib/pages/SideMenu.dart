import 'package:flutter/material.dart';
import './Loginpage.dart';
import 'package:adobe_xd/page_link.dart';
import './Homepage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  SideMenu({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(26.0, 62.0),
            child:
                // Adobe XD layer: 'caidan' (shape)
                Container(
              width: 49.0,
              height: 49.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/menu.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // Adobe XD layer: '007 Sunny Morning' (shape)
          PageLink(
            links: [
              PageLinkInfo(
                transition: LinkTransition.PushRight,
                ease: Curves.easeInOutExpo,
                duration: 1.0,
                pageBuilder: () => Loginpage(),
              ),
            ],
            child: Container(
              width: 252.0,
              height: 926.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/background2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(10.0, 42.0),
            child:
                // Adobe XD layer: 'WechatIMG1138的副本' (shape)
                Container(
              width: 156.0,
              height: 144.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/logoOfStart.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(186.0, 29.0),
            child:
                // Adobe XD layer: 'error' (shape)
                PageLink(
              // links: [
              //   PageLinkInfo(
              //     transition: LinkTransition.Fade,
              //     ease: Curves.easeOut,
              //     duration: 0.3,
              //     pageBuilder: () => Homepage(1),
              //   ),
              // ],
              child: Container(
                width: 51.0,
                height: 51.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(18.4, 290.0),
            child: SizedBox(
              width: 145.0,
              child: Text(
                'About XXXXX',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 21,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(18.1, 379.0),
            child: SizedBox(
              width: 152.0,
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 21,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(12.4, 468.0),
            child: SizedBox(
              width: 211.0,
              child: Text(
                'Terms & Conditions',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 21,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(20.8, 557.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.SlideRight,
                  ease: Curves.easeInOut,
                  duration: 1.0,
                  pageBuilder: () => Loginpage(),
                ),
              ],
              child: SizedBox(
                width: 83.0,
                child: Text(
                  'Log out',
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: 21,
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(25.0, 347.5),
            child: SvgPicture.string(
              _svg_45kut8,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_45kut8 =
    '<svg viewBox="25.0 347.5 189.0 179.0" ><path transform="translate(25.0, 347.5)" d="M 0 1 L 189 0" fill="none" stroke="#ffffff" stroke-width="10" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(25.0, 436.5)" d="M 0 1 L 189 0" fill="none" stroke="#ffffff" stroke-width="10" stroke-miterlimit="4" stroke-linecap="round" /><path transform="translate(25.0, 525.5)" d="M 0 1 L 189 0" fill="none" stroke="#ffffff" stroke-width="10" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
