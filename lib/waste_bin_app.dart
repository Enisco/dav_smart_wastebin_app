// ignore_for_file: depend_on_referenced_packages

import 'package:dav_smart_wastebin_app/presentation/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WasteBinApp extends StatelessWidget {
  const WasteBinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Bin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SmartWasteBinPageView(),
    );
  }
}
