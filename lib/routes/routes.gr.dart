// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/index/index.dart';
import '../pages/weather/info_page.dart';

class Routes {
  static const String indexPage = '/index-page';
  static const String weatherInfo = '/';
  static const all = <String>{
    indexPage,
    weatherInfo,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.indexPage, page: IndexPage),
    RouteDef(Routes.weatherInfo, page: WeatherInfo),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    IndexPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => IndexPage(),
        settings: data,
      );
    },
    WeatherInfo: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WeatherInfo(),
        settings: data,
      );
    },
  };
}
