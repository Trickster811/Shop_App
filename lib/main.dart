import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iut_ads/utils/utils.dart';
import 'package:iut_ads/welcome_pages/loading_page.dart';
import 'package:iut_ads/welcome_pages/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await UtilFunctions.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String>? userInfo;

  @override
  void initState() {
    super.initState();
    userInfo = UtilFunctions.getUserInfo();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ndere Ads',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Comfortaa_bold',
      ),
      home: LoadingScreen(
        userInfo: userInfo,
      ),
    );
  }
}
