
import 'package:auto_route/auto_route_annotations.dart';
import 'package:ngzk_weather/pages/index/index.dart';
import 'package:ngzk_weather/pages/weather/info_page.dart';

@MaterialAutoRouter(
    routes:[
      MaterialRoute(page: WeatherInfo, initial: true),
      MaterialRoute(page: IndexPage, initial: false),
    ]
)
class $AppRouter{}