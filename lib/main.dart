// ************************************************************
// ************************************************************
// ***     Copyright 2023 One Chat. All rights reserved.    ***
// ***          by Jo@chim Ned@ouk@ (MacNight_nj).          ***
// ************************************************************
// ************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iut_ads/utils/utils.dart';
import 'package:iut_ads/welcome_pages/loading_page.dart';
import 'package:iut_ads/welcome_pages/start_page.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

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
    appodealInitialization();
  }

  Future<void> appodealInitialization() async {
    Appodeal.setLogLevel(Appodeal.LogLevelVerbose);

    Appodeal.setAutoCache(AppodealAdType.Interstitial, false);
    Appodeal.setAutoCache(AppodealAdType.RewardedVideo, false);
    Appodeal.setUseSafeArea(true);

    Appodeal.initialize(
        appKey: '0c478ff9f0c261eea3db303ad66c482313460e9cf1681cb4',
        adTypes: [
          AppodealAdType.RewardedVideo,
          AppodealAdType.Interstitial,
          AppodealAdType.Banner,
          AppodealAdType.MREC
        ],
        onInitializationFinished: (errors) {
          errors?.forEach((error) => print(error.desctiption));
          print("onInitializationFinished: errors - ${errors?.length ?? 0}");
        });

    Appodeal.setBannerCallbacks(
      onBannerLoaded: (isPrecache) => {},
      onBannerFailedToLoad: () => {},
      onBannerShown: () => {},
      onBannerShowFailed: () => {},
      onBannerClicked: () => {},
      onBannerExpired: () => {},
    );

    Appodeal.setInterstitialCallbacks(
      onInterstitialLoaded: (isPrecache) => {},
      onInterstitialFailedToLoad: () => {},
      onInterstitialShown: () => {},
      onInterstitialShowFailed: () => {},
      onInterstitialClicked: () => {},
      onInterstitialClosed: () => {},
      onInterstitialExpired: () => {},
    );
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
