import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
   const TeacherPage({super.key});


  @override
  State<TeacherPage> createState() => _TeacherState();
}

class _TeacherState extends State<TeacherPage> {
  String? SelectedClass;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/Login.jpg') , fit: BoxFit.cover )
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 25 , top: 50),
            child: const Text('Take Attendance' ,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 40 ,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 80 , top: 300),
            child: Scaffold(
              backgroundColor: Colors.transparent,
            body:Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black , width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                  value: SelectedClass,
                  items: <String>[
                    'SE_B_EM4'
                  ].map<DropdownMenuItem<String>>((String value){
                   return DropdownMenuItem<String>(
                     value: value,
                       child: Text(value,
                       style: const TextStyle(
                         fontSize: 30,
                       ),
                       ),
                   );
                  }
                  ).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      SelectedClass = newValue ;
                    });
                  },
                hint: const Text('  Select the class',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                        ),
            ),
          ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 105 , top: 500),
            child: Container(

              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black , width: 2),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(

                ),
                  onPressed: (){}, 
                  child: const Text('Generate QR')
              ),
            ),
          ),
        ],
      ),
    );
  }
}

