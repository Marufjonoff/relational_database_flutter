import 'package:floor/floor.dart';
import 'package:relational_database_flutter/database/entity/todo_entity.dart';

@dao
abstract class TodoDao {
  @Query('SELECT * FROM Todo')
  Future<List<Todo>> findAllTodos();

  @Query('SELECT * FROM Todo order by id desc limit 1')
  Future<Todo?> getMaxId();

  @Query('SELECT * FROM Todo order by id desc')
  Stream<List<Todo?>> streamedData();

  @insert
  Future<void> insertPerson(Todo todo);
 
  @update
  Future<void> updateTodo(Todo todo);

  @Query('SELECT * From Todo where id = :id')
  Future<void> deleteTodo(int id);

  @delete
  Future<int> deleteAll(List<Todo> list);
}