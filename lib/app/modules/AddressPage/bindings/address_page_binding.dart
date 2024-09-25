import 'package:get/get.dart';

import '../controllers/address_page_controller.dart';

class AddressPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressPageController>(
      () => AddressPageController(),
    );
  }
}
