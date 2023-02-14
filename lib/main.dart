import 'package:flutter/material.dart';
import 'package:relational_database_flutter/pages/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.grey.shade50
        ),
        scaffoldBackgroundColor: Colors.grey.shade50
      ),
      home: TodosPage(),
    );
  }
}
