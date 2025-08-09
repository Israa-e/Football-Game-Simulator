import 'player.dart';
import 'trainer.dart';
import '../data/enum.dart';

class Team {
  // Required properties
  String teamName;
  Trainer trainer;
  List<Player> players;

  // Additional creative properties
  String mascot;
  String city;
  String teamColors;
  String motto;
  Strategy strategy;
  int fanLoyalty; // 1-100

  Team({
    required this.teamName,
    required this.trainer,
    required this.players,
    required this.mascot,
    required this.city,
    required this.teamColors,
    required this.motto,
    required this.strategy,
    required this.fanLoyalty,
  });

  void displayInfo(id) {
    print("\n🏆 TEAM${id}: $teamName");
    print("🏙️  City: $city");
    print("🎨 Colors: $teamColors");
    print("🦅 Mascot: $mascot");
    print("💭 Motto: \"$motto\"");
    print("🎯 Strategy: ${strategy.name.toUpperCase()}");
    print("❤️  Fan Loyalty: $fanLoyalty%");
    trainer.displayInfo();
    print("\n👥 PLAYERS:");
    for (var player in players) {
      player.displayInfo();
    }
  }

  // Calculate total team power
  int calculateTotalPower() {
    int playersPower = players.fold(0, (sum, player) => sum + player.power!);
    int trainerBonus = trainer.experience! + trainer.getMotivationBonus();
    return playersPower + trainerBonus;
  }
}
