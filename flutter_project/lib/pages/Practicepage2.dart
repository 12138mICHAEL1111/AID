import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/Config.dart';

class Practicepage2 extends StatefulWidget {
  @override
  _Practicepage2State createState() => _Practicepage2State();
}

class _Practicepage2State extends State<Practicepage2> {
  var _answer;
  var _next;
  var _feedback;
  var _pressed;

  @override
  void initState() {
    super.initState();
    _answer = "";
    _next = false;
    _feedback = "";
    _pressed = false;
    _getData();
  }

  _getData() async {
    var api = '${Config.domain}/rest/practiseitems';
    var response = await Dio().get(api);
    _answer = response.data[0]['answer2'];
  }

  bool _validateData(value) {
    if (_answer == value) {
      setState(() {
        _feedback = '✔ Great, this is a good answer!';
      });
      return _next = true;
    } else {
      setState(() {
        _feedback = 'x What would be a different answer?';
      });
      return _next = false;
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
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/background2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.09,
                MediaQuery.of(context).size.height * 0.1655914),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.807,
              height: MediaQuery.of(context).size.height * 0.73,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(0.0, MediaQuery.of(context).size.height * 0.21),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.046,
              height: MediaQuery.of(context).size.height * 0.64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x5a000000),
                    offset: Offset(0, 3),
                    blurRadius: 40,
                  ),
                ],
              ),
            ),
          ),
        
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.12,
                MediaQuery.of(context).size.height * 0.088),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.26,
              child: Text(
                'Practice ',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.027,
                  color: const Color(0xfff7f7f7),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.12,
                MediaQuery.of(context).size.height * 0.122),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.18,
              child: Text(
                'Items',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.027,
                  color: const Color(0xfff7f7f7),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.33,
                MediaQuery.of(context).size.height * 0.121),
            child:
                // Adobe XD layer: '截屏2021-03-01 16.20.…' (shape)
                Container(
              width: MediaQuery.of(context).size.width * 0.344,
              height: MediaQuery.of(context).size.height * 0.145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/100%.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.66,
                MediaQuery.of(context).size.height * 0.096),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.195,
              child: Text(
                '2/2',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.043,
                  color: const Color(0xfff8eaea),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(82.8, 258.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.19,
                MediaQuery.of(context).size.height * 0.27),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.62,
              child: Text(
                'The second question：\n\n\nHave you made yourself \na cup of coffee?',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.024,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          
          Transform.translate(
            // offset: Offset(120.6, 458.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.28,
                MediaQuery.of(context).size.height * 0.49),
            child: FlatButton(
                minWidth: 180.0,
                height: MediaQuery.of(context).size.height * 0.052,
                hoverColor: Color(0xfffaaf7b),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                color: Colors.grey[300],
                child: Text(
                  'Yes',
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                    color: const Color(0xff000000),
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  _validateData("Yes");
                }),
          ),

          Transform.translate(
            // offset: Offset(120.6, 531.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.28,
                MediaQuery.of(context).size.height * 0.57),
            child: FlatButton(
                minWidth: 180.0,
                height: MediaQuery.of(context).size.height * 0.052,
                hoverColor: Color(0xfffaaf7b),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                color: Colors.grey[300],
                child: Text(
                  'No',
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                    color: const Color(0xff000000),
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  _validateData("No");
                }),
          ),

          Transform.translate(
            // offset: Offset(123.8, 596.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.28,
                MediaQuery.of(context).size.height * 0.64),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.42,
              child: Text(
                'Choose an option',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.016,
                  color: const Color(0xffb9b9b9),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            // offset: Offset(108.4, 685.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.25,
                MediaQuery.of(context).size.height * 0.73),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.49,
              child: Text(
                "${_feedback}",
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.0225,
                  color: const Color(0xfff0660e),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            // offset: Offset(41.0, 763.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.09,
                MediaQuery.of(context).size.height * 0.826),
            child: Container(
              // width: 347.0,
              // height: 67.0,
              width: MediaQuery.of(context).size.width * 0.807,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0),
                  colors: [
                    const Color(0xfff0660e),
                    const Color(0xfff4b77e),
                    const Color(0xffffffff),
                    const Color(0xfffaaf7b)
                  ],
                  stops: [0.0, 0.0, 0.0, 1.0],
                ),
              ),
            ),
          ),
          Transform.translate(
            // offset: Offset(156.3, 775.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.36,
                MediaQuery.of(context).size.height * 0.83),
            child: FlatButton(
              color: Colors.transparent,
              child: Text(
                'Next',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.045,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                if (_next == true) {
                  Navigator.pushNamed(context, '/select');
                } else if (_pressed == false) {
                  setState(() {
                    _feedback = '↺ Please select an option.';
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
