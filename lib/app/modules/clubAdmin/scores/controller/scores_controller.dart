import 'package:get/get.dart';

class ScoresController extends GetxController {
  RxInt selectedTab = 0.obs;
  RxBool showGameDetail = false.obs;
  RxBool showPlayerRank = false.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
  void openTeamRank() {
    showGameDetail.value = true;
  }
   void openPlayerRank() {
    showPlayerRank.value = true;
  }

  void backToGames() {
    showGameDetail.value = false;
    showPlayerRank.value = false;
  }
}