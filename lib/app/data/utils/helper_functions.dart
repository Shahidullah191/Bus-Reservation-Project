import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

String getFormattedDate(DateTime date, {String pattern = 'dd/MM/yyyy'}) {
  return DateFormat(pattern).format(date);
}

void showMessage(String message) {
  Flushbar(
    message: message,
    messageColor: Colors.black,
    messageSize: 15.0,
    backgroundColor: Colors.white,
    icon: const Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.lightGreen,
    ),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor: Colors.lightGreen,
  ).show(Get.context!);
}
