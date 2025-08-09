class Person {
  String name;
  int? age;
  int id;
  String? nationality;
  Person({required this.name, this.age, this.nationality, required this.id});

  void displayInfo() {
    print('Name: $name, Age: $age, Nationality: $nationality, ID: $id');
  }
}
