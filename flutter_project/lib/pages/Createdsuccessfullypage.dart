import 'package:flutter/material.dart';
import 'package:flutter_project/pages/IntroductionPage.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Createdsuccessfullypage extends StatefulWidget {
  Createdsuccessfullypage({Key key}) : super(key: key);

  @override
  _CreatedsuccessfullypageState createState() =>
      _CreatedsuccessfullypageState();
}

class _CreatedsuccessfullypageState extends State<Createdsuccessfullypage> {
  String id = "";

  next() {
    Navigator.pushNamed(context, '/introductionpage');
  }

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString('userid'));
    setState(() {
      this.id = pref.getString('userid');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0, 0),
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
            // offset: Offset(73.0, 457.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.17,
                MediaQuery.of(context).size.height * 0.49),
            child: Container(
              // width: 292.0,
              // height: 72.0,
              width: MediaQuery.of(context).size.width * 0.68,
              height: MediaQuery.of(context).size.height * 0.078,
              decoration: BoxDecoration(
                color: const Color(0x00ffffff),
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(114.0, 191.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.27,
                MediaQuery.of(context).size.height * 0.21),
            child:
                // Adobe XD layer: '截屏2021-03-01 14.59.…' (shape)
                Container(
              // width: 200.0,
              // height: 200.0,
              width: MediaQuery.of(context).size.width * 0.47,
              height: MediaQuery.of(context).size.height * 0.22,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/successful.png'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x5a000000),
                    offset: Offset(0, 12),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(38.0, 463.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.09,
                MediaQuery.of(context).size.height * 0.5),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Text(
                'You have successful \ncreated your account!\nThis is your ID:\n',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.035,
                  color: const Color(0xfffdfaf5),
                  shadows: [
                    Shadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 12),
                      blurRadius: 6,
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(134.0, 649.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.31,
                MediaQuery.of(context).size.height * 0.69),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushLeft,
                  ease: Curves.easeOut,
                  duration: 1.0,
                  pageBuilder: () => IntroductionPage(),
                ),
              ],
              child: Container(
                // width: 171.0,
                // height: 62.0,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.068,
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
            // offset: Offset(141.8, 654.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.33,
                MediaQuery.of(context).size.height * 0.705),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.33,
              height: MediaQuery.of(context).size.height * 0.03,
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
          Container(),
          Transform.translate(
            // offset: Offset(100.0, 601.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.23,
                MediaQuery.of(context).size.height * 0.65),
            child: SizedBox(
              // width: 228.0,
              // height: 25.0,
              width: MediaQuery.of(context).size.width * 0.53,
              height: MediaQuery.of(context).size.height * 0.027,
              child: Text(
                this.id,
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.027,
                  color: const Color(0xff9d9d9d),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
