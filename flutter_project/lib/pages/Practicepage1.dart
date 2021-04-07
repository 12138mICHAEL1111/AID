import 'package:flutter/material.dart';
import '../config/Config.dart';
import 'package:dio/dio.dart';

class Practicepage1 extends StatefulWidget {
  @override
  _Practicepage1State createState() => _Practicepage1State();
}

class _Practicepage1State extends State<Practicepage1> {
  var _answer;
  var _question;
  var _next;
  var _feedback;
  var _context;
  var _text;
  var _newText;
  var _blank;
  var _tempBlank;
  var _index;
  var _hint;
  var _word;
  var _child;

  @override
  void initState() {
    super.initState();
    _answer = "";
    _next = false;
    _feedback = "";
    _context = [];
    _text = "";
    _question = "";
    _blank = "";
    _tempBlank = "";
    _newText = "";
    _index = 0;
    _hint = "";
    _word = "";
    getData();
  }

  // Get question information.
  getData() async {
    var api = '${Config.domain}/rest/practiseitems';
    var response = await Dio().get(api);
    _answer = response.data[0]['answer1'];
    _question = response.data[0]['question1'];
    _tempBlank = response.data[0]['blank'];
    var _temp = response.data[0]['context'];
    _context = _temp.split('.');
    _context.removeWhere((value) => value == "");
    for (var i = 0; i < _context.length; i++) {
      _context[i] = _context[i] + ".";
    }
    _context.add(_question);
    displayText();
  }

  // Compare whether s1 is identicial with s2.
  bool _compareData(String string1, String string2) {
    if (string1 == null || string2 == null) {
      return false;
    }
    return string1.toLowerCase() == string2.toLowerCase();
  }

  // Validate user input with correct answer.
  bool validateData(value) {
    if (_compareData(_answer, value)) {
      setState(() {
        _word = "milk";
        _feedback = '✔ Great, this is a good answer!';
      });
      return _next = true;
    } else {
      setState(() {
        _feedback = 'x Good. But what would be a different answer?';
      });
      return _next = false;
    }
  }

  // Display question text one sentence at a time.
  void displayText() {
    if (_index == 0) {
      setState(() {
        _newText = _context[0];
      });
    } else {
      setState(() {
        _text = _text + _newText;
        _newText = _context[_index];
        if (_index == _context.length - 1) {
          _blank = _tempBlank;
          _hint = 'Type in the first missing letter';
          displayWord();
        }
      });
    }
  }

  // Display the whole word if user input the correct letter, else display the blank.
  void displayWord() {
    setState(() {
      if (_next == true) {
        _child = Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'ZiZhiQuXiMaiTi',
              fontSize: 43,
              color: const Color(0xfffaae7c),
            ),
            text: _word,
          ),
          textAlign: TextAlign.center,
        );
      } else {
        _child = TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              labelText: _blank,
              labelStyle: TextStyle(
                fontSize: 40,
              ),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 50),
              border: InputBorder.none),
          onChanged: (value) {
            validateData(value);
            displayWord();
          },
          style: TextStyle(
            fontSize: 45,
            color: const Color(0xfffaae7c),
          ),
        );
      }
    });
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
            offset: Offset(MediaQuery.of(context).size.width * 0.95,
                MediaQuery.of(context).size.height * 0.21),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.046,
              height: MediaQuery.of(context).size.height * 0.64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(40, 3),
                    blurRadius: 6,
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
                MediaQuery.of(context).size.height * 0.115),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.344,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/50%.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.089,
                MediaQuery.of(context).size.height * 0.27),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.82,
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'ZiZhiQuXiMaiTi',
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    TextSpan(text: _text),
                    TextSpan(
                      text: _newText,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * 0.118,
                  MediaQuery.of(context).size.height * 0.55),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.77,
                child: _child,
              )),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.66,
                MediaQuery.of(context).size.height * 0.096),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.195,
              child: Text(
                '1/2',
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
            offset: Offset(MediaQuery.of(context).size.width * 0.25,
                MediaQuery.of(context).size.height * 0.74),
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
            offset: Offset(MediaQuery.of(context).size.width * 0.226,
                MediaQuery.of(context).size.height * 0.675),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.541,
              child: Text(
                _hint,
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.0161,
                  color: const Color(0xffb9b9b9),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.09,
                MediaQuery.of(context).size.height * 0.826),
            child: Container(
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
            offset: Offset(MediaQuery.of(context).size.width * 0.36,
                MediaQuery.of(context).size.height * 0.83),
            child: FlatButton(
              color: Colors.transparent,
              child: Text(
                'Next',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.049,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                _index++;
                if (_index < _context.length) {
                  displayText();
                }
                if (_next == true) {
                  Navigator.pushNamed(context, '/practice2');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
