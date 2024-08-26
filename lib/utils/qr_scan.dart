import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grpc_client/gen/helloword.pbgrpc.dart';
import 'package:grpc_client/utils/util.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

Utils utils = Utils();

class QRScannerPage extends StatefulWidget {
  final CameraClient client;

  const QRScannerPage({super.key, required this.client});

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Scanner')),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      final qrCode = scanData.code;
      log('QR Code detected: $qrCode');

      // Send the QR code data back to the server
      if (qrCode != null) {
        await widget.client.sendQRCodeData(qrCode, context);
        if (mounted) {
          Navigator.pop(context); // Ensure the widget is still mounted
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class CameraClient {
  final stub = utils.getServerRef();

  CameraClient() {
    log('CameraClient initialized');
  }

  Future<bool> startQRCodeScan(BuildContext context) async {
    final response =
        await stub.invokeQRCodeScan(QRScanRequest(requestId: '12345'));
    log(response.status);
    if (response.status == 'SCAN_STARTED') {
      log('QR Code scan started');
      Timer(const Duration(seconds: 5), () async {
        log('QR Code scan completed');

        // Show loading dialog
        _showLoadingDialog(context);

        await sendQRCodeData('THIS_IS_MY_QR_CODE_DATA', context);

        // Hide loading dialog
        if (Navigator.canPop(context)) {
          Navigator.pop(context); // Remove the loading indicator
        }
      });
    }
    return false;
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
}
