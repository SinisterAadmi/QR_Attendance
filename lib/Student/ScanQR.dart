import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanner extends StatelessWidget {
  QrCodeScanner({Key? key}) : super(key: key);

  final MobileScannerController controller = MobileScannerController();
  bool _isDialogOpen = false; // Flag to track dialog state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code Scanner')),
      body: MobileScanner(
        controller: controller,
        onDetect: (BarcodeCapture capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            if (barcode.rawValue != null && !_isDialogOpen) {
              _isDialogOpen = true;
              final String qrCode = barcode.rawValue!;

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Scanned Successfully"),
                  content: Text("QR Code: $qrCode"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close
                        Navigator.pushNamed(context, 'finalStudent');
                        _isDialogOpen = false;
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
              break;
            }
          }
        },
      ),
    );
  }
}
