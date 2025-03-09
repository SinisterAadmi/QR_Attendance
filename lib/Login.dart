import 'package:flutter/material.dart';
import 'package:qr_attendance/Student/StudentButton.dart';
import 'package:qr_attendance/Teacher/TeacherButton.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Login.jpg'),
          fit: BoxFit.cover
        )
      ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35 , top: 90),
              child: const Text('My Attendance' ,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
            const Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You are a',
                      style: TextStyle(
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
