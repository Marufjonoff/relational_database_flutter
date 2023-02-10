import 'package:relational_database_flutter/database/dao/todo_dao.dart';
import 'package:relational_database_flutter/database/entity/todo_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'package:floor/floor.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Todo])
abstract class TodoDatabase extends FloorDatabase  {
  TodoDao get todoDao;
}