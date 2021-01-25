// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/city_list/list_page.dart';
import '../pages/index/index_page.dart';
import '../pages/weather/info_page.dart';

class Routes {
  static const String weatherInfoPage = '/';
  static const String indexPage = '/index-page';
  static const String cityListPage = '/city-list-page';
  static const all = <String>{
    weatherInfoPage,
    indexPage,
    cityListPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.weatherInfoPage, page: WeatherInfoPage),
    RouteDef(Routes.indexPage, page: IndexPage),
    RouteDef(Routes.cityListPage, page: CityListPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    WeatherInfoPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WeatherInfoPage(),
        settings: data,
      );
    },
    IndexPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => IndexPage(),
        settings: data,
      );
    },
    CityListPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CityListPage(),
        settings: data,
      );
    },
  };
}
