import 'dart:async';

import 'package:airwallex_flutter/airwallex_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _loginToken = '';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    AirwallexFlutter airwallexFlutter = AirwallexFlutter();
    String platformVersion;

    airwallexFlutter.setLoginCredentials('hNQk1gTtROKtyQyUogxKyg',
        '9a5429af40047688cc63321374f805a08edad91cf037f9fad0b8249240689a1eeb83c5a0626a41bd7401900ff15ed8ee');

    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await AirwallexFlutter.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // API messages may fail, so we use a try/catch Exception.
    // We also handle the message potentially returning null.
    try {
      _loginToken = await airwallexFlutter.loginToken ?? '';
    } on Exception {
      _loginToken = '';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'
              'LoginToken: $_loginToken\n'),
        ),
      ),
    );
  }
}
