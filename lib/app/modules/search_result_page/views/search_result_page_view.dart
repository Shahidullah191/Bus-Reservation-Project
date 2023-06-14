import 'package:bus_reservation/app/data/utils/constants.dart';
import 'package:bus_reservation/app/models/bus_schedule.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
              'From ${controller.busRoute?.cityFrom} To ${controller.busRoute?.cityTo} on ${controller.departureDate.value}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GetBuilder<SearchResultPageController>(
            initState: (_) {
              controller
                  .getSchedulesByRouteName(controller.busRoute!.routeName);
              print(controller.busRoute!.routeName);
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
                    return Card(
                      child: ListTile(
                        title: Text(
                          schedule.bus.busName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          schedule.bus.busType,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          '$currency${schedule.ticketPrice}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                );
              } else if (list.isEmpty) {
                return const Center(
                  child: Text('Error'),
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
