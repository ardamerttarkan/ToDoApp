import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
     required this.taskName,
      required this.TaskCompleted,
      required this.onChanged, 
      required this.deleteTask,
  });

  final String taskName;
  final bool TaskCompleted;
  final Function(bool?) onChanged;
  final Function(BuildContext)? deleteTask;


  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(
            top:20,
            left: 20,
            right: 20,
            bottom: 0,
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
               children: [
                SlidableAction(
                  onPressed:deleteTask,
                 icon: Icons.delete,
                 borderRadius: BorderRadius.circular(15),
                 backgroundColor: Colors.red.shade500,
                  ),
                  

               ],
               ),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade600,
                borderRadius: BorderRadius.circular(15),
            
              ),
              
              child: Row(
                children: [
                  Checkbox(
                    value: TaskCompleted,
                     onChanged: onChanged,
                     checkColor: Colors.black,
                     activeColor: Colors.white,
                     side: const BorderSide(
                       color: Colors.white,
                       width: 2,
                     ),
            
                  ),
                  Text(
                    taskName,
                   style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TaskCompleted 
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                      decorationColor: Colors.white,
                      decorationThickness: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );;
  }
}