class Student {
  final int id;
  final String name;
  final String email;
  final Map<String, double> grades;

  const Student({
    required this.id,
    required this.name,
    required this.email,
    this.grades = const {},
  });

  // Середня оцінка студента
  double get averageGrade {
    if (grades.isEmpty) return 0.0;

    final total = grades.values.reduce((a, b) => a + b);
    return total / grades.length;
  }

  // Створення Student з JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      grades: (json['grades'] as Map<String, dynamic>? ?? {}).map(
        (key, value) => MapEntry(key, (value as num).toDouble()),
      ),
    );
  }

  // Перетворення Student у JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'grades': grades};
  }

  // Створення копії студента зі зміненими полями
  Student copyWith({
    int? id,
    String? name,
    String? email,
    Map<String, double>? grades,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      grades: grades ?? this.grades,
    );
  }
}
