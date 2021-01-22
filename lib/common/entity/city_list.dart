// To parse this JSON data, do
//
//     final cityListModel = cityListModelFromJson(jsonString);

import 'dart:convert';

import 'package:azlistview/azlistview.dart';

CityListModel cityListModelFromJson(String str) => CityListModel.fromJson(json.decode(str));

String cityListModelToJson(CityListModel data) => json.encode(data.toJson());

class CityListModel extends ISuspensionBean {
    CityListModel({
        this.city,
        this.cityid,
        this.namePinyin,
        this.tagIndex,
    });

    String city;
    String cityid;
    String namePinyin;
    String tagIndex;

    factory CityListModel.fromJson(Map<String, dynamic> json) => CityListModel(
        city: json["city"],
        cityid: json["cityid"],
        namePinyin: json["namePinyin"],
        tagIndex: json["tagIndex"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "cityid": cityid,
        "namePinyin": namePinyin,
        "tagIndex": tagIndex,
    };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => json.encode(this);
}
