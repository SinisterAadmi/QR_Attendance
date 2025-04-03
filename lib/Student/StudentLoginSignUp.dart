import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentloginSignUp extends StatelessWidget {
  const StudentloginSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/Login.jpg') , fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Student' ,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 50 ,
              color: Colors.white,
              fontFamily: GoogleFonts.questrial().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, 'student login button');
          },
            child: Container(
              width: 200,
              height: 100,
              child: const Column(
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
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, 'student signup button');
          },
            child: Container(
              width: 200,
              height: 100,
              child: const Column(
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
