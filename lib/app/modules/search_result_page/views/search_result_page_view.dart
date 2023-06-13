import 'package:bus_reservation/app/data/utils/constants.dart';
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
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: controller.scheduleList
                  .map((schedule) => ListTile(
                        title: Text(schedule.bus.busName),
                        subtitle: Text(schedule.bus.busType),
                        trailing: Text("$currency${schedule.ticketPrice}"),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
