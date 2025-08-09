import 'dart:math';
import '../model/player.dart';
import '../model/team.dart';
import '../model/trainer.dart';
import 'enum.dart';
import '../model/stadium.dart';
import '../model/weather_system.dart';

Random random = Random();

Team generateDummyTeam({int numberOfPlayers = 11, String? teamStrategy}) {
  List<Player> players = List.generate(
    numberOfPlayers,
    (index) => generateRandomPlayer(positions: Positions.values[index]),
  );
  var teamName =
      FootballTeamName.values[random.nextInt(FootballTeamName.values.length)];
  return Team(
    teamName: teamName.name,
    trainer: generateRandomTrainer(),
    players: players,
    mascot: teamMascots[teamName] ?? '',
    city: teamCities[teamName] ?? "",
    teamColors: teamColors[teamName] ?? 'Unknown Colors',
    motto: teamMottos[teamName] ?? "",
    strategy: Strategy.values[random.nextInt(Strategy.values.length)],
    fanLoyalty: random.nextInt(100) + 1,
  );
}

Player generateRandomPlayer({Positions? positions}) {
  return Player(
    name:
        FootballPlayer
            .values[random.nextInt(FootballPlayer.values.length)]
            .name,

    age: random.nextInt(20) + 18,
    power: random.nextInt(30) + 70,
    position: positions,
    nationality:
        Nationalities.values[random.nextInt(Nationalities.values.length)].name,
    stamina: random.nextInt(20) + 80, // 80-100 stamina
    jerseyNumber: random.nextInt(99) + 1,
    skills: Skills.values[random.nextInt(Skills.values.length)].name,
  );
}

Trainer generateRandomTrainer() {
  return Trainer(
    name: TrainerName.values[random.nextInt(TrainerName.values.length)].name,
    nationality:
        Nationalities.values[random.nextInt(Nationalities.values.length)].name,
    experience: random.nextInt(30) + 1,
    strategySpecialty:
        Strategy.values[random.nextInt(Strategy.values.length)].name,
    motivation: random.nextInt(30) + 70,
    age: random.nextInt(25) + 30,
  );
}

generateDummyStadium() {
  return Stadium(
    name: StadiumName.values[random.nextInt(StadiumName.values.length)].name,
    location: Location.values[random.nextInt(Location.values.length)].name,
    capacity: (random.nextInt(80) + 20) * 1000, // 20k-100k
    weather: WeatherSystem.generateRandomWeather(),
    altitude: random.nextInt(1000),
    turfType: random.nextBool() ? "grass" : "artificial",
    hasRoof: random.nextBool(),
  );
}
