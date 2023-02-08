import 'package:flutter/material.dart';
import 'package:log_my_location/common/app_constants.dart';
import 'package:log_my_location/common/localdb/LogObjectBox.dart';

import 'modules/my_bottom_navbar.dart';

late LogObjectBox logObjectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  logObjectBox = await LogObjectBox.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.app_name,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBottomNavbar(),
    );
  }
}