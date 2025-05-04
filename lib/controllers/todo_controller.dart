import 'package:get/state_manager.dart';
import 'package:new_pro/models/todo_model.dart';

class TodoController extends GetxController{
  final List<Todo> todos = <Todo>[].obs;

  void addTodo(String title){
    final newTodo = Todo(id: DateTime.now().toString(), title: title, isCompleted: false);
    todos.add(newTodo);
    update();
  }

  void deleteTodo(String id){
    todos.removeWhere((todo) => todo.id == id);
    update();
  }
  void toggleTodoStatus(String id){
    final todo = todos.firstWhere((todo) => todo.id == id); 
    todo.isCompleted = !todo.isCompleted;
    update(); }
}