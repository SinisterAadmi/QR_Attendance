import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:postgres/postgres.dart';

Future<void> createClassTable(String classname) async {
  final connection = PostgreSQLConnection(
    'aws-0-ap-south-1.pooler.supabase.com',
      6543,
    'postgres',
    username: 'postgres.kaskwslwxpckpqlxpizs',
    password: 'singh.pranav',
      useSSL: true
  );
  try {
    await connection.open();
    await connection.query('''
      CREATE TABLE IF NOT EXISTS class_data (
        serialno SERIAL PRIMARY KEY,
        rollno INTEGER NOT NULL,
        name TEXT NOT NULL
      );
    ''');
  } catch (e) {
    print('Error creating table: $e');
  } finally {
    await connection.close();
  }
}


Future<void> CreateClass(BuildContext context ,String TID, String Classname, String div, String year ) async {
  final supabase = Supabase.instance.client;

if (Classname.isNotEmpty ) {
  try {
    // Attempt to insert the new user into the table
    final response = await supabase.from('teacherclasses').insert(
        {'tid': TID, 'classes': Classname, 'division':div, 'year':year}
    );

    if (response == null) {
      createClassTable(Classname);
      _showSuccessPopup(context);
    } else {
      // Success

      _showErrorPopup(context, 'Error: ${response.error.message}');
    }
  } catch (e) {
    // Handle unexpected errors
    _showErrorPopup(context, 'An unexpected error occurred: $e');
  }
}else{
  _showErrorPopup(context, 'Please enter a classname');
}
}
void _showErrorPopup(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Error'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    ),
  );
}

void _showSuccessPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Success'),
      content: Text('Successfully Created Class!'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context , 'teacher'),
          child: Text('OK'),
        ),
      ],
    ),
  );
}
