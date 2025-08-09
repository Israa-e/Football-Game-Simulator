import 'dart:io';

import 'person.dart';
import 'team.dart';
import 'stadium.dart';
import 'weather_system.dart';

class Commentator extends Person {
  static int _idCounter = 1;
  String style;
  Commentator({required super.name, required this.style})
    : super(id: _idCounter++);

  void provideCommentary(String event) {
    print("🎤 $name: $event");
  }

  void openingCommentary(Team team1, Team team2, Stadium stadium) {
    print("\n" + "=" * 60);
    sleep(Duration(milliseconds: 200));

    print("🎤 $name: Welcome to ${stadium.name}!");
    sleep(Duration(milliseconds: 200));

    print("🎤 Today we have ${team1.teamName} facing ${team2.teamName}!");
    sleep(Duration(milliseconds: 200));

    print("🎤 ${WeatherSystem.getWeatherDescription(stadium.weather!)}");
    sleep(Duration(milliseconds: 200));

    print("=" * 60);
  }

  void finalCommentary(Team winner, int team1Score, int team2Score) {
    print("\n" + "=" * 60);
    print(
      "🎤 $name: What a match! ${winner.teamName} wins $team1Score-$team2Score!",
    );
    print("🎤 The fans are going wild in ${winner.city}!");
    print("=" * 60);
  }
}
