import 'package:flutter/material.dart';
import 'package:todolist_app/theme.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final bool taskCompleted;
  Function(bool?)? onPressed;
  TextEditingController newTitleController;
  TextEditingController newDescController;
  Function(int) onNewSave;
  final int index;
  Function(int) functionDeleteTask;
  ToDoTile({
    super.key,
    required this.taskTitle,
    required this.taskCompleted,
    required this.taskDescription,
    required this.onPressed,
    required this.newTitleController,
    required this.newDescController,
    required this.onNewSave,
    required this.index,
    required this.functionDeleteTask,
  });

  @override
  Widget build(BuildContext context) {
    void modalEditTask() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: tertiaryColor,
            content: Container(
              width: MediaQuery.of(context).size.width - (2 * defaultMargin),
              height: 385,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultMargin / 2),
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: newTitleController,
                    autocorrect: false,
                    // initialValue: taskTitle,
                    cursorColor: primaryTextColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultMargin / 2),
                        borderSide: BorderSide(
                          color: primaryTextColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultMargin / 2),
                        borderSide: BorderSide(
                          color: primaryTextColor,
                        ),
                      ),
                    ),
                    style: primaryTextStyle.copyWith(
                      fontSize: defaultMargin,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: defaultMargin - 10,
                  ),
                  TextFormField(
                    controller: newDescController,
                    autocorrect: false,
                    cursorColor: primaryTextColor,
                    // initialValue: taskDescription,
                    maxLines: 7,
                    style: primaryTextStyle.copyWith(
                      fontSize: defaultMargin / 1.4,
                      fontWeight: medium,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultMargin / 2),
                        borderSide: BorderSide(color: primaryTextColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(defaultMargin / 2),
                        borderSide: BorderSide(color: primaryTextColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: defaultMargin / 2,
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultMargin / 2),
                          ),
                          fixedSize: Size(
                            defaultMargin * 4,
                            defaultMargin,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Kembali',
                          style: secondaryTextStyle.copyWith(
                            fontSize: defaultMargin / 2,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: defaultMargin / 2,
                      ),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultMargin / 2),
                            ),
                          ),
                          onPressed: () {
                            onNewSave(index);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Simpan',
                            style: secondaryTextStyle.copyWith(
                              fontSize: defaultMargin / 2,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width - (2 * defaultMargin),
      height: defaultMargin * 5.5,
      decoration: BoxDecoration(
        color: taskCompleted == false ? tertiaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(defaultMargin / 2),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: defaultMargin / 2,
        ),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onPressed),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: primaryTextStyle.copyWith(
                    fontSize: defaultMargin / 1.2,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: defaultMargin / 1.1,
                ),
                Container(
                  width: 300,
                  child: Text(
                    taskDescription,
                    style: primaryTextStyle.copyWith(
                      fontSize: defaultMargin / 1.8,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: defaultMargin * 9,
                    ),
                    IconButton(
                      onPressed: modalEditTask,
                      icon: Icon(
                        Icons.edit,
                        color: primaryTextColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        functionDeleteTask(index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: primaryTextColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
