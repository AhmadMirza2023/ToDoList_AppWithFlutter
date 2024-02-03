import 'package:flutter/material.dart';
import 'package:todolist_app/screens/home_screen.dart';
import 'package:todolist_app/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: 'Todo',
                style: tertiaryTextStyle.copyWith(
                  fontSize: 30,
                  fontWeight: bold,
                ),
                children: [
                  TextSpan(
                    text: 'List',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Let\'s get start your activity',
              style: secondaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: defaultMargin * 5,
            ),
            Image.asset(
              'assets/icon_calendar.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width / 2,
            ),
            SizedBox(
              height: defaultMargin * 5,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: tertiaryColor,
                fixedSize: Size(
                  defaultMargin * 4,
                  defaultMargin * 4,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Text(
                'Start',
                style: secondaryTextStyle.copyWith(
                  fontSize: defaultMargin,
                  fontWeight: semiBold,
                ),
              ),
            ),
            SizedBox(
              height: defaultMargin * 2,
            ),
            Text(
              'Created by @mirza_rafiq15',
              style: secondaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
