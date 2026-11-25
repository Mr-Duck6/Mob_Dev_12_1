import 'package:flutter/material.dart';

void main() {
  runApp(const StudentGradingApp());
}

class StudentGradingApp extends StatelessWidget {
  const StudentGradingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Grading System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Student Grading System', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
