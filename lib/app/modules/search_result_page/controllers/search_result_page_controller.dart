import 'package:bus_reservation/app/data/datasource/data_source.dart';
import 'package:bus_reservation/app/data/datasource/dummy_data_source.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../models/bus_schedule.dart';
import '../../../models/but_route.dart';

class SearchResultPageController extends GetxController {
  /// This part is getting the arguments from the search page
  final argList = Get.arguments as List;

  BusRoute? busRoute;
  Rx<String> departureDate = ''.obs;

  @override
  void onInit() {
    busRoute = argList[0];
    departureDate.value = argList[1];

    if (kDebugMode) {
      print(busRoute?.cityFrom ?? 'null');
    }
    if (kDebugMode) {
      print(departureDate.value);
    }
    getSchedulesByRouteName(busRoute!.routeName);
    super.onInit();
  }

  ///This function is used to get the schedule list
  DataSource dataSource = DummyDataSource();
  RxList<BusSchedule> scheduleList = RxList<BusSchedule>([]);
  void getSchedulesByRouteName(String routeName) async {
    scheduleList(await dataSource.getSchedulesByRouteName(routeName));
  }
}
