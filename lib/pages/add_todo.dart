import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relational_database_flutter/database/database.dart';
import 'package:relational_database_flutter/database/entity/todo_entity.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _bodyEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextField(
                controller: _bodyEditingController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
                onPressed: () {
                  final database = $FloorTodoDatabase.databaseBuilder("todo.db").build();
                  database.then((value) {
                    value.todoDao.getMaxId().then((val) {
                      int id = 1;
                      if (val != null) id = val.id + 1;
                      value.todoDao.insertPerson(Todo(id,
                          _textEditingController.text,
                          _bodyEditingController.text,
                          DateFormat('dd-mm-yyyy kk:mm').format(DateTime.now())));
                    });
                  });
                 Navigator.pop(context, true);
                },
                child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}
