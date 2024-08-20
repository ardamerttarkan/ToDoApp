import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/utils/todo_list.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [];

  void checkBoxChanged(int index){
   setState(() {
      toDoList[index][1] = !toDoList[index][1];
   });

  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      appBar: AppBar(
        title: const Text('Görev Listesi'
      ),
      backgroundColor: Colors.green.shade800,
      centerTitle: true,
      foregroundColor: Colors.white,
      ),
      body:ListView.builder(
        itemCount: toDoList.length,
         itemBuilder: (BuildContext context, index){
        return TodoList(
          taskName: toDoList[index][0],
          TaskCompleted: toDoList[index][1],
          onChanged: (value) => checkBoxChanged(index),
          deleteTask: (context) => deleteTask(index),

      

          
        );
      },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Yeni Görev Ekle',
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green.shade800,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green.shade800,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          )),
          FloatingActionButton(
            onPressed:saveNewTask,
            backgroundColor: Colors.green.shade800,
            child: const Icon(Icons.add)
          ),
        ],
      ),
    );

  }
}