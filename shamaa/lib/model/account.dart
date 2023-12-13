class Account {
  final int? id; // id is nullable
  final String? userId;
  final String name;
  final DateTime dateOfBirth;
  final String studentClass;
  final int creatureIndex;
  final int stars;

  Account({
    this.id, // Nullable
    this.userId,
    required this.name,
    required this.dateOfBirth,
    this.studentClass = '',
    this.creatureIndex = 0,
    this.stars = 0,
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as int?,
      userId: map['user_id'] as String,
      name: map['name'] as String,
      dateOfBirth: DateTime.parse(map['date_of_birth'] as String),
      studentClass: map['student_class'] as String? ?? '',
      creatureIndex: map['creature_index'] as int? ?? 0,
      stars: map['stars'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'user_id': userId,
      'name': name,
      'date_of_birth': dateOfBirth.toIso8601String(),
      'student_class': studentClass,
      'creature_index': creatureIndex,
      'stars': stars,
    };
  }

  Account copyWith({
    int? id,
    String? userId,
    String? name,
    DateTime? dateOfBirth,
    String? studentClass,
    int? creatureIndex,
    int? stars,
  }) {
    return Account(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      studentClass: studentClass ?? this.studentClass,
      creatureIndex: creatureIndex ?? this.creatureIndex,
      stars: stars ?? this.stars,
    );
  }
}
