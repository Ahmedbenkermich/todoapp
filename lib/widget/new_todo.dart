// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class newTodo extends StatefulWidget {

  final Function(String) addTodo;
  
  newTodo({required this.addTodo});

  @override
  State<StatefulWidget> createState() => _newTodoState();
}

class _newTodoState extends State<newTodo> {

  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25,right: 25,left: 25),
      height: double.infinity,
      width: double.infinity,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        TextField(
          controller: _todoController,
          decoration: InputDecoration(
            label: Text("New Todo"),
          ),
          maxLength: 40,
        ),
        TextButton(onPressed: (){
          Navigator.pop(context);
          widget.addTodo(_todoController.text);
        }, child: Text("Add"))
      ],)
      
    );
  }
}