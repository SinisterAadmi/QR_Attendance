
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> StudentSignUpID(BuildContext context ,String ID, String password , String Div , String Year , String Name , int Roll  ) async {
  final supabase = Supabase.instance.client;


  try {
    // Attempt to insert the new user into the table
    final response = await supabase.from('Student').insert([
      {'ID' : ID , 'Password' : password , 'Year' : Year , 'Division' : Div , 'Name' : Name , 'ROLL no' : Roll}
    ]);

    if (response.error != null) {
      // Handle error (e.g., duplicate key)
      if (response.error!.message.toLowerCase().contains('duplicate') ||
          response.error!.message.toLowerCase().contains('unique') ||
          response.error!.code == '23505') {
        _showErrorPopup(context , 'Custom ID already exists. Please choose another ID.');
      } else {
        _showErrorPopup(context , 'Error: ${response.error!.message}');
      }
    } else {
      // Success
      print('User signed up successfully');
    }
  } catch (e) {
    // Handle unexpected errors
    _showErrorPopup(context , 'An unexpected error occurred: $e');
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

