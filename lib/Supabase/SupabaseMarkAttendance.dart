import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> markAttendance(String classname, String date, int rollno) async {
  final supabase = Supabase.instance.client;

  try {
    // Call the RPC function to create the table
    final response = await supabase.rpc('mark_attendance', params: {
      '_tablename': classname,
      '_columnname': date,
      '_rollno': rollno
    });

    if (response.error != null) {
      print('Error marking attendance: ${response.error.message}');
    } else {
      print('Attendance marked successfully!');
    }
  } catch (e) {
    print('Error marking attendance: $e');
  }
}
