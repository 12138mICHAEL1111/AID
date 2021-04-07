import 'package:flutter/material.dart';
import './ItemImaginePage.dart';
import './Moodtracker.dart';
import '../config/Config.dart';
import 'package:dio/dio.dart';

class Item1 extends StatefulWidget {
  int itemNumber;
  int sessionNumber;

  Item1({this.itemNumber, this.sessionNumber}); // Start from 1 and 1
  @override
  _Item1State createState() => _Item1State(itemNumber, sessionNumber);
}

class _Item1State extends State<Item1> {
  var _answer;
  var _displayQuestion;
  var _displayOption2_1;
  var _displayOption2_2;
  var _next;
  var _feedback;
  var _items;
  var _id;
  var _category;
  var _question;
  var _questionNumber;
  var _context;
  var _blank;
  var _itemNumber;
  var _sessionNumber;
  var _situation;
  var _tempBlank;
  var _control;
  var _text;
  var _newText;
  var _index;
  var _hint;
  var _word;
  var _child;
  var _images = [
    "assets/images/6%.png",
    "assets/images/12%.png",
    "assets/images/17%.png",
    "assets/images/23%.png",
    "assets/images/29%.png",
    "assets/images/35%.png",
    "assets/images/41%.png",
    "assets/images/47%.png",
    "assets/images/50%.png",
    "assets/images/52%.png",
    "assets/images/63%.png",
    "assets/images/69%.png",
    "assets/images/74%.png",
    "assets/images/80%.png",
    "assets/images/85%.png",
    "assets/images/90%.png",
    "assets/images/95%.png",
    "assets/images/100%.png",
  ];

  // Time to start reading the first sentence.
  var _startReading;

  // Count how many time user gives input.
  var _inputTimes;

  // Count previous input's length.
  int _lastInputLength = 0;

  // Time to display blank word.
  var _wordDisplay;

  // Time in seconds measured from onset of first setence to click required to present the word.  (e.g. 3-30s)
  Duration _readingDuration;

  // Time in msec measured from onset of word display to entry click for first letter. (e.g. 100-15000)
  Duration _wordRT1;

  // Did user presse the correct letter? "1"=correct; "0"=incorrect.
  var _wordAccuracy1;

  // Did users have to make a second attempt at the word? "1"=yes; "0"=no.
  var _clueRequired;

  // Time to display feedback clue.
  DateTime _clueDisplay;

  // Did user press the correct letter? "1"=correct; "0"=incorrect. Missing if attempt 1 was correct .
  var _wordAccuracy2;

  // Time in msec measured from incorrect response click to second attempt click (e.g. 100-15000). Missing if attempt 1 was correct.
  Duration _wordRT2;

  // Count how many time user clicks option.
  var _clickTimes;

  // Time of fisrt clicking the option.
  DateTime _optionClicked;

  // Did users get the right answer? "1"=correct; "0"=incorrect.
  var _questionAccuracy1;

  // Time in msec measured from onset of question to first response (e.g. 100-15000).
  Duration _questionRT1;

  // Did users get the right answer? "1"=correct; "0"=incorrect. Missing if attempt 1 was correct.
  var _questionAccuracy2;

  // Time in msec measured from incorrect response click to second attempt click (e.g. 100-15000). Missing if attempt 1 was correct.
  Duration _questionRT2;

  _Item1State(this._itemNumber, this._sessionNumber);

  @override
  void initState() {
    super.initState();
    _answer = "";
    _next = false;
    _feedback = "";
    _items = [];
    _id = "";
    _control = false;
    _category = "";
    _question = "";
    _situation = "";
    _newText = "";
    _text = "";
    _word = "";
    _hint = "";
    _inputTimes = 0;
    _clickTimes = 0;
    _index = 0;
    _startReading = DateTime.now();
    if (_sessionNumber == null) {
      _sessionNumber = 1;
    }
    if (_itemNumber == null) {
      _itemNumber = 1;
    }
    _questionNumber = 1;
    getData();
  }

