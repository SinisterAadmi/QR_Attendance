import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  //Login
 Future<AuthResponse> LogInEmail (String Email , String Password) async {
   return await _supabase.auth.signInWithPassword(
       email: Email,
       password: Password);
 }


 // SignUp
  Future<AuthResponse> SignUpEmail(String Email , String Password) async {
   return await _supabase.auth.signUp(
       email: Email,
       password: Password);
  }

  //Get User data
String? getCurrentUserEmail(){
   final session = _supabase.auth.currentSession ;
   final user = session?.user;
   return user?.email;
}
}