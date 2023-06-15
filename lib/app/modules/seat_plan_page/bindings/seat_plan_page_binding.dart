import 'package:get/get.dart';

import '../controllers/seat_plan_page_controller.dart';

class SeatPlanPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeatPlanPageController>(
      () => SeatPlanPageController(),
    );
  }
}
