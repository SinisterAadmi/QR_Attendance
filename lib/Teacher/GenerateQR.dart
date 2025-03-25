import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_attendance/GeoLocator/geolocation.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrLocationPage extends StatefulWidget {
  @override
  _QrLocationPageState createState() => _QrLocationPageState();
}

class _QrLocationPageState extends State<QrLocationPage> {
  String? qrData;

  void _generateQrCode() async {
    try {
      // Fetch the current location
      Position position = await getCurrentLocation();
      setState(() {
        qrData = 'Lat: ${position.latitude}, Lng: ${position.longitude}';
      });
    } catch (e) {
      // Handle errors gracefully
      print('Error fetching location: $e');
      setState(() {
        qrData = 'Error fetching location';
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Code Generator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _generateQrCode,
              child: Text("Get Current Location and Generate QR Code"),
            ),
            if (qrData != null) ...[
              SizedBox(height: 20),
              QrImageView(
                data: qrData!,
                version: QrVersions.auto,
                size: 200.0,
                gapless: false,
              ),
              SizedBox(height: 20),
              Text(qrData!),
            ],
          ],
        ),
      ),
    );
  }
}
