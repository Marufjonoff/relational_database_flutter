import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relational_database_flutter/database/dao/todo_dao.dart';
import 'package:relational_database_flutter/database/database.dart';
import 'package:relational_database_flutter/database/entity/todo_entity.dart';
import 'package:relational_database_flutter/pages/add_todo.dart';

class HomePage extends StatefulWidget {
  final String homeTitle;
  List<Todo> todoList = [];
  TodoDao? todoDao;

  final database = $FloorTodoDatabase.databaseBuilder("todo.db").build();

  HomePage({Key? key, required this.homeTitle}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.homeTitle),
      ),
      body: FutureBuilder(
        future: _callTodo(),
        builder: (BuildContext context, AsyncSnapshot<TodoDao> snapshot) {
          if(!snapshot.hasData || snapshot.connectionState == ConnectionState.none) {
            return const CupertinoActivityIndicator();
          } else {
            return StreamBuilder(
              stream: snapshot.data!.streamedData(),
              builder: (BuildContext context, AsyncSnapshot<List<Todo?>> snapshot) {
                if(!snapshot.hasData || snapshot.connectionState == ConnectionState.none) {
                  return const CupertinoActivityIndicator();
                } else {
                  if(snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text("No Data Found"),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          snapshot.data![index]!.title
                        ),
                      );
                    },
                  );
                }
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTodo,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  _openAddTodo() async {
    final res = await Navigator.push(context, CupertinoPageRoute(builder: (_) => AddTodoPage()));
    if(res != null) {
        setState(() {});
    }
  }

  Future<TodoDao> _callTodo() async {
    TodoDatabase todoDatabase = await widget.database;
    widget.todoDao = todoDatabase.todoDao;

    return todoDatabase.todoDao;
  }
}
