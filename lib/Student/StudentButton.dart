import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_attendance/Student/StudentLoginSignUp.dart';
class Student extends StatelessWidget {
  const Student({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              child: const StudentloginSignUp(),
            ),
          );
        },
        child: const SizedBox(
          width: 200,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Student" , style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20

              ),
              ),
              Icon(Icons.person ,
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
