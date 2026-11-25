# Student Grading System

## Структура проєкту

```text
P_12_1/
│
├── lib/
│   ├── main.dart
│   │
│   ├── models/
│   │   └── student.dart
│   │
│   ├── repositories/
│   │   └── student_repository.dart
│   │
│   └── services/
│       ├── grade_calculator.dart
│       └── course_manager.dart
│
├── test/
│   └── unit/
│       ├── models/
│       │   └── student_test.dart
│       │
│       └── services/
│           ├── grade_calculator_test.dart
│           └── course_manager_test.dart
│
├── pubspec.yaml
└── README.md
```

## Опис файлів
### Основні файли (lib)

| Файл | Призначення |
|---|---|
| main.dart | Точка входу в мобільний застосунок. |
| models/student.dart | Модель студента, яка містить ID, ім'я, електронну пошту та оцінки. Реалізує методи fromJson(), toJson(), copyWith() і властивість averageGrade. |
| repositories/student_repository.dart | Абстрактний репозиторій для отримання, збереження та перегляду даних студентів. |
| services/grade_calculator.dart | Клас для розрахунку середньої оцінки, GPA, буквеної оцінки та перевірки прохідного бала. |
| services/course_manager.dart | Клас для додавання оцінок, формування звітів і визначення найкращих студентів. |

### Файли тестування
| Файл | Призначення |
|---|---|
| student_test.dart | Перевірка моделі Student. |
| grade_calculator_test.dart | Перевірка методів класу GradeCalculator. |
| course_manager_test.dart | Перевірка методів класу CourseManager із використанням мокування StudentRepository. |

### Student Model Tests - 5 тестів

Перевіряються:
1. Коректне створення об'єкта Student із JSON.
2. Коректне перетворення об'єкта Student у JSON.
3. Зміна даних студента за допомогою copyWith().
4. Правильне обчислення середньої оцінки.
5. Повернення 0.0, якщо список оцінок порожній.

### GradeCalculator Tests - 15 тестів
calculateAverage():
1. Обчислення середньої оцінки.
2. Обробка порожнього списку.
3. Обробка списку, в якому всі оцінки дорівнюють нулю.
4. Відхилення оцінок, більших за 100.

calculateGPA():
5. Оцінка 90 відповідає GPA 4.0.
6. Оцінка 75 відповідає GPA 3.0.
7. Оцінка 60 відповідає GPA 2.0.
8. Обробка порожнього списку.
9. Обробка оцінок, які дорівнюють нулю.

getLetterGrade():
10. Оцінка 95 відповідає літері A.
11. Оцінка 80 відповідає літері B.
12. Оцінка 40 відповідає літері F.

isPassingGrade():
13. Оцінка 60 є прохідною.
14. Оцінка 59 є непрохідною.
15. Оцінка 0 є непрохідною.

### CourseManager Tests - 8 тестів

addGrade():
1. Успішне додавання оцінки студенту.
2. Обробка ситуації, коли студент не існує.
3. Відхилення оцінки, більшої за 100.

getStudentReport():
4. Успішне отримання звіту студента.
5. Обробка ситуації, коли студент не існує.

getTopStudents():
6. Отримання найкращих студентів із сортуванням за середнім балом.
7. Повернення порожнього списку, якщо кількість студентів дорівнює нулю.
8. Відхилення від'ємного значення кількості студентів.

## Правила оцінювання
У GradeCalculator використовується така шкала переведення відсотків у GPA:
| Відсоткова оцінка | GPA | Буквена оцінка |
|---|---|---|
| 90–100 | 4.0 | A |
| 75–89 | 3.0 | B |
| 60–74 | 2.0 | C |
| 50–59 | 1.0 | D |
| 0–49 | 0.0 | F |

## Інструкція із запуску
flutter pub get
flutter run
flutter test
flutter test test/unit/models/student_test.dart
flutter test test/unit/services/grade_calculator_test.dart
flutter test test/unit/services/course_manager_test.dart

## AI
Під час виконання ШІ не був використовуваний.
