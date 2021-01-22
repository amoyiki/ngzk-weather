

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:ngzk_weather/common/entity/entity.dart';
import 'package:ngzk_weather/common/utils/screen.dart';

class ListItem {
  static Widget getListItem(BuildContext context, CityListModel model,
      {double susHeight = 40}) {
    return ListTile(
      title: Text(model.city),
      onTap: () {
        LogUtil.e("onItemClick : $model");
      },
    );
  }

  static Widget getSusItem(BuildContext context, String tag, {double susHeight = 40}) {
    if ( tag == '❤'){
      tag = '❤ 热门城市';
    }
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16),
      color: Colors.black26,
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: duSetFontSize(14),
          color: Colors.black,
        ),
      ),
    );
  }


}