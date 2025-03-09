import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_attendance/Teacher/Teacher.dart';

class Teacherlogin extends StatefulWidget {
  const Teacherlogin({super.key});

  @override
  State<Teacherlogin> createState() => _TeacherloginState();
}

class _TeacherloginState extends State<Teacherlogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Login.jpg') , fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

          body: Stack(
            children: [
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.only(left: 40, top:100),
                child: const Text('Teacher Login' ,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5 ,
                  left: 40,
                  right: 40),
                  color: Colors.transparent,
                 child: Column(
                   children: [
                     TextField(
                       decoration: InputDecoration(
                         fillColor: Colors.grey.shade200,
                         filled: true,
                         hintText: 'Enter your E-mail',
                         border: OutlineInputBorder(
                           borderSide: const BorderSide(
                             width: 10,
                           ),
                           borderRadius: BorderRadius.circular(10)
                         )
                       ),
                     ),
                     const SizedBox(
                       height: 40,
                     ),
                     TextField(
                       obscureText: true,
                         decoration: InputDecoration(
                             fillColor: Colors.grey.shade200,
                             filled: true,
                             hintText: 'Enter your Password',
                             border: OutlineInputBorder(
                                 borderSide: const BorderSide(
                                   width: 10,
                                 ),
                                 borderRadius: BorderRadius.circular(10)
                             )
                         ),
                     ),
                     const SizedBox(
                       height: 40,
                     ),
                     ElevatedButton(onPressed: (){
                       Navigator.push(
                         context,
                         PageTransition(
                           type: PageTransitionType.rightToLeftWithFade,
                           child: const TeacherPage(),
                         ),
                       );
                     },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.cyan,
                       ),
                         child: const SizedBox(

                           width: 200,
                           height: 100,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("LOGIN" , style: TextStyle(
                                   color: Colors.black87,
                                   fontSize: 20

                               ),
                               ),
                             ],
                           ),
                         ),
                     ),
                   ],
                 ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
