import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grpc_client/gen/helloword.pbgrpc.dart';
import 'package:grpc_client/utils/qr_scan.dart';
import 'package:grpc_client/utils/util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final client = CameraClient();
  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final CameraClient client;
  const MyApp({super.key, required this.client});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', client: client),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.client});

  final String title;
  final CameraClient client;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    Utils utils = Utils();

    GreeterClient stub = utils.getServerRef();

    HelloRequest request = HelloRequest()..name = 'Ankit Maniya $_counter';

    stub.sayHello(request).then((HelloReply response) {
      log('Greeter client received: ${response.message}');
    });
  }

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
            final shouldNavigate = await widget.client.startQRCodeScan(context);
            if (shouldNavigate && mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QRScannerPage(client: widget.client)),
              );
            }
          },
          child: const Text('Start QR Code Scan'),
        ),
      ),
    );
  }
}
