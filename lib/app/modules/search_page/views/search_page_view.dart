import 'package:bus_reservation/app/data/utils/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/utils/constants.dart';
import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text('Search'),
      ),
      body: Form(
        key: controller.formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            children: [
              ///create drop down button for city from
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
                isExpanded: true,
                decoration: InputDecoration(
                  hintText: 'City From',
                  prefixIcon: const Icon(Icons.location_city),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
                items: cities
                    .map(
                      (city) => DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      ),
                    )
                    .toList(),
                value: controller.formCity,
                onChanged: (value) {
                  controller.formCity = value.toString();
                },
              ),

              const SizedBox(height: 15),

              ///create drop down button for city to
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
                isExpanded: true,
                decoration: InputDecoration(
                  hintText: 'City To',
                  prefixIcon: const Icon(Icons.location_city),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorStyle: const TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
                items: cities
                    .map(
                      (city) => DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      ),
                    )
                    .toList(),
                value: controller.toCity,
                onChanged: (value) {
                  controller.toCity = value.toString();
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.selectDate();
                      },
                      child: const Text('Select Departure Date'),
                    ),
                    Obx(
                      () => Text(
                        controller.departureDate.value == controller.temp
                            ? 'No Date Selected'
                            : getFormattedDate(controller.departureDate.value,
                                pattern: 'EEE, MMM d, yyyy'),
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.search();
                    },
                    child: const Text('Search'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
