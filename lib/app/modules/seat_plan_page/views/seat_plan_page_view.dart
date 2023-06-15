import 'package:bus_reservation/app/data/resources/colors/app_color.dart';
import 'package:bus_reservation/app/data/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/seat_plan_page_controller.dart';
import '../widgets/seat_plan_view.dart';

class SeatPlanPageView extends GetView<SeatPlanPageController> {
  const SeatPlanPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seat Plan'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: AppColor.seatBookedColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Booked'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: AppColor.seatAvailableColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Available'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: controller.selectedSeatStringNotifier,
              builder: (context, value, child) {
                return Text(
                  "Selected: $value",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Expanded(
                child: SingleChildScrollView(
                  child: SeatPlanView(
                    totalSeats: controller.busSchedule.bus.totalSeat,
                    bookedSeatNumbers: controller.bookedSeatNumbers.value,
                    totalSeatBooked: controller.totalSeatBooked.value,
                    isBusinessClass:
                        controller.busSchedule.bus.busType == busTypeACBusiness,
                    onSeatSelected: (value, seat) {},
                  ),
                ),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
