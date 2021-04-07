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
          Transform.translate(
            // offset: Offset(96.0, 244.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.223,
                MediaQuery.of(context).size.height * 0.263),
            child:
                // Adobe XD layer: 'WechatIMG1138的副本' (shape)
                PageLink(
              key: Key("imageToTap"),
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => Loginpage(),
                ),
              ],
              child: Container(
                // width: 237.0,
                // height: 219.0,
                width: MediaQuery.of(context).size.width * 0.55,
                height: MediaQuery.of(context).size.height * 0.2365,
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
            // offset: Offset(123.0, 495.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.286,
                MediaQuery.of(context).size.height * 0.534),
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
                  fontSize: MediaQuery.of(context).size.height * 0.0534,
                  color: const Color(0xfff8f4f4),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(60.0, 579.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.1395,
                MediaQuery.of(context).size.height * 0.6252),
            child: Text(
              '(App for Intervening Depression)',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.022,
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
