import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:new_pro/controllers/todo_controller.dart';

class TodoView extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());
    final TextEditingController titleController = TextEditingController();
   TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(child: Text("Todo List", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), )),
      ),
      body: GetBuilder<TodoController>(builder: (controller){
        return ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index){
            final todo = controller.todos[index];
          return ListTile(
            title:  Text(todo.title),
            leading: Checkbox(value: todo.isCompleted, onChanged: (value){
              controller.toggleTodoStatus(todo.id);
            }
            ),
            trailing: IconButton(onPressed: ()=> controller.deleteTodo(todo.id), icon: Icon(Icons.delete),
            
            ),
          );
        },);
      }),
      floatingActionButton: FloatingActionButton(onPressed: _showAddTodoDialog, child: Icon(Icons.add),),
    );
  }
  void _showAddTodoDialog(){
  Get.defaultDialog(
    title: "A new To-Do ",
    content: TextFormField(
      controller: titleController,
      decoration: const InputDecoration(label: Text("To-Do Title")),
    ),
    textCancel: "Cancel",
    textConfirm: "Add",
    onConfirm: (){
      final inputText = titleController.text;
      if (inputText.isNotEmpty) {
        todoController.addTodo(inputText);
        Get.back();
      }
    }
  );

  }
  
}