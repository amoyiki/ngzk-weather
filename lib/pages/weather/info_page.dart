import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ngzk_weather/common/utils/screen.dart';
import 'package:ngzk_weather/routes/routes.gr.dart';

class WeatherInfoPage extends StatefulWidget {
  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfoPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(1080, 1920),
      allowFontScaling: true,
    );
    return Scaffold(
      appBar: _createAppbar(context),
      body: _createBody(context),
    );
  }

  Widget _createAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      brightness: Brightness.light,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: '2020-10-25', style: TextStyle(color: Colors.black38)),
      ),
      actions: <Widget>[
        PopupMenuButton(
          icon: SvgPicture.asset(
            "assets/images/icon/gengduo.svg",
            color: Colors.black45,
            width: duSetWidth(50),
            height: duSetHeight(50),
          ),
          itemBuilder: (BuildContext context) {
            return <PopupMenuItem<String>>[
              PopupMenuItem<String>(
                child: Text("城市列表"),
                value: "city_lsit",
              ),
            ];
          },
          onSelected: (String action) {
            // 点击选项的时候
            switch (action) {
              case 'city_lsit':
                print("跳转城市列表");
                ExtendedNavigator.of(context).push(Routes.cityListPage);
                break;
            }
          },
        )
      ],
    );
  }

  Widget _createBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _dayPanel(context),
        _weekPanel(context),
        _otherPanel(context),
      ],
    );
  }

  Widget _weatherName(BuildContext context) {
    return Container(
      child: Text('Weather Info'),
      color: Colors.white,
    );
  }

  Widget _dayPanel(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          // color: Colors.grey,
          ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: duSetHeight(100)),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '北京市',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: duSetWidth(80),
                        ),
                      ),
                    )),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '多云',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: duSetWidth(40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: duSetWidth(320),
            height: duSetHeight(320),
            child: SvgPicture.asset(
              "assets/images/info/tianqi-duoyun.svg",
              color: Colors.black45,
            ),
          ),
          Container(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '30°',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: duSetWidth(310),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: duSetHeight(35)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: duSetWidth(50)),
                  child: Column(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'max',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: duSetWidth(50),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '31°',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: duSetWidth(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //垂直分割线
                SizedBox(
                  width: duSetWidth(50),
                  height: duSetHeight(100),
                  child: VerticalDivider(
                    width: duSetWidth(50),
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: duSetWidth(60)),
                  child: Column(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'min',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: duSetWidth(50),
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '23°',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: duSetWidth(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              // color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _weekPanel(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: duSetWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: '星期一',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(30),
                    ),
                  ),
                ),
                Container(
                  width: duSetWidth(100),
                  height: duSetHeight(100),
                  child: SvgPicture.asset(
                    "assets/images/info/tianqi-qing.svg",
                    color: Colors.black54,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '31°',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(35),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: '星期二',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(30),
                    ),
                  ),
                ),
                Container(
                  width: duSetWidth(100),
                  height: duSetHeight(100),
                  child: SvgPicture.asset(
                    "assets/images/info/tianqi-qing.svg",
                    color: Colors.black54,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '26°',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(35),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: '星期三',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(30),
                    ),
                  ),
                ),
                Container(
                  width: duSetWidth(100),
                  height: duSetHeight(100),
                  child: SvgPicture.asset(
                    "assets/images/info/tianqi-qing.svg",
                    color: Colors.black54,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '29°',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(35),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: '星期四',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(30),
                    ),
                  ),
                ),
                Container(
                  width: duSetWidth(100),
                  height: duSetHeight(100),
                  child: SvgPicture.asset(
                    "assets/images/info/tianqi-qing.svg",
                    color: Colors.black54,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '28°',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(35),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: '星期五',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(30),
                    ),
                  ),
                ),
                Container(
                  width: duSetWidth(100),
                  height: duSetHeight(100),
                  child: SvgPicture.asset(
                    "assets/images/info/tianqi-qing.svg",
                    color: Colors.black54,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '19°',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(35),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: '星期六',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(30),
                    ),
                  ),
                ),
                Container(
                  width: duSetWidth(100),
                  height: duSetHeight(100),
                  child: SvgPicture.asset(
                    "assets/images/info/tianqi-qing.svg",
                    color: Colors.black54,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '25°',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(35),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: '星期日',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(30),
                    ),
                  ),
                ),
                Container(
                  width: duSetWidth(100),
                  height: duSetHeight(100),
                  child: SvgPicture.asset(
                    "assets/images/info/tianqi-qing.svg",
                    color: Colors.black54,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '20°',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: duSetWidth(35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _otherPanel(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: duSetHeight(60)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '风速',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: duSetWidth(50),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '3.1m/s',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: duSetWidth(50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '湿度',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: duSetWidth(50),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '80%',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: duSetWidth(50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '日落',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: duSetWidth(50),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '17:30',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: duSetWidth(50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '日出',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: duSetWidth(50),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '05:30',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: duSetWidth(50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
