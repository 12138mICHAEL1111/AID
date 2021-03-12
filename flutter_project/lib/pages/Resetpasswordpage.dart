import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Loginpage.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class Resetpasswordpage extends StatelessWidget {
class Resetpasswordpage extends StatefulWidget {
  Resetpasswordpage({
    Key key,
  }) : super(key: key);

  @override
  _ResetpasswordpageState createState() => _ResetpasswordpageState();
}

class _ResetpasswordpageState extends State<Resetpasswordpage> {
  String id;
  String email;
  String newPassword;
  String repeatNewPassword;

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  reset() async{
    if(!validateEmail(email)){
      Fluttertoast.showToast(
          msg: 'Please enter valid email',
          toastLength:Toast.LENGTH_SHORT,
          gravity:ToastGravity.CENTER
      );
    }
    else if(newPassword != repeatNewPassword){
      Fluttertoast.showToast(
        msg: 'Please enter same passowrd',
        toastLength:Toast.LENGTH_SHORT,
        gravity:ToastGravity.CENTER
      );
    }
    else{
      var api = 'http://192.168.3.50:3000/stop/api/rest/users/resetpassword';
      var response = await Dio().post(api,data:{"userid":this.id,"email":this.email,"password":this.newPassword});
      print(response.data);

      if(response.data["message"]=='success'){
        Navigator.of(context).pushReplacementNamed('/login');
      }
      else{
        print(response.data);
        Fluttertoast.showToast(
            msg: '${response.data["message"]}',
            toastLength:Toast.LENGTH_SHORT,
            gravity:ToastGravity.CENTER
        );
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
            offset: Offset(68.0, 136.0),
            child: Text(
              'Reset password',
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
            offset: Offset(49.0, 419.0),
            child: Text(
              'Your ID: ',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 30,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          //id textfield
          Transform.translate(
            offset: Offset(69.0, 463.0),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ID",
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
            offset: Offset(49.0, 517.0),
            child: Text(
              'Email:',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 30,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(69.0, 561.0),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
                onChanged: (value) {
                  this.email = value;
                },
              ),
              width: 276.0,
              height: 48.0,
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 713.0),
            child: Text(
              'Repeat password:',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 30,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          //Repeat password textfield
          Transform.translate(
            offset: Offset(69.0, 757.0),
            child: Container(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Repeat Password",
                ),
                onChanged: (value) {
                  this.repeatNewPassword = value;
                },
              ),
              width: 276.0,
              height: 48.0,
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 615.0),
            child: Text(
              'New password:',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: 30,
                color: const Color(0xfff8c16f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(69.0, 659.0),
            child: Container(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "New Password",
                ),
                onChanged: (value) {
                  this.newPassword = value;
                },
              ),
              width: 276.0,
              height: 48.0,
            ),
          ),
          //Reset button
          Transform.translate(
            offset: Offset(165.0, 835.0),
            child: RaisedButton(
              child: Text("Reset"),

              color: const Color(0xfffaaf7b),
              onPressed: reset,
            ),
          ),
          Container(),
          Transform.translate(
            offset: Offset(20.0, 42.0),
            child:
            // Adobe XD layer: 'jiantou' (shape)
            PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.PushDown,
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

const String _svg_ay0ahx =
    '<svg viewBox="76.0 463.0 276.0 48.0" ><path transform="translate(76.0, 463.0)" d="M 24 0 L 252 0 C 265.2548217773438 0 276 10.74516487121582 276 24 C 276 37.25483703613281 265.2548217773438 48 252 48 L 24 48 C 10.74516487121582 48 0 37.25483703613281 0 24 C 0 10.74516487121582 10.74516487121582 0 24 0 Z" fill="#f4f4f4" fill-opacity="0.95" stroke="#707070" stroke-width="1" stroke-opacity="0.95" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
