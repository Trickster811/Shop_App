import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/utils/utils.dart';
import 'package:shop_app/welcome_pages/start_page.dart';
import 'package:shop_app/welcome_pages/welcome_page.dart';

class LoadingScreen extends StatefulWidget {
  final List<String>? userInfo;
  const LoadingScreen({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final bool? firstTime = UtilFunctions.getFirstTime();

  @override
  void initState() {
    super.initState();
    if (firstTime != null && firstTime!) {
      startTime();
    } else {
      startTime1();
    }
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(
          userInfo: widget.userInfo,
        ),
      ),
    );
  }

  startTime1() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route1);
  }

  route1() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(
          userInfo: widget.userInfo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 228, 228, 228),
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -MediaQuery.of(context).size.width * 0.8,
          bottom: 0,
          child: Image.asset(
            'assets/images/hidden_icon_logo.png',
            color: Colors.white.withOpacity(0.4),
            // colorBlendMode: BlendMode.modulate,
            // width: MediaQuery.of(context).size.width * 3,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
        ),
        SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/hidden_icon_logo.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'ShopApp',
                  style: TextStyle(
                    fontSize: 15,
                    // fontFamily: 'Comfortaa_bold',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Application Publicitaire',
                  style: TextStyle(
                    fontSize: 10,
                    // fontFamily: 'Comfortaa_bold',
                    // color: Colors.black45,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
