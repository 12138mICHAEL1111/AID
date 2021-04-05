import 'dart:convert';

import 'package:flutter_project/pages/Homepage.dart';

import '../config/Config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

//class Loginpage extends StatelessWidget {
class Loginpage extends StatefulWidget {
  Loginpage({
    Key key,
  }) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String id;
  String password;
  var _itemNumber;
  var _sessionNumber;

  @override
  void initState() {
    super.initState();
  }

  login() async {
    var api = '${Config.domain}/rest/users/login';
    var response = await Dio()
        .post(api, data: {"userid": this.id, "password": this.password});
    print(response.data);
    if (response.data["message"] == 'success') {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('userid', response.data['userid']);
      pref.setString('controlitem', json.encode(response.data['controlitem']));
      pref.setString('item', json.encode(response.data['currentitem']));
      pref.setString('session', json.encode(response.data['currentsession']));

      print("login successfully");

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Homepage(
                  itemNumber: int.parse(pref.get('item')),
                  sessionNumber: int.parse(pref.get('session')),
                )),
      );
    } else {
      Fluttertoast.showToast(
          msg: '${response.data["message"]}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: '007 Sunny Morning' (shape)
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4572,
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
            offset: Offset(MediaQuery.of(context).size.width * 0.142,
                MediaQuery.of(context).size.height * 0.039),
            child: Text(
              '\nWelcome back to \n        A•I•D!',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.0888,
                color: const Color(0xfff8f4f4),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.2734,
                MediaQuery.of(context).size.height * 0.2369),
            child:
                // Adobe XD layer: 'WechatIMG1138的副本' (shape)
                Container(
              width: MediaQuery.of(context).size.width * 0.4556,
              height: MediaQuery.of(context).size.height * 0.205,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/logoOfMenu.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.1145,
                MediaQuery.of(context).size.height * 0.5057),
            child: Text(
              'Account ID: ',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.092,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.1612,
                MediaQuery.of(context).size.height * 0.57175),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Account ID",
                ),
                onChanged: (value) {
                  this.id = value;
                },
              ),
              width: MediaQuery.of(context).size.width * 0.64486,
              height: MediaQuery.of(context).size.height * 0.05467,
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.1145,
                MediaQuery.of(context).size.height * 0.6492),
            child: Text(
              'Password:',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.092,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.1612,
                MediaQuery.of(context).size.height * 0.71526),
            child: Container(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                onChanged: (value) {
                  this.password = value;
                },
              ),
              width: MediaQuery.of(context).size.width * 0.64486,
              height: MediaQuery.of(context).size.height * 0.05467,
            ),
          ),

          //Login button
          Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * 0.3037,
                  MediaQuery.of(context).size.height * 0.80866),
              child: SizedBox(
                width: 160,
                height: 40,
                child: RaisedButton(
                  child: Text("Login"),
                  color: const Color(0xfffaaf7b),
                  onPressed: login,
                ),
              )),
          //Reset password button
          Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * 0.3037,
                  MediaQuery.of(context).size.height * 0.8656),
              child: SizedBox(
                width: 160,
                height: 40,
                child: RaisedButton(
                  child: Text("Reset Password"),
                  color: const Color(0xfffaaf7b),
                  onPressed: () {
                    Navigator.pushNamed(context, '/reset',
                        arguments: {"isFromUser": false});
                  },
                ),
              )),
          Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * 0.3037,
                  MediaQuery.of(context).size.height * 0.92255),
              child: SizedBox(
                width: 160,
                height: 40,
                child: RaisedButton(
                  child: Text("Sign Up"),
                  color: const Color(0xfffaaf7b),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/signup');
                  },
                ),
              )),
          Container(),
        ],
      ),
    );
  }
}

const String _svg_1kkn3b =
    '<svg viewBox="76.0 502.0 276.0 48.0" ><path transform="translate(76.0, 502.0)" d="M 24 0 L 252 0 C 265.2548217773438 0 276 10.74516487121582 276 24 C 276 37.25483703613281 265.2548217773438 48 252 48 L 24 48 C 10.74516487121582 48 0 37.25483703613281 0 24 C 0 10.74516487121582 10.74516487121582 0 24 0 Z" fill="#f4f4f4" fill-opacity="0.95" stroke="#707070" stroke-width="1" stroke-opacity="0.95" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
