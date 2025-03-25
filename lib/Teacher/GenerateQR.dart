import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GenerateQRCode extends StatefulWidget {
  final String date;
  final String name;

  GenerateQRCode({required this.date, required this.name});

  @override
  _GenerateQRCodeState createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  Position? qrPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      qrPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {}); // Update the UI after getting the location
    } catch (e) {
      print('Error getting location: $e');
      // Handle error (e.g., show a message to the user)
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if the position is null and show a loading indicator if it is
    if (qrPosition == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Generate QR Code')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Create a string in the format "id~name"
    String data = '${widget.date}~${widget.name}~${qrPosition!.latitude}~${qrPosition!.longitude}';

    return Scaffold(
      appBar: AppBar(title: Text('Generate QR Code')),
      body: Center(
        child: QrImageView(
          data: data,
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}
