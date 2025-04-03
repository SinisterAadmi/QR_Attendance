import 'package:flutter/material.dart';
import 'package:qr_attendance/Supabase/SupabaseTeacherSignIn.dart';

class Teacherlogin extends StatefulWidget {
  const Teacherlogin({super.key});

  @override
  State<Teacherlogin> createState() => _TeacherloginState();
}

class _TeacherloginState extends State<Teacherlogin> {
  final _formKey = GlobalKey<FormState>();
  String _Id = '';
  String _password = '';
  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      signInCustomTeacherID(context, _Id, _password);
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
                  padding: EdgeInsets.only(left: 40, top:100),
                  child: Text('Teacher Login' ,
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
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4 ,
                    left: 40,
                    right: 40),
                    color: Colors.transparent,
                   child: Column(
                     children: [
                       TextFormField(
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
                             return 'Please enter your Student';
                           }
                           return null;
                         },
                         onSaved: (value) => _Id = value!,
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
                             return 'Please enter your password';
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

                             width: 100,
                             height: 50,
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
