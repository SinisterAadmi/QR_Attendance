import 'package:qr_attendance/Student/Student.dart';
import 'package:qr_attendance/Student/StudentLogin.dart';
import 'package:qr_attendance/Student/StudentSignup.dart';
import 'package:qr_attendance/Teacher/GenerateQR.dart';
import 'package:qr_attendance/Teacher/TeacherCreateClass.dart';
import 'package:qr_attendance/Teacher/TeacherSignup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:qr_attendance/Login.dart';
import 'package:qr_attendance/Student/StudentLoginSignUp.dart';
import 'package:qr_attendance/Teacher/TeacherLogin.dart';
import 'package:qr_attendance/Teacher/TeacherLoginSignUp.dart';
import 'package:qr_attendance/Teacher/Teacher.dart';

const String serviceRoleKey = String.fromEnvironment('SERVICE_ROLE_KEY');




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://kaskwslwxpckpqlxpizs.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imthc2t3c2x3eHBja3BxbHhwaXpzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDEzNjI5MjQsImV4cCI6MjA1NjkzODkyNH0.c1BOroayoDoGKqA78AZDGyG-X34mehiXrL-yECvbLKs',
    
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context)=>LoginPage(),
      'teacher button': (context)=>TeacherloginSignUp(),
      'student button': (context)=>StudentloginSignUp(),
      'teacher login button': (context)=>Teacherlogin(),
      'student login button': (context)=>Studentlogin(),
      'teacher': (context)=>TeacherPage(),
      'teacher signup button': (context)=>TeacherSignup(),
      'student signup button': (context)=>StudentSignup(),
      'student': (context)=>StudentPage(),
      'add-class': (context)=>AddClass(),
      'qr-gen': (context)=>QrLocationPage(),
    },
  ),
  );
}


