import 'package:flutter/material.dart';
import 'package:qr_attendance/Teacher/Teacher.dart';
import 'package:qr_attendance/Teacher/TeacherLogin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGateTeacher extends StatelessWidget {
  const AuthGateTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,

        builder: (context , snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final session = snapshot.hasData ? snapshot.data!.session : null;

          if(session != null){
            return TeacherPage();
          } else {
            return Teacherlogin();
          }
        }
    );
  }
}
