import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_project/pages/Homepage.dart';
import '../config/Config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool compareString(String string1, String string2) {
    if (string1 == null || string2 == null) {
      return false;
    }
    return string1.toLowerCase() == string2.toLowerCase();
  }

  // Login to homepage if user has selected a category before and correct credential has been provided.
  // Else if no category selected, go and select categories.
  // Else if incorrect credential provided, show a prompt to inform user.
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

      if (compareString(response.data['category'], 'Not selected') == true) {
        Navigator.pushNamed(context, '/select');
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Homepage(
                    itemNumber: int.parse(pref.get('item')),
                    sessionNumber: int.parse(pref.get('session')),
                  )),
        );
      }
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
            offset: Offset(MediaQuery.of(context).size.width * 0.071,
                MediaQuery.of(context).size.height * 0.039),
            child: Text(
              '\nWelcome back to \n        A•I•D!',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.05,
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
                fontSize: MediaQuery.of(context).size.height * 0.04,
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
                key: Key("loginIDTextField"),
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
                fontSize: MediaQuery.of(context).size.height * 0.04,
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
                key: Key("LoginPasswordTextField"),
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
                  key: Key("SignUpButton"),
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
