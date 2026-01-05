import 'dart:math';
import 'package:bierdygame/app/modules/clubAdmin/clubAdminBottomNav/controller/club_admin_bot_nav_controller.dart';
import 'package:bierdygame/app/modules/clubAdmin/games/controller/manage_clubs_controller.dart';
import 'package:bierdygame/app/modules/clubAdmin/newGame/widgets/counter_widget.dart';
import 'package:bierdygame/app/modules/clubAdmin/newGame/model/game_model.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_elevated_button.dart';
import 'package:bierdygame/app/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewGameView extends StatefulWidget {
  const NewGameView({super.key});

  @override
  State<NewGameView> createState() => _NewGameViewState();
}

class _NewGameViewState extends State<NewGameView> {
  final TextEditingController nameController = TextEditingController();

  int teams = 4;
  int playersPerTeam = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),

              /// BACK + TITLE
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.find<ClubAdminBottomNavController>().changeTab(1);
                    },
                    child: Icon(Icons.arrow_back_ios,
                        size: 22, color: AppColors.primary),
                  ),
                  Expanded(
                    child: Center(
                        child: Text("Create a Game",
                            style: AppTextStyles.miniHeadings)),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// GAME DETAILS TITLE
              Text("Game Details",
                  style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 18.sp, fontWeight: FontWeight.bold)),

              const Divider(),
              SizedBox(height: 15.h),

              /// GAME NAME FIELD
              CustomFormField(
                controller: nameController,
                hint: "Enter Game Name",
                label: "Game name",
              ),

              SizedBox(height: 20.h),

              /// NUMBER OF TEAMS
              CounterSettingTile(
                title: "Number of Teams",
                subtitle: "Total teams playing",
                value: teams,
                minValue: 2,
                maxValue: 8,
                icon: Icons.groups,
                iconBgColor: Colors.green,
                onIncrement: () => setState(() {
                  if (teams < 8) teams++;
                }),
                onDecrement: () => setState(() {
                  if (teams > 2) teams--;
                }),
              ),

              SizedBox(height: 12.h),

              /// PLAYERS PER TEAM
              CounterSettingTile(
                title: "Players per Team",
                subtitle: "Size of each team",
                value: playersPerTeam,
                minValue: 2,
                maxValue: 4,
                icon: Icons.person,
                iconBgColor: Colors.blue,
                onIncrement: () => setState(() {
                  if (playersPerTeam < 4) playersPerTeam++;
                }),
                onDecrement: () => setState(() {
                  if (playersPerTeam > 2) playersPerTeam--;
                }),
              ),

              SizedBox(height: 30.h),

              /// CREATE GAME BUTTON
              CustomElevatedButton(
                btnName: "Create Game",
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please enter a game name",
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  final newGame = GameModel(
                    name: nameController.text,
                    date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                    passkey: generatePasskey(length: 6),
                    status: GameStatus.active,
                    totalTeams: teams,
                    totalPlayers: teams * playersPerTeam,
                    teams: List.generate(
                      teams,
                      (i) => TeamModel(
                        name: 'Team ${i + 1}',
                        playersCount: playersPerTeam,
                        birdies: 0,
                        holesRemaining: 9,
                        progress: 0.0,
                      ),
                    ),
                  );

                  // ADD GAME TO CONTROLLER
                  Get.find<ManageClubsController>().addGame(newGame);

                  // NAVIGATE BACK TO MANAGE GAMES TAB
                  Get.find<ClubAdminBottomNavController>().changeTab(1);
                },
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  /// RANDOM PASSKEY GENERATOR
  String generatePasskey({int length = 6}) {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final rand = Random.secure();

    return List.generate(
      length,
      (_) => chars[rand.nextInt(chars.length)],
    ).join();
  }
}
