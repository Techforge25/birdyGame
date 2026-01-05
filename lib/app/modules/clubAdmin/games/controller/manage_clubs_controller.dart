import 'package:bierdygame/app/modules/clubAdmin/newGame/model/game_model.dart';
import 'package:get/get.dart';

class ManageClubsController extends GetxController {
  RxInt selectedTab = 0.obs;
  Rx<String?> selectedClub = Rx<String?>(null);

  RxList<GameModel> games = <GameModel>[].obs;
  
  RxBool showGameDetail = false.obs;
  Rx<GameModel?> selectedGame = Rx<GameModel?>(null);

  void changeTab(int index) {
    selectedTab.value = index;
    selectedClub.value = null;
  }

  void addGame(GameModel game) {
    games.insert(0, game); // latest on top
  }

  void removeGame(GameModel game) {
    games.remove(game);
  }

  void openGame(GameModel game) {
    selectedGame.value = game;
    showGameDetail.value = true;
  }

  void backToGames() {
    showGameDetail.value = false;
    selectedGame.value = null;
  }

  List<GameModel> get filteredGames {
    switch (selectedTab.value) {
      case 1:
        return games.where((g) => g.status == GameStatus.active).toList();
      case 2:
        return games.where((g) => g.status == GameStatus.draft).toList();
      case 3:
        return games.where((g) => g.status == GameStatus.completed).toList();
      default:
        return games;
    }
  }
}
