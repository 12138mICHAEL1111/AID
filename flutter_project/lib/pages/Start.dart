import 'package:flutter/material.dart';
import './Loginpage.dart';
import 'package:adobe_xd/page_link.dart';

class Start extends StatelessWidget {
  Start({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-2.0, 0.0),
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
          Transform.translate(
            offset: Offset(96.0, 244.0),
            child:
                // Adobe XD layer: 'WechatIMG1138的副本' (shape)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Loginpage(),
                ),
              ],
              child: Container(
                width: 237.0,
                height: 219.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/logoOfStart.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(123.0, 495.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Loginpage(),
                ),
              ],
              child: Text(
                'A•I•D',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 50,
                  color: const Color(0xfff8f4f4),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(60.0, 579.0),
            child: Text(
              '(App for Intervening depression)',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
