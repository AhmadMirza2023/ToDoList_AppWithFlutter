import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist_app/data/database.dart';
import 'package:todolist_app/screens/new_task_screen.dart';
import 'package:todolist_app/theme.dart';
import 'package:todolist_app/widgets/side_bar.dart';
import 'package:todolist_app/widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _mybox = Hive.box('mybox');
  TodolistDatabase db = TodolistDatabase();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _newTitleController = TextEditingController();
  final TextEditingController _newDescController = TextEditingController();

  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void deleteTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
      db.updateData();
    });
  }

  void saveNewTask(int index) {
    setState(() {
      db.todolist[index][0] = _newTitleController.text;
      db.todolist[index][1] = _newDescController.text;
      db.updateData();
    });
  }

  void createNewTask() {
    setState(() {
      db.todolist.add([_titleController.text, _descController.text, false]);
    });
    _titleController.clear();
    _descController.clear();
    Navigator.of(context).pop();
    db.updateData();
  }

  void onCheckBoxChanged(bool? value, int index) {
    setState(() {
      db.todolist[index][2] = !db.todolist[index][2];
      db.updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      backgroundColor: backgroundColorWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: backgroundColorWhite),
            pinned: true,
            backgroundColor: primaryColor,
            expandedHeight: MediaQuery.of(context).size.height / 3,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: defaultMargin / 1.5),
                  child: Image.asset(
                    'assets/icon_people.png',
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
              ),
              title: Text(
                'Selamat Datang👋',
                style: secondaryTextStyle.copyWith(
                  fontSize: defaultMargin,
                  fontWeight: semiBold,
                ),
              ),
              centerTitle: false,
              titlePadding: EdgeInsets.only(
                left: defaultMargin * 2.5,
                bottom: defaultMargin / 2,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: db.todolist.length,
              (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    top: index == 0 ? defaultMargin : 0,
                    bottom: index == db.todolist.length - 1
                        ? defaultMargin * 2
                        : defaultMargin / 1.5,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: ToDoTile(
                    taskTitle: db.todolist[index][0],
                    taskDescription: db.todolist[index][1],
                    taskCompleted: db.todolist[index][2],
                    onPressed: (value) => onCheckBoxChanged(value, index),
                    newTitleController: _newTitleController,
                    newDescController: _newDescController,
                    onNewSave: saveNewTask,
                    index: index,
                    functionDeleteTask: deleteTask,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewTaskScreen(
                titleController: _titleController,
                descController: _descController,
                onSave: createNewTask,
              ),
            ),
          );
        },
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          color: backgroundColorWhite,
        ),
      ),
    );
  }
}
