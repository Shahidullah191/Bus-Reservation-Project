import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/resources/colors/app_color.dart';

class Seat extends StatelessWidget {
  final String label;
  final bool isBooked;
  final Function(bool) onSelect;

  Seat({
    super.key,
    required this.label,
    required this.isBooked,
    required this.onSelect,
  });

  RxBool isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          isSelected.value = !isSelected.value;
        },
        child: Container(
          margin: const EdgeInsets.all(8.0),
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isBooked
                ? AppColor.seatBookedColor
                : isSelected.value
                    ? AppColor.seatSelectedColor
                    : AppColor.seatAvailableColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isBooked
                ? null
                : [
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 5,
                      spreadRadius: 2, // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(4, 4),
                      blurRadius: 5,
                      spreadRadius: 2, // changes position of shadow
                    ),
                  ],
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isSelected.value ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
