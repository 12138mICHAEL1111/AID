import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_project/config/Config.dart';
import 'package:flutter_project/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Homepage.dart';
import 'package:adobe_xd/page_link.dart';
import './User.dart';
import 'package:date_format/date_format.dart';

class ScheduleDatepage extends StatefulWidget {
  ScheduleDatepage({Key key}) : super(key: key);

  @override
  _SchedulaerDatePageState createState() => _SchedulaerDatePageState();
}

class _SchedulaerDatePageState extends State<ScheduleDatepage> {
  var size = 4;
  var _list;
  SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    _list = new List(size + 1);
    init();
    _list[0] = new DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    _list[1] = new DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    _list[2] = new DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    _list[3] = new DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    _list[4] = new DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    //init();
  }

  bool check() {
    for (int i = 4; i > 1; --i) {
      print(_list[i].toUtc().millisecondsSinceEpoch);
      print(_list[i - 1].toUtc().millisecondsSinceEpoch);
      if (_list[i].toUtc().millisecondsSinceEpoch <
          _list[i - 1].toUtc().millisecondsSinceEpoch) return false;
    }
    return true;
  }

  _showToast() {
    Fluttertoast.showToast(
        msg: "Please select in chronological order",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void init() async {
    pref = await SharedPreferences.getInstance();
    var api = '${Config.domain}/rest/users/uploadcategory';
    var response = await Dio().get(api);
    var sessionTime = response.data[0]["sessiontime"];
    print(sessionTime);
    if (sessionTime != null) {
      for (int i = 1; i <= size; ++i) {
        setState(() {
          _list[i] = DateTime.parse(sessionTime["session$i"]);
        });
      }
    }
  }

  uploadRemote() async {
    var api = '${Config.domain}/rest/users/uploadsessiontime';
    var id = pref.get("userid");

    await Dio().post(api, data: {
      "userid": id,
      "sessiontime": {
        "session1": formatDate(_list[1], [yyyy, '-', mm, '-', dd]),
        "session2": formatDate(_list[2], [yyyy, '-', mm, '-', dd]),
        "session3": formatDate(_list[3], [yyyy, '-', mm, '-', dd]),
        "session4": formatDate(_list[4], [yyyy, '-', mm, '-', dd])
      }
    });
  }

  _showDatePicker1(int i) async {
    var temp = await showDatePicker(
      context: context,
      initialDate: DateTime.now().isAfter(_list[i]) ? DateTime.now() : _list[i],
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xfffda873),
            accentColor: const Color(0xfffda873),
            colorScheme: ColorScheme.light(primary: const Color(0xfffda873)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );
    pref = await SharedPreferences.getInstance();
    setState(() {
      _list[i] = temp ?? _list[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // Adobe XD layer: 'Status Bars - iPhon???' (group)

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.21332,
                MediaQuery.of(context).size.height * 0.1864),
            child: SizedBox(
              width: 246.0,
              child: Text(
                'Scheduler',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.055,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.002,
                MediaQuery.of(context).size.height * 0.10237),
            child: SizedBox(
              width: 455.0,
              child: Text(
                'Now you need to arrange the time \n you want to complete for your four sessions',
                style: TextStyle(
                  fontFamily: 'ZiZhiQuXiMaiTi',
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          //white background for box
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.0958,
                MediaQuery.of(context).size.height * 0.302574),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80841,
              height: MediaQuery.of(context).size.height * 0.08998,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.0958,
                MediaQuery.of(context).size.height * 0.428998),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80841,
              height: MediaQuery.of(context).size.height * 0.08998,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.0958,
                MediaQuery.of(context).size.height * 0.555421),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80841,
              height: MediaQuery.of(context).size.height * 0.08998,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xfffca772)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.0958,
                MediaQuery.of(context).size.height * 0.681845),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80841,
              height: MediaQuery.of(context).size.height * 0.08998,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xffffffff),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.13318,
                MediaQuery.of(context).size.height * 0.326492),
            child: Text(
              'Session 1',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.031,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.13318,
                MediaQuery.of(context).size.height * 0.45519),
            child: Text(
              'Session 2',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.031,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.13318,
                MediaQuery.of(context).size.height * 0.70576),
            child: Text(
              'Session 4',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.031,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.13318,
                MediaQuery.of(context).size.height * 0.57934),
            child: Text(
              'Session 3',
              style: TextStyle(
                fontFamily: 'ZiZhiQuXiMaiTi',
                fontSize: MediaQuery.of(context).size.height * 0.031,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * 0.607477,
                  MediaQuery.of(context).size.height * 0.334465),
              child: InkWell(
                  key: Key("first"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${formatDate(_list[1], [yyyy, '-', mm, '-', dd])}",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: () {
                    _showDatePicker1(1);
                  })),
          Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * 0.607477,
                  MediaQuery.of(context).size.height * 0.46089),
              child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${formatDate(_list[2], [yyyy, '-', mm, '-', dd])}",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: () {
                    _showDatePicker1(2);
                  })),
          Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * 0.607477,
                  MediaQuery.of(context).size.height * 0.58731),
              child: InkWell(
                  key: Key("third"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${formatDate(_list[3], [yyyy, '-', mm, '-', dd])}",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: () {
                    _showDatePicker1(3);
                  })),
          Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * 0.607477,
                  MediaQuery.of(context).size.height * 0.713736),
              child: InkWell(
                  key: Key("4"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${formatDate(_list[4], [yyyy, '-', mm, '-', dd])}",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.021),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: () {
                    _showDatePicker1(4);
                  })),

          Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width * 0.3014,
                  MediaQuery.of(context).size.height * 0.81738),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.39953,
                  height: MediaQuery.of(context).size.height * 0.070615,
                  child: FlatButton(
                    onPressed: () {
                      if (!check()) {
                        _showToast();
                      } else {
                        uploadRemote();
                        Navigator.of(context).pushNamed('/over');
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    color: const Color(0xffffffff),
                    child: Center(
                        child: Text(
                      "Save",
                      style: TextStyle(
                        fontFamily: 'ZiZhiQuXiMaiTi',
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                        color: const Color(0xfffdb56f),
                      ),
                    )),
                  ))),

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
                // Adobe XD layer: '??????' (shape)
                Container(
              width: MediaQuery.of(context).size.width * 0.135514,
              height: MediaQuery.of(context).size.height * 0.06606,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/gray_profile.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.766355,
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
                      builder: (context) => User(),
                    ),
                  );
                },
              ),
            ),
          ),

          Transform.translate(
            offset: Offset(MediaQuery.of(context).size.width * 0.432243,
                MediaQuery.of(context).size.height * 0.93),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.135514,
              height: MediaQuery.of(context).size.height * 0.06606,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/calendar.png'),
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
