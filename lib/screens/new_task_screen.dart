import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist_app/theme.dart';

// ignore: must_be_immutable
class NewTaskScreen extends StatelessWidget {
  TextEditingController titleController;
  TextEditingController descController;
  VoidCallback onSave;
  NewTaskScreen({
    required this.titleController,
    required this.descController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorWhite,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Buat jadwal baru',
          style: secondaryTextStyle.copyWith(
            fontSize: defaultMargin / 1.1,
            fontWeight: medium,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: backgroundColorWhite,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Judul',
              style: primaryTextStyle.copyWith(
                fontSize: defaultMargin / 1.2,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: defaultMargin / 2,
            ),
            Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(defaultMargin / 1.8),
              ),
              child: TextFormField(
                controller: titleController,
                cursorColor: backgroundColorWhite,
                autocorrect: false,
                style: secondaryTextStyle.copyWith(
                  fontSize: defaultMargin / 1.5,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  hintText: 'Tambah tugas',
                  hintStyle: GoogleFonts.roboto(
                    color: Colors.grey.shade400,
                  ),
                  contentPadding: EdgeInsets.all(defaultMargin),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              'Deskripsi',
              style: primaryTextStyle.copyWith(
                fontSize: defaultMargin / 1.2,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: defaultMargin / 2,
            ),
            Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(defaultMargin / 1.8),
              ),
              child: TextFormField(
                controller: descController,
                style: secondaryTextStyle.copyWith(
                  fontSize: defaultMargin / 1.5,
                  fontWeight: medium,
                ),
                cursorColor: backgroundColorWhite,
                minLines: 1,
                maxLines: 10,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Tambah deskripsi tugas',
                  hintStyle: GoogleFonts.roboto(
                    color: Colors.grey.shade400,
                  ),
                  contentPadding: EdgeInsets.all(defaultMargin),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: defaultMargin * 1.5,
            ),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    defaultMargin / 1.8,
                  ),
                ),
                backgroundColor: primaryColor,
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  50,
                ),
              ),
              onPressed: onSave,
              child: Text(
                'Tambah',
                style: secondaryTextStyle.copyWith(
                  fontSize: defaultMargin / 1.5,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
