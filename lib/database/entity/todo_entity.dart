// entity/todo_entity.dart

import 'package:floor/floor.dart';

@entity
class Todo {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String title;
  final String body;
  final String createdAt;

  @ignore
  bool isSelected = false;

  Todo(this.id, this.title, this.body, this.createdAt);
}