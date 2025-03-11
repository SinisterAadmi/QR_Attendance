import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_attendance/Student/StudentLogin.dart';
import 'package:qr_attendance/Student/StudentSignup.dart';
class StudentloginSignUp extends StatelessWidget {
  const StudentloginSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Login.jpg') , fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Student' ,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 50 ,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: const Studentlogin(),
              ),
            );
          },
            child: const SizedBox(
              width: 200,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login" , style: TextStyle(
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
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: const StudentSignup(),
              ),
            );
          },
            child: const SizedBox(
              width: 200,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign-Up" , style: TextStyle(
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
          )
        ],
      ),
    );
  }
}
