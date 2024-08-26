import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grpc_client/gen/helloword.pbgrpc.dart';
import 'package:grpc_client/utils/util.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

Utils utils = Utils();

class QRScannerPage extends StatefulWidget {
  QRScannerPage({super.key}) {
    log('QRScannerPage initialized');
  }

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final stub = utils.getServerRef();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  String qrText = '';
  bool _isProcessing = false;
  bool _isApiCallInProgress = false;
  // late MobileScannerController controller;
  // StreamSubscription<Object?>? _subscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Scanner')),
      body: Center(
        // For testing purpose you can use this button to send data to server
        //   child: ElevatedButton(
        //     onPressed: () async {
        //       _onQRViewCreated("ANKIT_MANIYA");
        //     },
        //     child: const Text('SEND DATA TO SERVER'),
        //   ),
        // ),

        // To test with the QR code scanner use the below code
        child: MobileScanner(onDetect: (capture) {
          if (_isApiCallInProgress) return;
 
          final List<Barcode> barcodes = capture.barcodes;
          log("calling onDetect");
          for (final barcode in barcodes) {
            log(barcode.rawValue ?? "No Data found in QR");

            // Process only if not already processing
            if (!_isProcessing &&
                !_isApiCallInProgress &&
                barcode.rawValue != null) {
              _isProcessing =
                  true; // Set flag to true to prevent further processing

              qrText = barcode.rawValue.toString();
              _onQRViewCreated(qrText);
              break;
            }
          }
        }),
      ),
    );
  }

  void _onQRViewCreated(String rawValue) async {
    // Exit if an API call is already in progress
    if (_isApiCallInProgress) return;

    setState(() {
      _isApiCallInProgress = true; // Set flag to indicate API call in progress
    });
    // final MobileScannerController controller = MobileScannerController();
    // this.controller = controller;

    log("stub $stub");

    final response =
        await stub.invokeQRCodeScan(QRScanRequest(requestId: '12345'));

    log(response.status);
    if (response.status == 'SCAN_STARTED') {
      // // We are not using the controller to scan the QR code in this example but you can use it to scan the QR code
      // log('QR Code detected From Scan QR code screen!');

      _showLoadingDialog(context);

      // Simulate a QR code scan
      await Future.delayed(const Duration(seconds: 2));

      await sendQRCodeData(rawValue, context);

      if (mounted) {
        Navigator.pop(context); // Ensure the widget is still mounted
        Navigator.pop(context); // Ensure the widget is still mounted
      }
    }

    setState(() {
      _isProcessing = false;
      _isApiCallInProgress = false;
    });
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<void> sendQRCodeData(String qrCodeData, BuildContext context) async {
    final response = await stub.sendQRCodeData(QRCodeData(
      qrCode: qrCodeData,
      requestId: '12345',
    ));
    if (response.status == 'DATA_RECEIVED') {
      log('QR Code data sent successfully');
    }
  }
}
