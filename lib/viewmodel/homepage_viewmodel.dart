// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/view/homepage.dart';

abstract class HomepageViewmodel extends State<HomePage> {
  HomepageViewmodel();

  final controller = TextEditingController();
  List toDoList = [];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([controller.text, false]);
      controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void deleteAllTask() {
    setState(() {
      toDoList.clear();
    });
  }

  void checkAll() {
    setState(
      () {
        for (int i = 0; i < toDoList.length; i++) {
          toDoList[i][1] = true;
        }
      },
    );
  }
}
