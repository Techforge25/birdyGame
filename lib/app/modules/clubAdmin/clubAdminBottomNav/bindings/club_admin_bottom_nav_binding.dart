import 'package:bierdygame/app/modules/clubAdmin/clubAdminBottomNav/controller/club_admin_bot_nav_controller.dart';
import 'package:get/get.dart';

class ClubAdminBottomNavBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(ClubAdminBottomNavController(), permanent: true);
  }
}
