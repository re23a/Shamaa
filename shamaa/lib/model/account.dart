class Account {
  final int id;
  final String userId;
  final String name;
  final DateTime dateOfBirth;
  final String studentClass;
  final int creatureIndex;
  final int stars;

  Account({
    required this.userId,
    required this.id,
    required this.name,
    required this.dateOfBirth,
    this.studentClass = '',
    this.creatureIndex = 0,
    this.stars = 0,
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      userId: map['user_id'],
      name: map['name'],
      dateOfBirth: DateTime.parse(map['date_of_birth']),
      studentClass: map['student_class'] ?? '',
      creatureIndex: map['creature_index'] ?? 0,
      stars: map['stars'] ?? 0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'date_of_birth': dateOfBirth.toIso8601String(),
      'student_class': studentClass,
      'creature_index': creatureIndex,
      'stars': stars,
    };
  }
}
