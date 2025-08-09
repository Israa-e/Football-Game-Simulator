import 'person.dart';

class Trainer extends Person {
  static int _idCounter = 1;
  int? experience;

  // Additional creative properties
  String? strategySpecialty;
  int? motivation;

  Trainer({
    required super.name,
    required super.nationality,
    this.experience,
    this.strategySpecialty,
    this.motivation,
    super.age,
  }) : super(id: _idCounter++) {
    experience ??= 0;
  }
  // Method to display trainer information
  @override
  void displayInfo() {
    print("  🧑‍🏫 $name - ${super.name.toUpperCase()}");
    print("    Age: ${super.age}, Nationality: ${super.nationality}");
    print("   Experience: $experience years, Specialty: $strategySpecialty");
  }

  int getMotivationBonus() {
    return (motivation ?? 0 * 0.1).round();
  }
}
