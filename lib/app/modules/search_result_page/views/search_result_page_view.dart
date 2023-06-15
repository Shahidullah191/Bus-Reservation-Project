import 'package:bus_reservation/app/data/utils/constants.dart';
import 'package:bus_reservation/app/models/bus_schedule.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/search_result_page_controller.dart';

class SearchResultPageView extends GetView<SearchResultPageController> {
  const SearchResultPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Obx(
            () => Text(
              textAlign: TextAlign.center,
              'From ${controller.busRoute?.cityFrom} To ${controller.busRoute?.cityTo} on ${controller.departureDate.value}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<SearchResultPageController>(
            initState: (_) {
              controller
                  .getSchedulesByRouteName(controller.busRoute!.routeName);
              if (kDebugMode) {
                print(controller.busRoute!.routeName);
              }
            },
            init: SearchResultPageController(),
            builder: (snapshot) {
              RxList<BusSchedule> list = snapshot.scheduleList;
              if (list.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    BusSchedule schedule = list[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.SEAT_PLAN_PAGE,
                          arguments: [
                            schedule,
                            controller.departureDate.value,
                          ],
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                schedule.bus.busName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                schedule.bus.busType,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Text(
                                '$currency${schedule.ticketPrice}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'From: ${schedule.busRoute.cityFrom}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'To: ${schedule.busRoute.cityTo}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Departure Time: ${schedule.departureTime}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Total Seat: ${schedule.bus.totalSeat}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
