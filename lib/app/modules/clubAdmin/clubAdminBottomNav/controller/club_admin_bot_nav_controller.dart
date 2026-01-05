import 'package:bierdygame/app/modules/clubAdmin/dashboard/view/dashboard_view.dart';
import 'package:bierdygame/app/modules/clubAdmin/games/view/manage_games.dart';
import 'package:bierdygame/app/modules/clubAdmin/newGame/view/new_game_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubAdminBottomNavController extends GetxController {
  
  var currentIndex = 0.obs;
  var bottomNavIndex = 0.obs;

  final List<Widget> screens = [
    
    ClubAdminDashboard(),
    ManageClubsGames(),
    NewGameView(),
    Container(child: Text("Admins"),),
    Container(child: Text("Profile"),),
  ];
  
  void changeTab(int index) {
    currentIndex.value = index;
    if (index >= 0 && index < 5) {
      bottomNavIndex.value = index;
    }
  }
}
 