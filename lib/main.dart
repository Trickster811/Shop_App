// ************************************************************
// ************************************************************
// ***     Copyright 2023 Ndere Ads. All rights reserved.   ***
// ***          by Jo@chim Ned@ouk@ (MacNight_nj).          ***
// ************************************************************
// ************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iut_ads/utils/utils.dart';
import 'package:iut_ads/welcome_pages/loading_page.dart';
import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await UtilFunctions.init();

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
    },
  );

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
    // appodealInitialization();
  }

  Future<void> appodealInitialization() async {
    Appodeal.setLogLevel(Appodeal.LogLevelVerbose);

    Appodeal.setAutoCache(AppodealAdType.Interstitial, false);
    Appodeal.setAutoCache(AppodealAdType.RewardedVideo, false);
    Appodeal.setUseSafeArea(true);

    // Set ad auto caching enabled or disabled
    // By default autocache is enabled for all ad types
    Appodeal.setAutoCache(AppodealAdType.Interstitial, false); //default - true

    // Set testing mode
    Appodeal.setTesting(false); //default - false

    // Set Appodeal SDK logging level
    Appodeal.setLogLevel(
        Appodeal.LogLevelVerbose); //default - Appodeal.LogLevelNone

    // Enable or disable child direct threatment
    Appodeal.setChildDirectedTreatment(false); //default - false

    // Disable network for specific ad type
    Appodeal.disableNetwork("admob");
    Appodeal.disableNetwork("admob", AppodealAdType.Interstitial);

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
    Appodeal.setRewardedVideoCallbacks(
      onRewardedVideoLoaded: (isPrecache) => {},
      onRewardedVideoFailedToLoad: () => {},
      onRewardedVideoShown: () => {},
      onRewardedVideoShowFailed: () => {},
      onRewardedVideoClicked: () => {},
      onRewardedVideoClosed: (isFinished) {},
      onRewardedVideoExpired: () => {},
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
