// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
 
 final String title;
 final bool completed;
 final Function(int) updateTodo;
 final int index;


 TodoCard({
  required this.title ,
   required this.completed,
   required this.updateTodo,
   required this.index,
   
   });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateTodo(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(20),
            height: 125,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Icon(
                    completed ? Icons.check : Icons.close,
                    color: completed ? Colors.green[600] : Colors.red ,
                    )
                
                ],
               )
              
              
              
              
              )),
      
        ),
      ),
    );
  }
}