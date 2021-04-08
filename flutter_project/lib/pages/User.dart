import 'package:flutter/material.dart';
import './Homepage.dart';
import '../config/Config.dart';
import 'package:dio/dio.dart';
import 'package:adobe_xd/page_link.dart';
import './ScheduleDatepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends StatefulWidget {
  User({Key key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  String id;
  String email;
  SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    getUserIdAndEmail();
    init();
  }

  init() async {
    pref = await SharedPreferences.getInstance();
  }

  getUserIdAndEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var api = '${Config.domain}/rest/users/getemail';
    String usid = pref.getString('userid');
    var response = await Dio().post(api, data: {"userid": usid});
    print("---");
    print(response.data);
    setState(() {
      this.id = usid;
      this.email = response.data["email"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
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
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.20794,
                MediaQuery.of(context).size.height * 0.12073),
            child: SizedBox(
              width: 250.0,
              child: Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.08,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.03271,
                MediaQuery.of(context).size.height * 0.24829),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.93458,
              height: MediaQuery.of(context).size.height * 0.08998,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.03271,
                MediaQuery.of(context).size.height * 0.384966),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.93458,
              height: MediaQuery.of(context).size.height * 0.08998,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.03271,
                MediaQuery.of(context).size.height * 0.52164),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.93458,
              height: MediaQuery.of(context).size.height * 0.08998,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.067757,
                MediaQuery.of(context).size.height * 0.26879),
            child: Text(
              'Account ID',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.04,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.752336,
                MediaQuery.of(context).size.height * 0.2779),
            child: Text(
              this.id ?? "",
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.022,
                color: const Color(0xff888888),
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.067757,
                MediaQuery.of(context).size.height * 0.405467),
            child: Text(
              'Email',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.04,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.47664,
                MediaQuery.of(context).size.height * 0.41458),
            child: Text(
              this.email ?? "",
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.022,
                color: const Color(0xff888888),
              ),
              textAlign: TextAlign.right,
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.067757,
                MediaQuery.of(context).size.height * 0.54214),
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.04,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.63084,
                MediaQuery.of(context).size.height * 0.56036),
            child: Text(
              '********',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.022,
                color: const Color(0xff888888),
              ),
              textAlign: TextAlign.left,
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.88785,
                MediaQuery.of(context).size.height * 0.55467),
            child:
                // Adobe XD layer: 'write' (shape)
                Container(
              width: MediaQuery.of(context).size.width * 0.05374,
              height: MediaQuery.of(context).size.height * 0.02392,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/change.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.8528,
                MediaQuery.of(context).size.height * 0.53189,
                MediaQuery.of(context).size.width * 0.02336,
                MediaQuery.of(context).size.height * 0.05695),
            child: FlatButton(
              minWidth: 50,
              height: MediaQuery.of(context).size.height * 0.0672,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                '''''',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 26,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/reset',
                    arguments: {"isFromUser": true});
              },
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, MediaQuery.of(context).size.height * 0.91647),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1082,
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
            offset: Offset(MediaQuery.of(context).size.width * 0.09813,
                MediaQuery.of(context).size.height * 0.93),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.135514,
              height: MediaQuery.of(context).size.height * 0.06606,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/gray_home.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.09813,
                MediaQuery.of(context).size.height * 0.93),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.135514,
              height: MediaQuery.of(context).size.height * 0.06606,
              child: OutlineButton(
                borderSide: BorderSide.none,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/homepage",
                  );
                },
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.766355,
                MediaQuery.of(context).size.height * 0.93),
            child:
                // Adobe XD layer: '用户' (shape)
                Container(
              width: MediaQuery.of(context).size.width * 0.135514,
              height: MediaQuery.of(context).size.height * 0.06606,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/profile.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.432243,
                MediaQuery.of(context).size.height * 0.93),
            // child:
            //     // Adobe XD layer: '日历' (shape)
            //     PageLink(
            //   links: [
            //     PageLinkInfo(
            //       transition: LinkTransition.PushRight,
            //       ease: Curves.easeOut,
            //       duration: 1.0,
            //       pageBuilder: () => ScheduleDatepage(),
            //     ),
            //   ],
            child: Container(
              width: MediaQuery.of(context).size.width * 0.135514,
              height: MediaQuery.of(context).size.height * 0.06606,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/gray_calendar.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.432243,
                MediaQuery.of(context).size.height * 0.93),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.135514,
              height: MediaQuery.of(context).size.height * 0.06606,
              child: OutlineButton(
                borderSide: BorderSide.none,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScheduleDatepage(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
