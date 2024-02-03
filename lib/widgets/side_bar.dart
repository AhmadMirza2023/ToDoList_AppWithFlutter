import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todolist_app/theme.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColor,
      child: Column(
        children: [
          SizedBox(
            height: defaultMargin * 4,
          ),
          Text(
            'Todolist App',
            style: secondaryTextStyle.copyWith(
              fontSize: defaultMargin,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          GestureDetector(
            onTap: () {
              exit(0);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.exit_to_app,
                  color: backgroundColorWhite,
                  size: defaultMargin * 2,
                ),
                SizedBox(
                  width: defaultMargin / 10,
                ),
                Text(
                  'Keluar',
                  style: secondaryTextStyle.copyWith(
                    fontSize: defaultMargin / 1.2,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: defaultMargin * 2),
            child: Text(
              'Created by @mirza_rafiq15',
              style: secondaryTextStyle.copyWith(
                fontSize: defaultMargin / 1.8,
                fontWeight: medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
