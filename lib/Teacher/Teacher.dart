import 'package:flutter/material.dart';
import 'package:qr_attendance/Supabase/SupabaseCreateClass.dart';
import 'package:qr_attendance/Supabase/SupabaseTeacherSignIn.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';

String? classname;
void setCurrentClass(String? value){
  classname = value;
}

String? getCurrentClass(){
  return classname;
}

String _currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

class TeacherPage extends StatefulWidget {
  TeacherPage({super.key});

  @override
  State<TeacherPage> createState() => _TeacherState();
}

class _TeacherState extends State<TeacherPage> {
  String? selectedClass;
  List<String> classes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchClasses().then((value) {
      setState(() {
        classes = value;
        isLoading = false;
      });
    });
  }

  Future<List<String>> fetchClasses() async {
    final supabase = Supabase.instance.client;
    final response = await supabase
        .from('teacherclasses')
        .select('classes')
        .eq('tid', getCurrentTeacherID()); // Replace with actual tid

    final List<String> classes = response.map((item) => item['classes'] as String).toList();
    return classes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Login.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 150, top: 300),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'add-class');
              },
              child: Icon(Icons.add),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, top: 70),
            child: Text(
              'Take Attendance',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 55, top: 375),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : DropdownButton<String>(
                  dropdownColor: Colors.grey.shade100,
                  value: selectedClass,
                  items: classes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            color : Colors.black54
                            ,fontSize: 30),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {

                      selectedClass = newValue;
                      setCurrentClass(selectedClass);
                    });
                  },
                  hint: Text(
                    '  Select the class',
                    style: TextStyle(
                        fontSize: 30,
                    color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 85, top: 600),
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'qr-gen');
                },
                child: Text('Generate QR'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
