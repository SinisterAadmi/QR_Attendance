import 'package:flutter/material.dart';
import 'package:qr_attendance/Supabase/SupabaseStudentSignup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/services.dart';

class StudentSignup extends StatefulWidget {
  const StudentSignup({super.key});

  @override
  State<StudentSignup> createState() => _StudentSignupState();
}




class _StudentSignupState extends State<StudentSignup> {
  String _Year = 'FE';
  String _Division = 'A';
  final _formKey = GlobalKey<FormState>();
  String _stdId = '';
  String _password = '';
  String _fullName = '';
  int _Rollno = 0;


  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      StudentSignUpID(context , _stdId , _password , _Division ,_Year , _fullName , _Rollno);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Login.jpg') , fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(left: 20, top:100),
                child: Text('Student Signup' ,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.24 ,
                      left: 40,
                      right: 40),
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("  Select your Division", style: TextStyle(
                            fontSize: 20,
                          )),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: DropdownButton<String>(
                              dropdownColor: Colors.grey.shade200,
                              value: _Division,
                              items: ['A', 'B', 'C', 'D'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _Division = newValue;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("  Select your Year", style: TextStyle(
                            fontSize: 20,
                          )),
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: DropdownButton<String>(
                              dropdownColor: Colors.grey.shade200,
                              value: _Year,
                              items: ['FE', 'SE', 'TE', 'BE'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _Year = newValue;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
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
                          onSaved: (value) => _fullName = value!,
                        ),
                      ),Padding(
          
                        padding: const EdgeInsets.only(top: 27),
                        child: TextFormField(
          
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Enter your Roll-no',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 10,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
          
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly, // Allows digits only
                          ],
          
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            final intValue = int.tryParse(value);
                            if (intValue == null || intValue <= 0) {
                              return 'Please enter a positive integer';
                            }
                            return null;
                          },
                          onSaved: (value) => _Rollno = int.parse(value!),
          
                        ),
                      ),
          
                      Padding(
                        padding: const EdgeInsets.only(top: 27),
                        child: TextFormField(
                          decoration: InputDecoration(
          
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Enter your Student ID',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 10,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
          
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return 'Please enter your Student ID';
                            }
                            return null;
                          },
                          onSaved: (value) => _stdId = value!,
          
                        ),
                      ),
          
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Enter your Password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 10,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
          
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value!,
          
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(onPressed:()=> _submitForm(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                        ),
                        child: Container(
          
                          width: 200,
                          height: 45,
                          child: const Column(
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
      ),
    );
  }
}