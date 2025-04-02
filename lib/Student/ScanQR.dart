import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanner extends StatelessWidget {
  QrCodeScanner({Key? key}) : super(key: key);

  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code Scanner')),
      body: MobileScanner(
        controller: controller,
        onDetect: (BarcodeCapture capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            // Here you can handle the scanned QR code value
            print('Scanned QR Code: ${barcode.rawValue}');
            // You can also show an alert dialog or navigate to another screen with the scanned value.
          }
        },
      ),
    );
  }
}
