import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search_page/bindings/search_page_binding.dart';
import '../modules/search_page/views/search_page_view.dart';
import '../modules/search_result_page/bindings/search_result_page_binding.dart';
import '../modules/search_result_page/views/search_result_page_view.dart';
import '../modules/seat_plan_page/bindings/seat_plan_page_binding.dart';
import '../modules/seat_plan_page/views/seat_plan_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SEARCH_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAGE,
      page: () => const SearchPageView(),
      binding: SearchPageBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT_PAGE,
      page: () => const SearchResultPageView(),
      binding: SearchResultPageBinding(),
    ),
    GetPage(
      name: _Paths.SEAT_PLAN_PAGE,
      page: () => const SeatPlanPageView(),
      binding: SeatPlanPageBinding(),
    ),
  ];
}
