import 'package:flutter/material.dart';

class itemImaginePage extends StatelessWidget {
  itemImaginePage({
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
            width: 430.0,
            height: 926.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/background.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(16.0, 212.0),
            child: SizedBox(
              width: 396.0,
              child: Text(
                'Now imagine the situation \nthat you have just read and \nwhat happened next…… for example…..',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 19,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(22.6, 683.0),
            child: SizedBox(
              width: 383.0,
              child: Text(
                'Press’SPACE’when you are ready to imagine….',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 15,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(33.0, 329.0),
            child: Container(
              width: 363.0,
              height: 76.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(142.4, 354.0),
            child: SizedBox(
              width: 145.0,
              child: Text(
                'Question here',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 20,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(73.0, 422.0),
            child:
                // Adobe XD layer: 'image here' (shape)
                Container(
              width: 283.0,
              height: 212.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/image place.png'),
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
