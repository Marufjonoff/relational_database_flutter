import 'package:floor/floor.dart';
import 'package:relational_database_flutter/database/entity/todo_entity.dart';

@dao
abstract class TodoDao {
  @Query('select * from todo')
  Future<List<Todo>> findAllTodos();

  @Query('select * from todo order by id desc limit 1')
  Future<Todo?> getMaxId();

  @Query('select * from todo order by id desc')
  Stream<List<Todo?>> streamedData();

  @insert
  Future<void> insertTodo(Todo todo);
 
  @update
  Future<void> updateTodo(Todo todo);

  @Query('delete from todo where id = :id')
  Future<void> deleteTodo(int id);

  @delete
  Future<int> deleteAll(List<Todo> list);
}