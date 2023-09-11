// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:TodoApp/models/todo.dart';
import 'package:TodoApp/widget/counter.dart';
import 'package:TodoApp/widget/new_todo.dart';
import 'package:TodoApp/widget/todoCard.dart';
import 'package:TodoApp/widget/todo_list.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
 @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Todo> todos=[
    Todo(id: Uuid(), title: "clean room", completed: false),
    Todo(id: Uuid(), title: "pet the cat ", completed: false),
    Todo(id: Uuid(), title: "play video games ", completed: true),

  ];

  void _updateTodo(int index){
    setState(() {
      todos[index].completed =! todos[index].completed;
    });
  }

  void _showTodoModal(BuildContext context){
    showModalBottomSheet(context: context, builder:(bCtx){
      return newTodo(addTodo: _addTodo,);
    },isScrollControlled: true
    );
  }

void _addTodo(String todo){
  setState(() {
    
    todos.add(Todo(
      id:Uuid(),
      completed: false,
      title: todo

  ));
  });

}

  int _calcul(){
    var totalComplited=0;
      
    todos.forEach((todo) {
      if (todo.completed){
        totalComplited++;

      }
     });
     return totalComplited;

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children :[
          Counter(
            totalNumber: todos.length,
            validNumber: _calcul(),
          ),
          TodoList(todos: todos, updateTodo: _updateTodo)
          
          
        ] ),
      ),
    floatingActionButton: FloatingActionButton(onPressed: (
    ) {
      _showTodoModal(context);
    
    },
    child: Icon(Icons.add),),
    );
  }
}
