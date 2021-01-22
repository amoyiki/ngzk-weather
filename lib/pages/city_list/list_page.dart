import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';

import 'package:ngzk_weather/common/entity/entity.dart';
import 'package:ngzk_weather/common/utils/screen.dart';
import 'package:ngzk_weather/common/widget/list_item.dart';

class CityListPage extends StatefulWidget {
  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  List<CityListModel> cityList = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      loadData();
    });
  }

  void loadData() async {
    rootBundle.loadString("assets/citys.json").then((value) {
      cityList.clear();
      Map cityMap = json.decode(value);
      List list = cityMap['cities'];
      list.forEach((v) {
        cityList.add(CityListModel.fromJson(v));
      });
      _handleList(cityList);
    });
  }

  void _handleList(List<CityListModel> list) {
    if (list == null || list.isEmpty) return;
    for (var i = 0, length = list.length; i < length; i++) {
      String py = PinyinHelper.getPinyinE(list[i].city);
      String tag = py.substring(0, 1).toUpperCase();
      list[i].namePinyin = py;
      if (RegExp('[A-Z]').hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = '#';
      }
    }
    SuspensionUtil.sortListBySuspensionTag(list);
    SuspensionUtil.setShowSuspensionStatus(list);
    setState(() {});
  }

  Widget header() {
    return Container(
      color: Colors.white,
      height: duSetHeight(44),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                border: InputBorder.none,
                labelStyle: TextStyle(fontSize: duSetWidth(14), color: Colors.grey),
                hintText: "城市中文或拼音",
                hintStyle: TextStyle(fontSize: duSetWidth(14), color: Colors.grey),
              ),
            ),
          ),
          Container(
            width: duSetWidth(0.33),
            height: duSetHeight(14),
            color: Colors.grey,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "取消",
                style: TextStyle(color: Colors.grey, fontSize: duSetFontSize(14)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            Expanded(child: Material(
              child: Card(
                clipBehavior: Clip.hardEdge,
                shape: const RoundedRectangleBorder(borderRadius: const BorderRadius.only(
                  topLeft:  Radius.circular(4),
                  topRight:  Radius.circular(4),
                ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 15),
                      height: duSetHeight(50),
                      child: Text("当前城市: "+ "北京"),
                    ),
                    Expanded(
                      child: AzListView(data: cityList,
                      itemCount: cityList.length,
                      itemBuilder: (BuildContext context, int index){
                        CityListModel model = cityList[index];
                        return ListItem.getListItem(context, model);
                      },
                      padding: EdgeInsets.zero,
                      susItemBuilder:  (BuildContext context, int index){
                       CityListModel model = cityList[index];
                       String tag = model.getSuspensionTag();
                        return ListItem.getSusItem(context, tag);
                      }
                      ),
                    )
                  ],
                ),
              ),
            )
            ),
          ],
        ),
      ),
    );
  }
}
