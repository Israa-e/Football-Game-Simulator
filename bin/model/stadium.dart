import '../data/enum.dart';

class Stadium {
  // Required properties
  String name;
  String location;

  // Additional creative properties
  int? capacity;
  Weather? weather;
  int? altitude;
  String? turfType;
  bool? hasRoof;
  Stadium({
    required this.name,
    required this.location,
    this.capacity,
    this.weather,
    this.altitude,
    this.turfType,
    this.hasRoof,
  });
  // Method to display stadium information
  void displayInfo() {
    print("\n🏟️  STADIUM: $name");
    print("📍 Location: $location");
    print(
      "👥 Capacity: ${capacity.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
    );
    print("🌤️  Weather: ${weather?.name.toUpperCase()}");
    print("⛰️  Altitude: ${altitude}m");
    print("🌱 Turf: $turfType");
    print("🏠 Roof: ${hasRoof! ? 'Yes' : 'No'}");
  }

  // Weather affects game performance
  int getWeatherEffect() {
    switch (weather) {
      case Weather.sunny:
        return 0; // No effect
      case Weather.rainy:
        return -3; // Decrease performance
      case Weather.snowy:
        return -5; // Significant decrease
      case Weather.windy:
        return -2; // Slight decrease
      default:
        return 0; // Default case
    }
  }
}
