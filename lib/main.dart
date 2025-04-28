import 'package:flutter/material.dart';
import 'package:opd_app/appointments_screen.dart';
import 'package:opd_app/billing.dart';
import 'package:opd_app/sample2.dart';
import 'package:opd_app/sample_page.dart';
import 'package:opd_app/prescriptionScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: PrescriptionScreen(),
        )),
      ),
    );
  }
}
