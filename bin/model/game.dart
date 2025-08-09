import 'dart:io';
import 'dart:math';
import 'strategy_matrix.dart';
import 'commentator.dart';
import 'stadium.dart';
import 'team.dart';
import 'referee.dart';
import '../data/dummy_data.dart';
import '../data/enum.dart';
import 'trainer.dart';
import 'player.dart';
import 'weather_system.dart';
import 'match_event.dart';

class Game {
  Team? team1;
  Team? team2;
  Stadium? stadium;
  Referee? referee;
  Commentator? commentator;
  // Safe input methods with validation
  String getStringInput(String prompt, {String defaultValue = ""}) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    return (input?.isEmpty ?? true) ? defaultValue : input!;
  }

  int getIntInput(
    String prompt, {
    int min = 1,
    int max = 999999,
    int defaultValue = 1,
  }) {
    while (true) {
      stdout.write("$prompt (${min}-${max}, default: $defaultValue): ");
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        return defaultValue;
      }

      try {
        int value = int.parse(input);
        if (value >= min && value <= max) {
          return value;
        } else {
          print("❌ Please enter a number between $min and $max.");
        }
      } catch (e) {
        print("❌ Invalid input. Please enter a valid number.");
      }
    }
  }

  bool getBoolInput(String prompt, {bool defaultValue = false}) {
    while (true) {
      stdout.write(
        "$prompt (yes/no, default: ${defaultValue ? 'yes' : 'no'}): ",
      );
      String? input = stdin.readLineSync()?.toLowerCase();

      if (input == null || input.isEmpty) {
        return defaultValue;
      }

      if (input == 'yes' || input == 'y' || input == 'true') {
        return true;
      } else if (input == 'no' || input == 'n' || input == 'false') {
        return false;
      } else {
        print("❌ Please enter 'yes' or 'no'.");
      }
    }
  }

  // Create team
  Team createMyTeam() {
    print("⚽ CREATING MY TEAM ");
    bool randomTeam = getBoolInput(
      "🎲 Do you want to  Generate random Team?",
      defaultValue: false,
    );

    if (randomTeam) {
      return generateDummyTeam();
    } else {
      //team
      String teamName = getStringInput(
        "Enter team name: ",
        defaultValue: "My Team ",
      );
      String city = getStringInput("Enter city: ", defaultValue: "City 1 ");
      String teamColors = getStringInput(
        "Enter team colors: ",
        defaultValue: "Blue and White",
      );
      String mascot = getStringInput("Enter mascot: ", defaultValue: "Eagle");
      String motto = getStringInput(
        "Enter team motto: ",
        defaultValue: "Victory Forever!",
      );
      int fanLoyalty = getIntInput(
        "Enter fan loyalty",
        min: 1,
        max: 100,
        defaultValue: 75,
      );

      //Create trainer
      print("\n--- Creating Trainer ---");
      Trainer trainer = createTrainerInfo();

      // Choose strategy
      print("\n--- Choose Team Strategy ---");
      for (int i = 0; i < Strategy.values.length; i++) {
        print("${i + 1}. ${Strategy.values[i].name}");
      }
      print("Select a strategy by number:");

      int strategyIndex = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
      Strategy teamStrategy =
          (strategyIndex > 0 && strategyIndex <= Strategy.values.length)
              ? Strategy.values[strategyIndex - 1]
              : Strategy.balanced;
      // Create Players
      print("\n--- Creating Players ---");
      List<Player> players = createPlayerInfo();

      return Team(
        teamName: teamName,
        trainer: trainer,
        players: players,
        mascot: mascot,
        city: city,
        teamColors: teamColors,
        motto: motto,
        strategy: teamStrategy,
        fanLoyalty: fanLoyalty,
      );
    }

    // return myTeam;
  }

  // Create stadium
  Stadium createStadium() {
    print("\n" + "=" * 50);
    print("🏟️  CREATING STADIUM");
    print("=" * 50);
    bool randomStadium = getBoolInput(
      "🎲 Do you want to  Generate random Stadium?",
      defaultValue: false,
    );

    if (randomStadium) {
      return generateDummyStadium();
    } else {
      String name = getStringInput(
        "Enter stadium name: ",
        defaultValue: "Central Stadium",
      );

      String location = getStringInput(
        "Enter location: ",
        defaultValue: "City Center",
      );

      int capacity = getIntInput(
        "Enter capacity: (1000-200000)",
        min: 1000,
        max: 200000,
        defaultValue: 50000,
      );

      int altitude = getIntInput(
        "Enter altitude (0-5000 meters)",
        min: 0,
        max: 5000,
        defaultValue: 100,
      );

      String turfType = getStringInput(
        "Enter turf type (grass/artificial): ",
        defaultValue: "grass",
      );

      bool hasRoof = getBoolInput("Has roof?", defaultValue: false);

      Weather weather = WeatherSystem.generateRandomWeather();
      return Stadium(
        name: name,
        location: location,
        capacity: capacity,
        weather: weather,
        altitude: altitude,
        turfType: turfType,
        hasRoof: hasRoof,
      );
    }
  }

  // Create referee
  Referee createReferee() {
    final random = Random();
    List<String> refNames = [
      "John Smith",
      "Maria Rodriguez",
      "Ahmed Al-Hassan",
      "Pierre Dubois",
      "Yuki Tanaka",
    ];
    List<String> nationalities = ["England", "Spain", "UAE", "France", "Japan"];

    int index = random.nextInt(refNames.length);

    return Referee(
      name: refNames[index],
      experience: random.nextInt(15) + 5,
      nationality: nationalities[index],
      strictness: random.nextBool(),
    );
  }

  // Create commentator
  Commentator createCommentator() {
    final random = Random();
    List<String> commentatorNames = [
      "David Johnson",
      "Sarah Williams",
      "Carlos Mendez",
    ];
    List<String> styles = ["Energetic", "Analytical", "Humorous"];

    int index = random.nextInt(commentatorNames.length);
    return Commentator(name: commentatorNames[index], style: styles[index]);
  }

  // Main game simulation
  void simulateGame() {
    print("\n🏆 FOOTBALL GAME SIMULATOR");
    sleep(Duration(milliseconds: 100));

    print("Design the Game. Code Your Imagination!");
    sleep(Duration(milliseconds: 100));

    print("\n" + "=" * 60);
    // Create game components
    try {
      print("🎮 Setting up the game...\n");
      sleep(Duration(milliseconds: 100));

      team1 = createMyTeam();
      team2 = generateDummyTeam();
      stadium = createStadium();
      referee = createReferee();
      commentator = createCommentator();

      // Display all information
      print("\n" + "🌟" * 30);
      print("MATCH PREVIEW");
      sleep(Duration(milliseconds: 100));

      print("🌟" * 30);
      sleep(Duration(milliseconds: 100));

      stadium!.displayInfo();
      sleep(Duration(milliseconds: 100));

      referee!.displayInfo();
      sleep(Duration(milliseconds: 100));

      team1!.displayInfo(1);
      sleep(Duration(milliseconds: 100));

      team2!.displayInfo(2);
      sleep(Duration(milliseconds: 100));

      print("\n📊 STRATEGY ANALYSIS:");
      sleep(Duration(milliseconds: 100));

      StrategyMatrix.displayMatrix();
      sleep(Duration(milliseconds: 100));

      // Ask user if they want to continue
      bool continueGame = getBoolInput(
        "\n🎯 Ready to simulate the match?",
        defaultValue: true,
      );
      sleep(Duration(milliseconds: 200));

      if (!continueGame) {
        print("🛑 Game cancelled. Thanks for playing!");
        return;
      }

      // Commentary opening
      sleep(Duration(milliseconds: 200));

      commentator!.openingCommentary(team1!, team2!, stadium!);

      // Calculate powers
      int team1Power = calculateTeamPower(team1!);
      int team2Power = calculateTeamPower(team2!);
      print("\n⚡ POWER CALCULATIONS:");
      print("${team1!.teamName}: $team1Power");
      print("${team2!.teamName}: $team2Power");

      // Generate match events
      List<MatchEvent> events = referee!.generateMatchEvents();

      print("\n🎮 MATCH SIMULATION:");
      print("-" * 40);

      int team1Score = 0;
      int team2Score = 0;
      for (MatchEvent event in events) {
        print("${event.minute}' ${event.description}");
        if (event.type == EventType.goal) {
          // Random goal assignment based on team power
          final random = Random();
          if (random.nextDouble() < (team1Power / (team1Power + team2Power))) {
            team1Score++;
            commentator!.provideCommentary(
              "${team1!.teamName} takes the lead!",
            );
          } else {
            team2Score++;
            commentator!.provideCommentary("${team2!.teamName} strikes back!");
          }
        }
        sleep(Duration(milliseconds: 500));
      }

      // Determine winner

      Team winner;
      if (team1Score > team2Score) {
        winner = team1!;
      } else if (team2Score > team1Score) {
        winner = team2!;
      } else {
        // In case of tie, team with higher power wins
        winner = team1Power >= team2Power ? team1! : team2!;
        if (team1Score == team2Score) {
          if (team1Power >= team2Power) {
            team1Score++;
            commentator!.provideCommentary(
              "${team1!.teamName} scores in extra time!",
            );
          } else {
            team2Score++;
            commentator!.provideCommentary(
              "${team2!.teamName} scores in extra time!",
            );
          }
        }
      }
      // Final results
      commentator!.finalCommentary(winner, team1Score, team2Score);

      print("\n🏆 FINAL RESULT:");
      print("${team1!.teamName} $team1Score - $team2Score ${team2!.teamName}");
      print("🥇 WINNER: ${winner.teamName}");
      print("🏟️  Venue: ${stadium!.name}, ${stadium!.location}");
      // Ask if user wants to play again
      bool playAgain = getBoolInput(
        "\n🔄 Would you like to simulate another match?",
        defaultValue: false,
      );
      if (playAgain) {
        print("\n" + "=" * 60);
        simulateGame();
      } else {
        print("\n⚽ Thanks for playing the Football Game Simulator!");
        print("🏆 May the best team win next time!");
      }
    } catch (e) {
      print("\n❌ An unexpected error occurred: $e");
      print("🔄 Restarting the game...");
      simulateGame();
    }
  }

  // Calculate total team power with all bonuses
  int calculateTeamPower(Team team) {
    int basePower = team.calculateTotalPower();
    int strategyBonus = StrategyMatrix.getStrategyBonus(
      team.strategy,
      team == team1 ? team2!.strategy : team1!.strategy,
    );
    int weatherEffect = stadium!.getWeatherEffect();
    int fanBonus = (team.fanLoyalty * 0.2).round();
    int randomFactor = Random().nextInt(20) - 10; // -10 to +10
    return basePower + strategyBonus + weatherEffect + fanBonus + randomFactor;
  }

  createPlayerInfo() {
    List<Player> players = [];
    bool randomPlayers = getBoolInput(
      "🎲 Do you want to Generate random 11 Players?",
      defaultValue: true,
    );

    if (randomPlayers) {
      for (int i = 0; i < 11; i++) {
        players.add(generateRandomPlayer());
      }
      return players;
    } else {
      int numPlayers = getIntInput(
        "Enter number of players",
        min: 1,
        max: 23,
        defaultValue: 11,
      );

      for (int i = 0; i < numPlayers; i++) {
        print("\n--- Player ${i + 1} ---");
        String playerName = getStringInput(
          "Enter player  Name: ",
          defaultValue: "Player ${i + 1}",
        );
        int playerAge = getIntInput(
          "Enter player age:(16-45)",
          min: 16,
          max: 45,
          defaultValue: 25,
        );
        String playerNationality = getStringInput(
          "Enter player  Nationality: ",
          defaultValue: "Unknown",
        );

        Positions? playerPosition =
            i < Positions.values.length ? Positions.values[i] : Positions.sub;

        int jerseyNumber = getIntInput(
          "Enter player Jersey number",
          min: 1,
          max: 99,
          defaultValue: i + 1,
        );
        String skills = getStringInput(
          "Enter player Special skills: ",
          defaultValue: "Good technique",
        );

        players.add(
          Player(
            name: playerName,
            position: playerPosition,
            power: random.nextInt(30) + 70, // 70-99 power
            age: playerAge,
            nationality: playerNationality,
            stamina: random.nextInt(20) + 80, // 80-100 stamina
            jerseyNumber: jerseyNumber,
            skills: skills,
          ),
        );
      }
      return players;
    }
  }

  createTrainerInfo() {
    bool randomTrainer = getBoolInput(
      "🎲 Do you want to Generate random Trainer?",
      defaultValue: false,
    );

    if (randomTrainer) {
      // Generate random trainer
      return generateRandomTrainer();
    } else {
      String trainerName = getStringInput(
        "Enter trainer name: ",
        defaultValue: "Coach Smith",
      );
      String trainerNationality = getStringInput(
        "Enter trainer nationality: ",
        defaultValue: "Unknown",
      );
      int trainerAge = getIntInput(
        "Enter trainer age",
        min: 25,
        max: 80,
        defaultValue: 45,
      );
      String specialty = getStringInput(
        "Enter trainer specialty:${Strategy.values.map((e) => e.name).join(",")} ",
        defaultValue: "Tactical",
      );

      final random = Random();
      Trainer trainer = Trainer(
        name: trainerName,
        experience: random.nextInt(20) + 5,
        strategySpecialty: specialty,
        motivation: random.nextInt(30) + 70,
        nationality: trainerNationality,
        age: trainerAge,
      );
      return trainer;
    }
  }
}
