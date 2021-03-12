import 'package:flutter/material.dart';
import 'package:flutter_project/pages/IntroductionPage.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Createdsuccessfullypage extends StatefulWidget {
  Createdsuccessfullypage({Key key}) : super(key: key);

  @override
  _CreatedsuccessfullypageState createState() => _CreatedsuccessfullypageState();
}

class _CreatedsuccessfullypageState extends State<Createdsuccessfullypage> {
  String id="";
  next(){
    Navigator.pushNamed(context,'/introductionpage');
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
    return  Scaffold(
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
            offset: Offset(73.0, 457.0),
            child: Container(
              width: 292.0,
              height: 72.0,
              decoration: BoxDecoration(
                color: const Color(0x00ffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(114.0, 191.0),
            child:
                // Adobe XD layer: '截屏2021-03-01 14.59.…' (shape)
                Container(
              width: 200.0,
              height: 200.0,
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
            offset: Offset(38.0, 463.0),
            child: SizedBox(
              width: 352.0,
              child: Text(
                'You have successful \ncreated your account!\nThis is your ID:\n',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 31,
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
            offset: Offset(134.0, 649.0),
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
                width: 171.0,
                height: 62.0,
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
            offset: Offset(141.8, 654.0),
            child: SizedBox(
              width: 140.0,
              child: FlatButton(
              child: Text("Next",
                style: TextStyle(
                  color: Color.fromRGBO(252,181,111,1.0),
                  fontSize: 18
                ),
              ),
              color: Colors.white,
              onPressed: next,
            ),
            ),
          ),
         
          Container(),
          Transform.translate(
            offset: Offset(100.0, 601.0),
            child: SizedBox(
              width: 228.0,
              height: 25.0,
              child: Text(
                this.id,
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 25,
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
