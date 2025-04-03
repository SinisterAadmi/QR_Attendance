import 'package:flutter/material.dart';
import 'package:qr_attendance/Supabase/SupabaseTeacherSignup.dart';

class TeacherSignup extends StatefulWidget {
  const TeacherSignup({super.key});

  @override
  State<TeacherSignup> createState() => _TeacherSignupState();
}

class _TeacherSignupState extends State<TeacherSignup> {

  final _formKey = GlobalKey<FormState>();
  String _Id = '';
  String _password = '';
  String _Name = '';
  String _key = '';

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      TeacherSignUpID(context ,_Name , _Id  , _password ,_key );
    }
  }


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
                  color: Colors.white,
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25,bottom: 10),
                        child: TextFormField(
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
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onSaved: (value) => _Name = value!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25,bottom: 10),
                        child: TextFormField(
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
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onSaved: (value) => _Id = value!,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Enter your Password',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 10,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value!,
                        ),
                      ),// Default selected value



                              SizedBox(
                                height: 40,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Enter Key',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 10,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                        ),
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) => _key = value!,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed:()=> _submitForm(context),
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
                                    color: Colors.white70, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                     ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
