import 'package:flutter/material.dart';
import 'package:qr_attendance/Supabase/SupabaseCreateClass.dart';
import 'package:qr_attendance/Supabase/SupabaseTeacherSignIn.dart';

class AddClass extends StatefulWidget {
  const AddClass({super.key});

  @override
  State<AddClass> createState() => _AddClassState();
}
final _formKey = GlobalKey<FormState>();
String _currenttid = getCurrentTeacherID();
String _createdClass ='';
String _div ='';
String _year ='';
void _submitForm(BuildContext context) async {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    CreateClass(context, _currenttid, _createdClass, _div, _year);
  }
}

class _AddClassState extends State<AddClass> {
  @override






  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Login.jpg') , fit: BoxFit.cover )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 35 , top: 150 , right: 35),
                child: TextFormField(
                  decoration: InputDecoration(

                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Enter Class Name',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 10,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'Please enter Class name';
                    }
                    return null;
                  },
                  onSaved: (value) => _createdClass = value!,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 35 , top: 250 , right: 35),
                child: TextFormField(
                  decoration: InputDecoration(

                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Enter Year of class',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 10,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'Please enter Class name';
                    }
                    return null;
                  },
                  onSaved: (value) => _year = value!,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 35 , top: 350 , right: 35),
                child: TextFormField(
                  decoration: InputDecoration(

                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Enter Division of class',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 10,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'Please enter Class name';
                    }
                    return null;
                  },
                  onSaved: (value) => _div = value!,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 125 , top: 450),
                child: ElevatedButton(
                    onPressed:(){
                      _submitForm(context);
                    },
                    child: Text('Add Class')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
