// ************************************************************
// ************************************************************
// ***     Copyright 2024 Shop App. All rights reserved.    ***
// ***          by Jo@chim Ned@ouk@ (MacNight_nj).          ***
// ************************************************************
// ************************************************************

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/utils/firebase_options.dart';
import 'package:shop_app/utils/utils.dart';
import 'package:shop_app/welcome_pages/loading_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize app with Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Add this line ! This is activates the AppCheck and should remove /// the reCaptcha and also automate the OTP verification.
  await FirebaseAppCheck.instance.activate();

  await UtilFunctions.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Map<String, dynamic> userInfo;

  @override
  void initState() {
    super.initState();
    userInfo = UtilFunctions.getUserInfo();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: UtilFunctions.messagerKey,
      title: 'B-Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Montserrat',
      ),
      home: LoadingScreen(
        userInfo: userInfo,
      ),
    );
  }
}
