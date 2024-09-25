import 'package:get/get.dart';

import '../controllers/add_new_address_page_controller.dart';

class AddNewAddressPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewAddressPageController>(
      () => AddNewAddressPageController(),
    );
  }
}
