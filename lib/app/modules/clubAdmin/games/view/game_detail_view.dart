import 'package:bierdygame/app/modules/clubAdmin/newGame/model/game_model.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GameDetailView extends StatefulWidget {
  final GameModel game;
  final VoidCallback onBack;

  const GameDetailView({super.key, required this.game, required this.onBack});

  @override
  State<GameDetailView> createState() => _GameDetailViewState();
}

class _GameDetailViewState extends State<GameDetailView> {
  bool showTeams = true; // Toggle Teams / Leaderboard

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// ===================
              /// TOP GREEN HEADER
              /// ===================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: widget.onBack,
                      child: const Icon(Icons.arrow_back_ios,
                          color: Colors.white, size: 22),
                    ),
                    const SizedBox(height: 10),
                    Text(widget.game.name,
                        style: AppTextStyles.miniHeadings
                            .copyWith(color: Colors.white)),
                    const SizedBox(height: 4),
                    Text(
                        "Hole ${widget.game.currentHole} of ${widget.game.totalHoles} • Par ${widget.game.par}",
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _statusBadge(widget.game.status),
                        Row(
                          children: const [
                            Icon(Icons.timer, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text("02:14:30",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// ===================
              /// END GAME BUTTON
              /// ===================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      backgroundColor: Colors.red.withOpacity(0.05),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.exit_to_app, color: Colors.red),
                        SizedBox(width: 8),
                        Text("End Game",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// ===================
              /// TEAMS / LEADERBOARD TOGGLE
              /// ===================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      _toggleButton("Teams", showTeams, () {
                        setState(() => showTeams = true);
                      }),
                      _toggleButton("Leaderboard", !showTeams, () {
                        setState(() => showTeams = false);
                      }),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// ===================
              /// STATS CARDS
              /// ===================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _statCard("Teams", widget.game.totalTeams.toString()),
                    _statCard("Players", widget.game.totalPlayers.toString()),
                    _statCard("Team Birdied",
                        "${widget.game.birdiedTeams} / ${widget.game.totalHoles}"),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// ===================
              /// MATCH PROGRESS
              /// ===================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Match Progress",
                        style: AppTextStyles.bodyMedium
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: widget.game.matchProgress,
                      backgroundColor: Colors.green.shade100,
                      color: Colors.green,
                      minHeight: 8,
                    ),
                    const SizedBox(height: 4),
                    Text(
                        "Teams are working to birdie all ${widget.game.totalHoles} holes.",
                        style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// ===================
              /// TEAM PROGRESS LIST
              /// ===================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: widget.game.teams.map((team) {
                    return _teamProgressCard(team);
                  }).toList(),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  /// =====================================
  /// STATUS BADGE
  /// =====================================
  Widget _statusBadge(GameStatus status) {
    Color color;
    switch (status) {
      case GameStatus.active:
        color = Colors.green;
        break;
      case GameStatus.draft:
        color = Colors.orange;
        break;
      case GameStatus.completed:
        color = Colors.grey;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(status.toString(),
          style: TextStyle(color: color, fontWeight: FontWeight.bold)),
    );
  }

  /// =====================================
  /// TOGGLE BUTTON
  /// =====================================
  Widget _toggleButton(String title, bool selected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  /// =====================================
  /// STAT CARD
  /// =====================================
  Widget _statCard(String title, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value,
              style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(title,
              style:
                  TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        ],
      ),
    );
  }

  /// =====================================
  /// TEAM PROGRESS CARD
  /// =====================================
  Widget _teamProgressCard(TeamModel team) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(team.name,
              style: AppTextStyles.bodyMedium
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text("Players: ${team.playersCount}"),
          const SizedBox(height: 4),
          Text("${team.birdies} Birdies",
              style: TextStyle(color: Colors.green)),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: team.progress,
            color: Colors.green,
            backgroundColor: Colors.green.shade100,
            minHeight: 8,
          ),
          const SizedBox(height: 4),
          Text("${team.holesRemaining} Holes Remaining",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        ],
      ),
    );
  }
}
