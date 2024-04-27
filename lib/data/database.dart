import 'package:todolist/model/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List<ToDo> toDoList = [];

  // Refrence the box
  final _mybox = Hive.box('mybox');

  // Method run on launc
  void createInitialData() {
    toDoList = [
      ToDo(
          id: '1', todoText: 'Buy groceries', isDone: true), // A completed task
      ToDo(id: '2', todoText: 'Go shopping', isDone: true), // A completed task
    ];
  }

  // Load data from the database
  void loadData() {
    toDoList = _mybox.get('TODOLIST');
  }

  // Update the database
  void updateData() {
    _mybox.put('TODOLIST', toDoList);
  }
}
