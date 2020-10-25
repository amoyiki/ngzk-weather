import 'package:flutter/material.dart';
import 'package:ngzk_weather/common/utils/screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherInfo extends StatelessWidget {
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
      brightness: Brightness.dark,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: '2020-10-25', style: TextStyle(color: Colors.black38)),
      ),
    );
  }

  Widget _createBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _dayPanel(context),
        _hourPanel(context),
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
      height: duSetHeight(1240),
      decoration: new BoxDecoration(
        color: Colors.grey,
      ),
    );
  }

  Widget _hourPanel(BuildContext context) {
    return Container(
      height: duSetHeight(240),
      decoration: new BoxDecoration(
        color: Colors.blue,
      ),
    );
  }

  Widget _otherPanel(BuildContext context) {
    return Container(
      height: duSetHeight(215),
      decoration: new BoxDecoration(
        color: Colors.orange,
      ),
    );
  }
}
