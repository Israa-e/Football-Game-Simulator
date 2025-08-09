import '../data/enum.dart';
import 'person.dart';

class Player extends Person {
  //requied
  static int _idCounter = 1;
  int? power; //random
  Positions? position;
  // Additional creative properties
  int? stamina;
  int? jerseyNumber;
  String? skills;
  bool? isInjured;

  Player({
    required super.name,
    super.age,
    super.nationality,
    this.power,
    this.position,
    this.stamina,
    this.jerseyNumber,
    this.skills,
    this.isInjured,
  }) : super(id: _idCounter++) {
    jerseyNumber ??= _idCounter - 1;
    isInjured ??= false; // Default to not injured
  }

  // Method to display player information
  @override
  void displayInfo() {
    print("  🏃 $name (#$jerseyNumber) - ${position?.name.toUpperCase()}");
    print("    Power: $power, Age: $age, Nationality: $nationality");
    print("    Skills: $skills, Stamina: $stamina");
  }

  void reduceStamina(int amount) {
    if (stamina != null) {
      stamina = (stamina! - amount).clamp(0, 100);
    }
  }

  void receiveInjury() {
    isInjured = true;
  }

  void recoverFromInjury() {
    isInjured = false;
  }
}
