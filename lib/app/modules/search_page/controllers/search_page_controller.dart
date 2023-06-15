import 'package:another_flushbar/flushbar.dart';
import 'package:bus_reservation/app/data/datasource/data_source.dart';
import 'package:bus_reservation/app/data/datasource/temp_db.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/dummy_data_source.dart';
import '../../../data/utils/helper_functions.dart';
import '../../../models/but_route.dart';
import '../../../routes/app_pages.dart';

class SearchPageController extends GetxController {
  //TODO: Implement SearchPageController

  String? formCity;
  String? toCity;

  final formKey = GlobalKey<FormState>();

  ///This function is used to pick the date
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    temp = DateTime.now();
    departureDate = temp.obs;
  }

  DateTime temp = DateTime.now();
  Rx<DateTime> departureDate = DateTime.now().obs;
  void selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 7),
      ),
    );
    if (selectedDate != null && selectedDate != departureDate.value) {
      departureDate.value = selectedDate;
      update();
    }
  }

  ///This function is used to search the route
  void search() {
    if (departureDate == temp) {
      showMessage("Please select departure date");
      return;
    }

    if (formKey.currentState!.validate()) {
      getRouteByCityFromAndCityTo(formCity!, toCity!).then((route) {
        if (route != null) {
          if (kDebugMode) {
            print(route.cityFrom);
          }
          Get.toNamed(Routes.SEARCH_RESULT_PAGE,
              arguments: [route, getFormattedDate(departureDate.value)]);
        } else {
          showMessage("No route found");
        }
      });
    } else {
      showMessage("Please select departure date");
    }
  }

  final DataSource dataSource = DummyDataSource();
  Future<BusRoute?> getRouteByCityFromAndCityTo(
      String cityFrom, String cityTo) {
    return dataSource.getRouteByCityFromAndCityTo(cityFrom, cityTo);
  }
}
