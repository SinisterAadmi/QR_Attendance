import 'package:flutter/material.dart';

class TeacherSignup extends StatefulWidget {
  const TeacherSignup({super.key});

  @override
  State<TeacherSignup> createState() => _TeacherSignupState();
}

class _TeacherSignupState extends State<TeacherSignup> {

  // List <String> year = ['FE', 'SE', 'TE', 'BE'];
  // List <String> division = ['A', 'B', 'C', 'D', 'E'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Login.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(left: 20, top: 100),
              child: Text(
                'Teacher SignUp',
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
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28,
                    left: 40,
                    right: 40),
                color: Colors.transparent,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25,bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(

                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Enter your Name',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 10,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25,bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(

                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Enter your Teacher ID',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 10,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Enter your Password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 10,
                                ),
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),// Default selected value



            SizedBox(
              height: 40,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Enter Key',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 10,
                              ),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                      ),
                      child: Container(
                        width: 200,
                        height: 45,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
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
