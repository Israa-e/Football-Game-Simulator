import 'dart:math';

import 'Person.dart';
import 'match_event.dart';
import '../data/enum.dart';

class Referee extends Person {
  static int _idCounter = 1;
  int experience;

  bool strictness; // affects card decisions

  Referee({
    required super.name,
    required this.experience,
    required super.nationality,
    required this.strictness,
  }) : super(id: _idCounter++);
  @override
  void displayInfo() {
    print("\n👨‍⚖️ REFEREE: $name (From: $nationality)");
    print("   Experience: $experience years");
    print("   Style: ${strictness ? 'Strict' : 'Lenient'}");
  }

  List<MatchEvent> generateMatchEvents() {
    List<MatchEvent> events = [];
    Random random = Random();
    int numEvents = random.nextInt(5) + 2;

    // Simulate match events
    for (int i = 0; i < numEvents; i++) {
      int minute = random.nextInt(90) + 1;
      EventType eventType =
          EventType.values[random.nextInt(EventType.values.length)];
      String description = _getEventDescription(eventType, minute);
      events.add(
        MatchEvent(minute: minute, type: eventType, description: description),
      );
    }
    events.sort((a, b) => a.minute.compareTo(b.minute));

    return events;
  }

  String _getEventDescription(EventType type, int minute) {
    final random = Random();
    switch (type) {
      case EventType.goal:
        List<String> goalTypes = [
          "header",
          "long shot",
          "penalty",
          "free kick",
          "close range",
        ];
        return "⚽ GOAL! Beautiful ${goalTypes[random.nextInt(goalTypes.length)]} finds the net!";
      case EventType.yellowCard:
        List<String> reasons = [
          "rough tackle",
          "dissent",
          "time wasting",
          "simulation",
        ];
        return "🟨 Yellow card for ${reasons[random.nextInt(reasons.length)]}";
      case EventType.redCard:
        return "🟥 RED CARD! Player sent off!";
      case EventType.injury:
        return "🏥 Player down with an injury, medical team on field";
      case EventType.substitution:
        return "🔄 Tactical substitution by the coach";
    }
  }
}
