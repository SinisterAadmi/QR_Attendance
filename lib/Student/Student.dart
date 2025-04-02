import 'package:flutter/material.dart';
import 'package:qr_attendance/Supabase/SupabaseStudentSignIn.dart';
import 'package:supabase_flutter/supabase_flutter.dart';




class StudentPage extends StatelessWidget {
   StudentPage({super.key});

  String id = getCurrentUserID();
  String name = getCurrentUserName();
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    final response = supabase.from('Student').select('*').eq('ID', id);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Login.jpg') , fit: BoxFit.cover)
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top:100),
              child: Text('Welcome, \n$name' ,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'qr-scan');
                  },
                  child: Text('Scan QR' ,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
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
