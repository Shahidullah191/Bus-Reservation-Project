import 'package:another_flushbar/flushbar.dart';
import 'package:bus_reservation/app/data/datasource/temp_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/utils/helper_functions.dart';

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
    if (selectedDate != null && selectedDate != departureDate?.value) {
      departureDate?.value = selectedDate;
      update();
    }
  }

  ///This function is used to search the route
  void search() {
    if (formKey.currentState!.validate()) {
      try {
        final route = TempDB.tableRoute.firstWhere((element) =>
            element.cityFrom == formCity && element.cityTo == toCity);
        showMessage(route.routeName);
      } on StateError catch (e) {
        showMessage("No route found");
      }
    }

    if (departureDate == temp) {
      showMessage("Please select departure date");
      return;
    }
  }
}
