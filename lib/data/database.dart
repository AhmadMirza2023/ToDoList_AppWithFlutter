import 'package:hive_flutter/hive_flutter.dart';

class TodolistDatabase {
  List todolist = [];
  final _mybox = Hive.box('mybox');

  void createInitialData() {
    todolist = [
      [
        'Tugas 1',
        'Belajar Kalkulus',
        false,
      ],
      [
        'Tugas 2',
        'Belajar Algoritma Pemrograman',
        true,
      ],
    ];
  }

  void loadData() {
    todolist = _mybox.get('TODOLIST');
  }

  void updateData() {
    _mybox.put('TODOLIST', todolist);
  }
}