  // Send user response data to the database.
  sendData() async {
    var api = '${Config.domain}/rest/response/senddata';
    await Dio().post(api, data: {
      "userid": _id,
      "trailNumber": _itemNumber,
      "category": _category,
      "sessionNumber": _sessionNumber,
      "readingDuration": _readingDuration?.inSeconds.toString(),
      "wordRT1": _wordRT1.inMilliseconds.toString(),
      "wordAccuracy1": _wordAccuracy1,
      "clueRequired": _clueRequired,
      "wordRT2": _wordRT2?.inMilliseconds.toString(),
      "wordAccuracy2": _wordAccuracy2,
      "questionRT1": _questionRT1.inMilliseconds.toString(),
      "questionAccuracy1": _questionAccuracy1,
      "questionRT2": _questionRT2?.inMilliseconds.toString(),
      "questionAccuracy2": _questionAccuracy2
    });
  }

  // Upload user's progress (current session and item number) to the database.
  uploadProgress() async {
    var api = '${Config.domain}/rest/users/uploadprogress';
    await Dio().post(api,
        data: {"id": _id, "session": _sessionNumber, "item": _itemNumber});
  }

  // Get data from database.
  getData() async {
    var api = '${Config.domain}/rest/users/uploadcategory';
    var response = await Dio().get(api);
    var currentUser = response.data[0];
    _id = currentUser["userid"];

    var api2 = "";
    _control = currentUser["controlitem"];
    if (_control == false) {
      _category = currentUser["category"];
      api2 = '${Config.domain}/rest/$_category/session$_sessionNumber';
    } else {
      _category = 'control';
      api2 = '${Config.domain}/rest/controlitems/session$_sessionNumber';
    }
    var response2 = await Dio().get(api2);
    _items = response2.data;

    processData(_itemNumber - 1);
  }

  // Get different question according to the parameter passed in.
  void processData(int i) {
    _word = _items[i]["word"];
    _tempBlank = _items[i]["blank"];
    _situation = _items[i]["situation"];
    _feedback = "";
    _next = false;

    var _temp = _items[i]['context'];
    _context = _temp.split('. ');
    _context.removeWhere((value) => value == "");
    for (var i = 0; i < _context.length - 1; i++) {
      _context[i] = _context[i] + ". ";
    }
    changeState(i);
  }

  // Change state to display questions.
  void changeState(int i) {
    setState(() {
      if (_questionNumber == 1) {
        _question = _items[i]["question1"];
        _context.add(" " + _question);
        _answer = _items[i]["answer1"];
        _displayOption2_1 = null;
        _displayOption2_2 = null;
        displayText();
        updateQuestion();
      } else {
        _question = _items[i]["question2"];
        _answer = _items[i]["answer2"];
        _text = 'Now use the passage to answer the following question: \n\n\n';
        _newText = _question;
        _hint = "Choose an option";
        _child = null;
        updateQuestion();
        updateOption1();
        updateOption2();
      }
    });
    _startReading = DateTime.now();
  }

  // Toggle between 1st and 2nd question in a single item.
  void toggle() {
    if (_questionNumber == 1) {
      _questionNumber = 2;
      processData(_itemNumber - 1);
    } else {
      _questionNumber = 1;
      sendData();
      route();
    }
  }

