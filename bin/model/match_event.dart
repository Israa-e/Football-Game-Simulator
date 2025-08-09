import '../data/enum.dart';

class MatchEvent {
  int minute;
  EventType type;
  String description;

  MatchEvent({
    required this.minute,
    required this.type,
    required this.description,
  });
}
