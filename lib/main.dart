// import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:grpc_client/gen/helloword.pbgrpc.dart';
import 'package:grpc_client/utils/qr_scan.dart';
// import 'package:grpc_client/utils/util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Capture the context
            final currentContext = context;

            // Check if the state is still mounted
            if (mounted) {
              Navigator.push(
                currentContext,
                MaterialPageRoute(builder: (context) => QRScannerPage()),
              );
            }
          },
          child: const Text('Start QR Code Scan'),
        ),
      ),
    );
  }
}
