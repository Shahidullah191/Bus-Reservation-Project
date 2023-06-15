import 'package:bus_reservation/app/models/bus_schedule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeatPlanPageController extends GetxController {
  final argList = Get.arguments as List;

  late BusSchedule busSchedule;
  late String departureDate;

  RxInt totalSeatBooked = 0.obs;
  RxString bookedSeatNumbers = ''.obs;
  RxList<String> selectedSeatList = RxList<String>([]);
  RxBool isFirst = true.obs;
  RxBool isLoading = true.obs;
  ValueNotifier<String> selectedSeatStringNotifier = ValueNotifier<String>('');

  @override
  void onInit() {
    busSchedule = argList[0];
    departureDate = argList[1];
    super.onInit();
  }
}
