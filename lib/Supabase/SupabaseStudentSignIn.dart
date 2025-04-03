import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String _currentID = '';
void setCurrentUserID(String Id){
  _currentID = Id;
}

String getCurrentUserID(){
  return _currentID;
}

String _currentName = 'hahah';
void setCurrentUserName(String Name){
  _currentName = Name;
}

String getCurrentUserName(){
  return _currentName;
}

int _currentRoll = 0;
void setCurrentRoll(int Roll){
  _currentRoll = Roll;
}
int getCurrentRoll(){
  return _currentRoll;
}


Future<void> signInCustomID(BuildContext context ,String customID, String password) async {
  final supabase = Supabase.instance.client;
  final response = await supabase
      .from('student')
      .select('*')
      .eq('id', customID);

  if (response != null && response.length > 0) {
    final  userID = response[0]['id'];
    final storedPassword = response[0]['password'];
    String userName = response[0]['name'];
    int rollNo = response[0]['roll no'];

    if(password == storedPassword){
      setCurrentUserID(userID);
      setCurrentUserName(userName);
      setCurrentRoll(rollNo);
      _showSuccessPopup(context);

    }else{
      _showErrorWrongPasswordPopup(context);
    }
  }else{
    _showErrorPopup(context);
  }



}

void _showErrorPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Error'),
      content: Text('User not Found'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    ),
  );
}

void _showErrorWrongPasswordPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Error'),
      content: Text('Incorrect Password'),
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
      content: Text('User Logged In Successfully'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context,'student'),
          child: Text('OK'),
        ),
      ],
    ),
  );
}

