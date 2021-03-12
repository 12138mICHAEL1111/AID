import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    login() async {
        var api = 'http://192.168.50.16:3000/stop/api/rest/users/login';
        var response = await Dio().post(
            api, data: {"userid": this.id, "password": this.password});
        if (response.data["message"] == 'success') {
          SharedPreferences pref = await SharedPreferences.getInstance();
          print(response.data);
          pref.setString('userid', response.data['userid']);
          pref.setString('controlitem', json.encode(response.data['controlitem']));
          //Navigator.of(context).pushReplacementNamed('/login');
        }
        else {
          Fluttertoast.showToast(
              msg: '${response.data["message"]}',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER
          );
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
                width: 428.0,
                height: 419.0,
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
                offset: Offset(49.0, 55.0),
                child: Text(
                  '\nWelcome back to \n        Traveling!',
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: 40,
                    color: const Color(0xfff8f4f4),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(117.0, 208.0),
                child:
                // Adobe XD layer: 'WechatIMG1138的副本' (shape)
                Container(
                  width: 195.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/logoOfMenu.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(49.0, 444.0),
                child: Text(
                  'Account ID: ',
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: 30,
                    color: const Color(0xfff8c16f),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(69.0, 502.0),
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
                  width: 276.0,
                  height: 48.0,
                ),
              ),
              Transform.translate(
                offset: Offset(49.0, 570.0),
                child: Text(
                  'Password:',
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: 30,
                    color: const Color(0xfff8c16f),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(69.0, 628.0),
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
                  width: 276.0,
                  height: 48.0,
                ),
              ),

              //Login button
              Transform.translate(
                  offset: Offset(130.0, 710.0),
                  child: SizedBox(
                    width: 160,
                    height: 40,
                    child: RaisedButton(
                      child: Text("Login"),

                      color: const Color(0xfffaaf7b),
                      onPressed: login,
                    ),
                  )
              ),
              //Reset password button
              Transform.translate(
                  offset: Offset(130.0, 760.0),
                  child: SizedBox(
                    width: 160,
                    height: 40,
                    child: RaisedButton(
                      child: Text("Reset Password"),

                      color: const Color(0xfffaaf7b),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/reset');
                      },
                    ),
                  )
              ),
              Transform.translate(
                  offset: Offset(130.0, 810.0),
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
                  )
              ),
              Container(),
            ],
          ),
        );
      }
    }
const String _svg_1kkn3b =
    '<svg viewBox="76.0 502.0 276.0 48.0" ><path transform="translate(76.0, 502.0)" d="M 24 0 L 252 0 C 265.2548217773438 0 276 10.74516487121582 276 24 C 276 37.25483703613281 265.2548217773438 48 252 48 L 24 48 C 10.74516487121582 48 0 37.25483703613281 0 24 C 0 10.74516487121582 10.74516487121582 0 24 0 Z" fill="#f4f4f4" fill-opacity="0.95" stroke="#707070" stroke-width="1" stroke-opacity="0.95" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
