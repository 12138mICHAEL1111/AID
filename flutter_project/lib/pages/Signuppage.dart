import 'dart:convert';
import '../config/Config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project/pages/Createdsuccessfullypage.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Loginpage.dart';

class Signuppage extends StatefulWidget {
  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  String password;
  String email;

  //check email is in valid format
  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  submit() async {
    if (password.length < 6) {
      Fluttertoast.showToast(
          msg: 'password cannot be less than 6 digits',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    } else if (!validateEmail(email) || email == null) {
      Fluttertoast.showToast(
          msg: 'Please enter vaild email',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    } else {
      var api = '${Config.domain}/rest/users/signup';
      var response = await Dio()
          .post(api, data: {"email": this.email, "password": this.password});
      if (response.data["message"] == 'success') {
        print(response.data);
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('userid', response.data['userid']);
        pref.setString(
            'controlitem', json.encode(response.data['controlitem']));
        Navigator.of(context).pushReplacementNamed('/createdSuccessfully');
      } else {
        Fluttertoast.showToast(
            msg: '${response.data["message"]}',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER);
      }
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
            // width: 428.0,
            // height: 419.0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
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
            // offset: Offset(26.0, 136.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.06,
                MediaQuery.of(context).size.height * 0.15),
            child: Text(
              'Create your account',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.width * 0.09,
                color: const Color(0xfff8f4f4),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            // offset: Offset(117.0, 208.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.272,
                MediaQuery.of(context).size.height * 0.22),
            child:
                // Adobe XD layer: 'WechatIMG1138?????????' (shape)
                Container(
              // width: 195.0,
              // height: 180.0,
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.19,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/logoOfMenu.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(49.0, 419.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.113,
                MediaQuery.of(context).size.height * 0.45),
            child: Text(
              'Email:',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.033,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          //Textfield for password
          Transform.translate(
            // offset: Offset(69.0, 463.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.16,
                MediaQuery.of(context).size.height * 0.50),
            child: Container(
              child: TextField(
                key: Key("EmailTextField"),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
                onChanged: (value) {
                  this.email = value;
                },
              ),
              width: MediaQuery.of(context).size.width * 0.64,
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ),
          Transform.translate(
            // offset: Offset(49.0, 517.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.113,
                MediaQuery.of(context).size.height * 0.56),
            child: Text(
              'Password:',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.033,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          //TextField for email
          Transform.translate(
              // offset: Offset(69.0, 561.0),
              offset: Offset(MediaQuery.of(context).size.width * 0.16,
                  MediaQuery.of(context).size.height * 0.61),
              child: Container(
                child: TextField(
                  key: Key("PasswordTextField"),
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                  onChanged: (value) {
                    this.password = value;
                  },
                ),
                width: MediaQuery.of(context).size.width * 0.64,
                height: MediaQuery.of(context).size.height * 0.05,
              )),
          Transform.translate(
            // offset: Offset(100.0, 718.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.232,
                MediaQuery.of(context).size.height * 0.765),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushLeft,
                  ease: Curves.easeOut,
                  duration: 1.0,
                  pageBuilder: () => Createdsuccessfullypage(),
                ),
              ],
              child: Container(
                // width: 197.0,
                // height: 56.0,
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.075,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.0),
                  color: const Color(0xfffaaf7b),
                ),
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(139.5, 723.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.324,
                MediaQuery.of(context).size.height * 0.775),
            child: SizedBox(
              // width: 119.0,
              width: MediaQuery.of(context).size.width * 0.277,
              child: FlatButton(
                key: Key("SignUpButton"),
                child: Text("Sign Up"),
                color: const Color(0xfffaaf7b),
                onPressed: submit,
              ),
            ),
          ),
          Container(),

          //goback button
          Transform.translate(
            // offset: Offset(20.0, 42.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.05,
                MediaQuery.of(context).size.height * 0.05),
            child:
                // Adobe XD layer: 'jiantou' (shape)
                PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushRight,
                  ease: Curves.easeIn,
                  duration: 1.0,
                  pageBuilder: () => Loginpage(),
                ),
              ],
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/goback.png'),
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
