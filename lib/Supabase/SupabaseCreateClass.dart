import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



Future<void> createClassTable(String classname, String div, String year) async {
  final supabase = Supabase.instance.client;

  try {
    // Call the RPC function to create the table
    final response = await supabase.rpc('create_class_table', params: {
      '_classname': classname,
      '_div': div,
      '_year': year
    });

    if (response.error != null) {
      print('Error creating table: ${response.error.message}');
    } else {
      print('Table created successfully!');
    }
  } catch (e) {
    print('Error creating table: $e');
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
      createClassTable(Classname , div , year);
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




