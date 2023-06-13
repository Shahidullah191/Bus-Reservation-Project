import 'package:get/get.dart';

import '../controllers/search_result_page_controller.dart';

class SearchResultPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchResultPageController>(
      () => SearchResultPageController(),
    );
  }
}
