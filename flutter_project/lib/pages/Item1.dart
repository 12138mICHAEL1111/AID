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

  uploadProgress() async {
    var api = '${Config.domain}/rest/users/uploadprogress';
    await Dio().post(api,
        data: {"id": _id, "session": _sessionNumber, "item": _itemNumber});
  }

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
      //control items
      if (_itemNumber != 0 && _itemNumber % 18 == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Moodtracker(
                    itemNumber: _itemNumber,
                    sessionNumber: _sessionNumber,
                  )),
        );
      } else {
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

  void chooseToDisplayWord() {
    if (_next == true) {
      displayWord();
    } else {
      displayBlank();
      countReadingTime();
    }
  }

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

  void updateQuestion() {
    _displayQuestion = Transform.translate(
      // offset: Offset(45.9, 253.0),
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

  void updateOption2() {
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

    _displayOption2_2 = Transform.translate(
      // offset: Offset(120.6, 531.0),
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

  void countQuestionRT() {
    if (_clickTimes == 1) {
      _optionClicked = DateTime.now();
      _questionRT1 = _optionClicked.difference(_startReading);
    } else if (_clickTimes == 2) {
      _questionRT2 = DateTime.now().difference(_optionClicked);
    }
  }

  void countWordRT() {
    if (_inputTimes == 1) {
      _wordRT1 = DateTime.now().difference(_wordDisplay);
    } else if (_inputTimes == 2) {
      _wordRT2 = DateTime.now().difference(_clueDisplay);
    }
  }

  void countReadingTime() {
    _wordDisplay = DateTime.now();
    _readingDuration = _wordDisplay.difference(_startReading);
  }

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

  bool compareData(String string1, String string2) {
    if (string1 == null || string2 == null) {
      return false;
    }
    return string1.toLowerCase() == string2.toLowerCase();
  }

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
              // offset: Offset(51, 513.0),
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
            // offset: Offset(282.0, 97.0),
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
            // offset: Offset(97.4, 628.0),
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
            // offset: Offset(41.0, 763.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.095,
                MediaQuery.of(context).size.height * 0.825),
            child: Container(
              // width: 347.0,
              // height: 67.0,
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
                _index++;
                if (_index < _context.length) {
                  setState(() {
                    displayText();
                    updateQuestion();
                  });
                } else if (_next == true) {
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
            // offset: Offset(140.0, 107.0),
            offset: Offset(MediaQuery.of(context).size.width * 0.325,
                MediaQuery.of(context).size.height * 0.115),
            child:
                // Adobe XD layer: '截屏2021-03-02 19.21.…' (shape)
                Container(
              // width: 139.0,
              // height: 131.0,
              width: MediaQuery.of(context).size.width * 0.32,
              height: MediaQuery.of(context).size.height * 0.14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(76.0),
                image: DecorationImage(
                  image: AssetImage('${_images[_itemNumber - 1]}'),
                  //const AssetImage('assets/images/6%.png'),
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

const String _svg_5e5um9 =
    '<svg viewBox="23.0 3.7 1.3 4.0" ><path transform="translate(23.0, 3.67)" d="M 0 0 L 0 4 C 0.8047311305999756 3.661223411560059 1.328037977218628 2.873133182525635 1.328037977218628 2 C 1.328037977218628 1.126866698265076 0.8047311305999756 0.3387765288352966 0 0" fill="#ffffff" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ya1094 =
    '<svg viewBox="368.5 17.3 15.3 11.0" ><path transform="translate(368.5, 17.33)" d="M 7.444817543029785 10.90732574462891 L 5.438717365264893 8.885025024414062 C 5.376617431640625 8.824725151062012 5.342417240142822 8.741024971008301 5.345117092132568 8.653725624084473 C 5.346917152404785 8.567325592041016 5.383817195892334 8.485424995422363 5.448617458343506 8.426925659179688 C 6.729317188262939 7.344225406646729 8.604917526245117 7.344225406646729 9.885617256164551 8.426925659179688 C 9.950417518615723 8.485424995422363 9.987317085266113 8.567325592041016 9.989117622375488 8.653725624084473 C 9.990917205810547 8.741024971008301 9.956717491149902 8.824725151062012 9.894617080688477 8.885025024414062 L 7.889417171478271 10.90732574462891 C 7.830917358398438 10.96672534942627 7.75081729888916 11.00002574920654 7.667117118835449 11.00002574920654 C 7.583417415618896 11.00002574920654 7.503317356109619 10.96672534942627 7.444817543029785 10.90732574462891 Z M 10.97461700439453 7.365825176239014 C 10.06831741333008 6.545925140380859 8.889317512512207 6.092325210571289 7.667117118835449 6.092325210571289 C 6.445817470550537 6.093225002288818 5.267717361450195 6.546825408935547 4.362317085266113 7.365825176239014 C 4.239917278289795 7.481925487518311 4.046417236328125 7.480125427246094 3.92761754989624 7.360425472259521 L 2.768417358398438 6.189525127410889 C 2.707217454910278 6.12832498550415 2.673017501831055 6.045525074005127 2.673917531967163 5.95912504196167 C 2.674817562103271 5.871825218200684 2.709917545318604 5.789925098419189 2.772917509078979 5.729625225067139 C 5.531417369842529 3.165525197982788 9.804617881774902 3.165525197982788 12.5640172958374 5.729625225067139 C 12.62611770629883 5.789925098419189 12.66211700439453 5.871825218200684 12.66301727294922 5.95912504196167 C 12.66391754150391 6.045525074005127 12.62971782684326 6.12832498550415 12.56851768493652 6.189525127410889 L 11.40931701660156 7.360425472259521 C 11.34854698181152 7.421195983886719 11.26901149749756 7.451574802398682 11.18938732147217 7.451567649841309 C 11.11217403411865 7.451561450958252 11.03487586975098 7.422982215881348 10.97461700439453 7.365825176239014 Z M 13.64401721954346 4.67032527923584 C 12.03121757507324 3.138525247573853 9.89191722869873 2.284425020217896 7.667117118835449 2.284425020217896 C 5.442317485809326 2.284425020217896 3.302117586135864 3.138525247573853 1.689317345619202 4.67032527923584 C 1.568717360496521 4.789124965667725 1.374317288398743 4.787325382232666 1.25461733341217 4.666725158691406 L 0.09361732751131058 3.496725082397461 C 0.03331732377409935 3.435525178909302 -0.0008826774428598583 3.353625059127808 1.73225998878479e-05 3.26722526550293 C 0.0009173226426355541 3.181725263595581 0.03511732444167137 3.099825143814087 0.09631732851266861 3.039525032043457 C 4.329017162322998 -1.013175010681152 11.00521755218506 -1.013175010681152 15.23701763153076 3.039525032043457 C 15.2982177734375 3.099825143814087 15.33241748809814 3.181725263595581 15.33331775665283 3.26722526550293 C 15.3342170715332 3.353625059127808 15.30001735687256 3.435525178909302 15.23971748352051 3.496725082397461 L 14.07871723175049 4.666725158691406 C 14.0181884765625 4.727709770202637 13.93880367279053 4.758315086364746 13.85938453674316 4.758310794830322 C 13.78174877166748 4.758306503295898 13.70407772064209 4.729050636291504 13.64401721954346 4.67032527923584 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_gbmjcf =
    '<svg viewBox="337.1 17.7 17.0 10.7" ><path transform="translate(337.11, 17.67)" d="M 15.00030040740967 10.6668004989624 C 14.44770050048828 10.6668004989624 14.00040054321289 10.21860027313232 14.00040054321289 9.666900634765625 L 14.00040054321289 0.9999000430107117 C 14.00040054321289 0.4473000168800354 14.44770050048828 0 15.00030040740967 0 L 16.00020027160645 0 C 16.55190086364746 0 17.00010108947754 0.4473000168800354 17.00010108947754 0.9999000430107117 L 17.00010108947754 9.666900634765625 C 17.00010108947754 10.21860027313232 16.55190086364746 10.6668004989624 16.00020027160645 10.6668004989624 L 15.00030040740967 10.6668004989624 Z M 10.33290004730225 10.6668004989624 C 9.781200408935547 10.6668004989624 9.333000183105469 10.21860027313232 9.333000183105469 9.666900634765625 L 9.333000183105469 3.333600044250488 C 9.333000183105469 2.781000137329102 9.781200408935547 2.333699941635132 10.33290004730225 2.333699941635132 L 11.33370018005371 2.333699941635132 C 11.88539981842041 2.333699941635132 12.33360004425049 2.781000137329102 12.33360004425049 3.333600044250488 L 12.33360004425049 9.666900634765625 C 12.33360004425049 10.21860027313232 11.88539981842041 10.6668004989624 11.33370018005371 10.6668004989624 L 10.33290004730225 10.6668004989624 Z M 5.666399955749512 10.6668004989624 C 5.114700317382812 10.6668004989624 4.666500091552734 10.21860027313232 4.666500091552734 9.666900634765625 L 4.666500091552734 5.666399955749512 C 4.666500091552734 5.114700317382812 5.114700317382812 4.666500091552734 5.666399955749512 4.666500091552734 L 6.666300296783447 4.666500091552734 C 7.218900203704834 4.666500091552734 7.667099952697754 5.114700317382812 7.667099952697754 5.666399955749512 L 7.667099952697754 9.666900634765625 C 7.667099952697754 10.21860027313232 7.218900203704834 10.6668004989624 6.666300296783447 10.6668004989624 L 5.666399955749512 10.6668004989624 Z M 0.9999000430107117 10.6668004989624 C 0.4473000168800354 10.6668004989624 0 10.21860027313232 0 9.666900634765625 L 0 7.667099952697754 C 0 7.114500045776367 0.4473000168800354 6.666300296783447 0.9999000430107117 6.666300296783447 L 1.999800086021423 6.666300296783447 C 2.5524001121521 6.666300296783447 2.99970006942749 7.114500045776367 2.99970006942749 7.667099952697754 L 2.99970006942749 9.666900634765625 C 2.99970006942749 10.21860027313232 2.5524001121521 10.6668004989624 1.999800086021423 10.6668004989624 L 0.9999000430107117 10.6668004989624 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
