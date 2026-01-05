import 'package:get/get.dart';
import '../controller/super_admin_bot_nav_controller.dart';

class SuperAdminBottomNavBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(SuperAdminBotNavController(), permanent: true);
  }
}
