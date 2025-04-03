import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_attendance/Student/StudentButton.dart';
import 'package:qr_attendance/Teacher/TeacherButton.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Login.jpg'),
          fit: BoxFit.cover
        )
      ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35 , top: 90),
              child: Text('My Attendance' ,
                style: TextStyle(
                  fontFamily: GoogleFonts.questrial().fontFamily,
                  decoration: TextDecoration.none,
                  fontSize: 50,
                  color: Colors.white
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You are a',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),

                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Teacher(),
                    SizedBox(
                      height: 30,
                    ),
                    Student()
                  ],
                ),
              ),
            ),

          ],
        ),
    );
  }
}
