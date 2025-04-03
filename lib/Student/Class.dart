import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_attendance/GeoLocator/Qrdatasplitter.dart';
import 'package:qr_attendance/GeoLocator/comparelocation.dart';
import 'package:qr_attendance/Student/ScanQR.dart';
import 'package:qr_attendance/Supabase/SupabaseMarkAttendance.dart';
import 'package:qr_attendance/Supabase/SupabaseStudentSignIn.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../GeoLocator/geolocation.dart';




class FinalPage extends StatelessWidget {
  FinalPage({super.key});

  int _rollnoofstudent = getCurrentRoll();
  String name = getCurrentUserName();
  final supabase = Supabase.instance.client;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Login.jpg') , fit: BoxFit.cover)
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top:100),
              child: Text('Class, \n$name' ,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  Position stdlocation = await getCurrentLocation();
                  print('${stdlocation.longitude} , ${stdlocation.latitude}');
                  splitQrData(getQRvalue());
                  if(comparelocation(stdlocation.latitude, stdlocation.longitude, getQRlat(), getQRlng())){
                    markAttendance(getQRclassn(), getQRcurrentDate(), _rollnoofstudent);
                    Navigator.pushNamed(context, 'student');
                  }
                  else{
                    _showErrorPopup(context);
                  }

                },
                child: Text('Mark my Attendance' ,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}



void _showErrorPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Error'),
      content: Text('You are more than 100 meters away from the QR code'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    ),
  );
}