import 'package:bus_reservation/app/modules/seat_plan_page/widgets/seat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/utils/constants.dart';

class SeatPlanView extends StatelessWidget {
  final int totalSeats;
  final String bookedSeatNumbers;
  final int totalSeatBooked;
  final bool isBusinessClass;
  final Function(bool, String) onSeatSelected;

  const SeatPlanView(
      {super.key,
      required this.totalSeats,
      required this.bookedSeatNumbers,
      required this.totalSeatBooked,
      required this.isBusinessClass,
      required this.onSeatSelected});

  @override
  Widget build(BuildContext context) {
    final noOfRows =
        (isBusinessClass ? totalSeats / 3 : totalSeats / 4).toInt();

    final noOfColumns = isBusinessClass ? 3 : 4;

    List<List<String>> seatArrangement = [];
    for (int i = 0; i < noOfRows; i++) {
      List<String> column = [];
      for (int j = 0; j < noOfColumns; j++) {
        column.add('${seatLabelList[i]} ${j + 1}');
      }
      seatArrangement.add(column);
    }

    final List<String> bookedSeatList =
        bookedSeatNumbers.isEmpty ? [] : bookedSeatNumbers.split(',');
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8.0),
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          const Text(
            "FRONT",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Column(
            children: List.generate(
              noOfRows,
              (rowIndex) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    noOfColumns,
                    (columnIndex) {
                      final seatLabel = seatArrangement[rowIndex][columnIndex];
                      final isBooked = bookedSeatList.contains(seatLabel);
                      return Row(
                        children: [
                          Seat(
                            label: seatLabel,
                            isBooked: isBooked,
                            onSelect: (value) {
                              onSeatSelected(value, seatLabel);
                            },
                          ),
                          if (isBusinessClass && columnIndex == 0)
                            const SizedBox(
                              width: 24,
                            ),
                          if (!isBusinessClass && columnIndex == 1)
                            const SizedBox(
                              width: 24,
                            ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
