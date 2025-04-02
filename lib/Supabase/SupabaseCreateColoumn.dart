import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> addColumnsToClassTable(String? classname, String? date) async {
  final supabase = Supabase.instance.client;

  try {
    // Call the RPC function to create the table
    final response = await supabase.rpc('add_column_to_table', params: {
      '_tablename': classname,
      '_columnname': date
    });

    if (response.error != null) {
      print('Error adding column: ${response.error.message}');
    } else {
      print('Table created successfully!');
    }
  } catch (e) {
    print('Error adding column: $e');
  }
}