  // Route according to whether current user has been given control items or training items.
  void route() {
    if (_control == false) {
      //training items have imagination page, control dont
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ItemImaginePage(
                  situation: _situation,
                  itemNumber: _itemNumber,
                  sessionNumber: _sessionNumber,
                )),
      );
    } else {
      if (_itemNumber != 0 && _itemNumber % 18 == 0) {
        // end of the session
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Moodtracker(
                    itemNumber: _itemNumber,
                    sessionNumber: _sessionNumber,
                  )),
        );
      } else {
        // next control question
        _itemNumber = _itemNumber + 1;
        uploadProgress();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Item1(
                    itemNumber: _itemNumber,
                    sessionNumber: _sessionNumber,
                  )),
        );
      }
    }
  }

  // Display question content one sentence at a time.
  void displayText() {
    if (_index == 0) {
      _newText = _context[0];
    } else {
      _text = _text + _newText;
      _newText = _context[_index];
      if (_index == _context.length - 1) {
        _blank = _tempBlank;
        _hint = 'Type in the first missing letter';
        chooseToDisplayWord();
      }
    }
  }

  // Display answer word if user's input is correct.
  // Else it's time to display blank word and counts user's reading time.
  void chooseToDisplayWord() {
    if (_next == true) {
      displayWord();
    } else {
      displayBlank();
      countReadingTime();
    }
  }

  // Set _child to display the correct word.
  void displayWord() {
    _child = Text.rich(
      TextSpan(
        style: TextStyle(
          fontFamily: 'ZiZhiQuXiMaiTi',
          fontSize: MediaQuery.of(context).size.height * 0.045,
          color: const Color(0xfffaae7c),
        ),
        text: _word,
      ),
      textAlign: TextAlign.center,
    );
  }

  // Set _child to display the blank word.
  void displayBlank() {
    _child = TextField(
      textAlign: TextAlign.center,
      key: Key("item1TextField"),
      decoration: InputDecoration(
          labelText: _blank,
          labelStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.042,
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 50),
          border: InputBorder.none),
      onChanged: (value) {
        // Increase one when user inputs letters instead of deleting.
        if (_lastInputLength <= value.length) {
          _inputTimes++;
        }
        validateData(value);
        countWordRT();
        recordAnswer();
        _lastInputLength = value.length;
        setState(() {
          chooseToDisplayWord();
        });
      },
      style: TextStyle(
        fontSize: 45,
        color: const Color(0xfffaae7c),
      ),
    );
  }

  // Set _displayQuestion to display content of the question.
  // Newly displayed text should be in bold.
  void updateQuestion() {
    _displayQuestion = Transform.translate(
      offset: Offset(MediaQuery.of(context).size.width * 0.106,
          MediaQuery.of(context).size.height * 0.27),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.744,
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'ZiZhiQuXiMaiTi',
              fontSize: MediaQuery.of(context).size.height * 0.023,
              color: const Color(0xff000000),
            ),
            children: [
              TextSpan(
                text: _text,
              ),
              TextSpan(
                text: _newText,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Set _displayOption2_1 to display the 'yes' option.
  // When 'yes' button got clicked, check wether user selected the correct answer.
  // And record the accuracy of the answer and time user spent on reading the quesion.
  void updateOption1() {
    _displayOption2_1 = Transform.translate(
      // offset: Offset(120.6, 458.0),
      offset: Offset(MediaQuery.of(context).size.width * 0.28,
          MediaQuery.of(context).size.height * 0.495),
      child: FlatButton(
          minWidth: 180.0,
          height: MediaQuery.of(context).size.height * 0.054,
          hoverColor: Color(0xfffaaf7b),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          color: Colors.grey[300],
          child: Text(
            'Yes',
            style: TextStyle(
              fontFamily: 'ZiZhiQuXiMaiTi',
              fontSize: MediaQuery.of(context).size.height * 0.023,
              color: const Color(0xff000000),
            ),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            _clickTimes++;
            _next = validateData("Yes");
            countQuestionRT();
            recordAnswer();
          }),
    );
  }

  // Set _displayOption2_2 to display the 'no' option.
  // When 'no' button got clicked, check wether user selected the correct answer.
  // And record the accuracy of the answer and time user spent on reading the quesion.
  void updateOption2() {
    _displayOption2_2 = Transform.translate(
      offset: Offset(MediaQuery.of(context).size.width * 0.28,
          MediaQuery.of(context).size.height * 0.57),
      child: FlatButton(
          minWidth: 180.0,
          height: MediaQuery.of(context).size.height * 0.054,
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
            _clickTimes++;
            _next = validateData("No");
            countQuestionRT();
            recordAnswer();
          }),
    );
  }

  // Count question reading time in question2.
  void countQuestionRT() {
    if (_clickTimes == 1) {
      _optionClicked = DateTime.now();
      _questionRT1 = _optionClicked.difference(_startReading);
    } else if (_clickTimes == 2) {
      _questionRT2 = DateTime.now().difference(_optionClicked);
    }
  }

  // Count blank word reading time in question1.
  void countWordRT() {
    if (_inputTimes == 1) {
      _wordRT1 = DateTime.now().difference(_wordDisplay);
    } else if (_inputTimes == 2) {
      _wordRT2 = DateTime.now().difference(_clueDisplay);
    }
  }

  // Count reading time in question1.
  void countReadingTime() {
    _wordDisplay = DateTime.now();
    _readingDuration = _wordDisplay.difference(_startReading);
  }

  // Record answer accurracy.
  void recordAnswer() {
    if (_questionNumber == 1) {
      // question1
      if (_inputTimes == 1) {
        // answered once
        if (_next == true) {
          _wordAccuracy1 = "1";
          _clueRequired = "0";
        } else {
          _wordAccuracy1 = "0";
          _clueRequired = "1";
        }
      } else if (_inputTimes == 2) {
        // answered twice
        if (_next == true) {
          _wordAccuracy2 = "1";
        } else {
          _wordAccuracy2 = "0";
        }
      }
    } else {
      // question2
      if (_clickTimes == 1) {
        if (_next == true) {
          _questionAccuracy1 = "1";
        } else {
          _questionAccuracy1 = "0";
        }
      } else if (_clickTimes == 2) {
        if (_next == true) {
          _questionAccuracy2 = "1";
        } else {
          _questionAccuracy2 = "0";
        }
      }
    }
  }

  // Compare string1 with string2.
  bool compareData(String string1, String string2) {
    if (string1 == null || string2 == null) {
      return false;
    }
    return string1.toLowerCase() == string2.toLowerCase();
  }

  // Validate user's input with the correct answer.
  bool validateData(value) {
    if (compareData(_answer, value)) {
      setState(() {
        _feedback = '✔ Great, this is a good answer!';
      });
      return _next = true;
    } else {
      setState(() {
        _feedback = 'x Good. But what would be a different answer?';
      });
      if (_wordAccuracy1 == "0" && _questionNumber == 1) {
        _clueDisplay = DateTime.now();
      }
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
            // offset: Offset(41.0, 154.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.095,
                MediaQuery.of(context).size.height * 0.166),
            child: Container(
              // width: 347.0,
              // height: 676.0,
              width: MediaQuery.of(context).size.width * 0.81,
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
              // width: 20.0,
              // height: 594.0,
              width: MediaQuery.of(context).size.width * 0.047,
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
            offset: Offset(MediaQuery.of(context).size.width * 0.951,
                MediaQuery.of(context).size.height * 0.21),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.047,
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
            // offset: Offset(27.0, 97.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.063,
                MediaQuery.of(context).size.height * 0.104),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.316,
              child: Text(
                'Session ${_sessionNumber}',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.030,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Container(
            child: _displayQuestion,
          ),

          Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * 0.118,
                  MediaQuery.of(context).size.height * 0.55),
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.77, //use the white background width
                child: _child,
              )),

          Container(
            child: _displayOption2_1,
          ),

          Container(
            child: _displayOption2_2,
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.655,
                MediaQuery.of(context).size.height * 0.104),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                '${_itemNumber}/18',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.030,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.226,
                MediaQuery.of(context).size.height * 0.68),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.54,
              child: Text(
                _hint,
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.0165,
                  color: const Color(0xffb9b9b9),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.095,
                MediaQuery.of(context).size.height * 0.825),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.81,
              height: MediaQuery.of(context).size.height * 0.071,
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
                MediaQuery.of(context).size.height * 0.825),
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
                _index++;  // how many times this button got pressed
                if (_index < _context.length) {  // still need to diplay question content
                  setState(() {
                    displayText();
                    updateQuestion();
                  });
                } else if (_next == true) {  // time to change a question
                  toggle();
                }
              },
            ),
          ),

          Transform.translate(
            // offset: Offset(108.4, 685.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.25,
                MediaQuery.of(context).size.height * 0.74),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.49,
              child: Text(
                "$_feedback",
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: 21,
                  color: const Color(0xfff0660e),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.325,
                MediaQuery.of(context).size.height * 0.115),
            child:
                Container(
              width: MediaQuery.of(context).size.width * 0.32,
              height: MediaQuery.of(context).size.height * 0.14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(76.0),
                image: DecorationImage(
                  image: AssetImage('${_images[_itemNumber - 1]}'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
