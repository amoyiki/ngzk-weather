
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ViewStateBusyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ViewStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final Widget image;
  final Widget buttonText;
  final String buttonTextData;
  final VoidCallback onPressed;

  ViewStateWidget({
    Key key,
    this.image,
    this.title,
    this.message,
    this.buttonText,
    @required this.onPressed,
    this.buttonTextData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleStyle = Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.grey);
    var messageStyle = titleStyle.copyWith(
      color: titleStyle.color.withOpacity(0.7), fontSize: 14
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        image ?? Icon(Icons.ac_unit, size: 80,)
      ],
    );
  }
}
