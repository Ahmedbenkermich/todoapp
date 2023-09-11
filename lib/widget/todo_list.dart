import 'package:flutter/material.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/widget/todoCard.dart';

class TodoList extends StatelessWidget {

  final List<Todo> todos;
  final Function(int) updateTodo;

  TodoList({
    required this.todos,
    required this.updateTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, i){
          return TodoCard(title: todos[i].title, completed:todos[i].completed, updateTodo: updateTodo, index: i);


        },
        
        itemCount: todos.length,
        ),
    );
  }
}