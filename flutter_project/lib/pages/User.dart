import 'package:flutter/material.dart';
import './Homepage.dart';
import 'package:adobe_xd/page_link.dart';
import './Calendar.dart';

class User extends StatelessWidget {
  User({
    Key key,
  }) : super(key: key);
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
            offset: Offset(89.0, 106.0),
            child: SizedBox(
              width: 250.0,
              child: Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 68,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 218.0),
            child: Container(
              width: 400.0,
              height: 79.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 338.0),
            child: Container(
              width: 400.0,
              height: 79.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(14.0, 458.0),
            child: Container(
              width: 400.0,
              height: 79.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(29.0, 236.0),
            child: Text(
              'Acount ID',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 34,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(311.0, 244.0),
            child: Text(
              'XXXXXX',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 21,
                color: const Color(0xff888888),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(29.0, 356.0),
            child: Text(
              'Email',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 34,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(189.0, 364.0),
            child: Text(
              'XXXXXX@xxx.com',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 21,
                color: const Color(0xff888888),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(380.0, 367.0),
            child:
                // Adobe XD layer: 'write' (shape)
                Container(
              width: 23.0,
              height: 21.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/change.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(29.0, 476.0),
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 34,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(270.0, 492.0),
            child: Text(
              '********',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 21,
                color: const Color(0xff888888),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(380.0, 487.0),
            child:
                // Adobe XD layer: 'write' (shape)
                Container(
              width: 23.0,
              height: 21.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/change.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 831.0),
            child: Container(
              width: 428.0,
              height: 95.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0),
                ),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(42.0, 849.0),
            child:
                // Adobe XD layer: '主页' (shape)
                PageLink(
              // links: [
              //   PageLinkInfo(
              //     transition: LinkTransition.PushRight,
              //     ease: Curves.slowMiddle,
              //     duration: 1.0,
              //     pageBuilder: () => Homepage(1),
              //   ),
              // ],
              child: Container(
                width: 58.0,
                height: 58.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/home.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(328.0, 849.0),
            child:
                // Adobe XD layer: '用户' (shape)
                Container(
              width: 58.0,
              height: 58.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/profile.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(185.0, 850.0),
            child:
                // Adobe XD layer: '日历' (shape)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushRight,
                  ease: Curves.easeOut,
                  duration: 1.0,
                  pageBuilder: () => Calendar(),
                ),
              ],
              child: Container(
                width: 58.0,
                height: 58.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/calendar.png'),
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
