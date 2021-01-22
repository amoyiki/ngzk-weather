
import 'package:auto_route/auto_route_annotations.dart';
import 'package:ngzk_weather/pages/city_list/list_page.dart';
import 'package:ngzk_weather/pages/index/index_page.dart';
import 'package:ngzk_weather/pages/weather/info_page.dart';

@MaterialAutoRouter(
    routes:[
      MaterialRoute(page: WeatherInfoPage, initial: true),
      MaterialRoute(page: IndexPage, initial: false),
      MaterialRoute(page: CityListPage, initial: false),
    ]
)
class $AppRouter{}