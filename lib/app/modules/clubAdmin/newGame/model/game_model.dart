enum GameStatus { active, draft, completed }

class GameModel {
  final String name;
  final String date;
  final String passkey;
  final GameStatus status;

  // Additional for GameDetailView
  final int currentHole;
  final int totalHoles;
  final int par;
  final int totalTeams;
  final int totalPlayers;
  final int birdiedTeams;
  final double matchProgress; // 0.0 to 1.0
  final List<TeamModel> teams;

  GameModel({
    required this.name,
    required this.date,
    required this.passkey,
    required this.status,
    this.currentHole = 1,
    this.totalHoles = 9,
    this.par = 3,
    this.totalTeams = 0,
    this.totalPlayers = 0,
    this.birdiedTeams = 0,
    this.matchProgress = 0.0,
    this.teams = const [],
  });
}

class TeamModel {
  String name;
  int playersCount;
  int birdies;
  int holesRemaining;
  double progress; // 0.0 - 1.0

  TeamModel({
    required this.name,
    required this.playersCount,
    required this.birdies,
    required this.holesRemaining,
    required this.progress,
  });
}



//