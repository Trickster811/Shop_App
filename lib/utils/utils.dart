import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart' as pdf;
import 'package:pdf/widgets.dart' as pdf_widget;
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

const primaryColor = Color.fromARGB(255, 35, 25, 37);

class UtilFunctions {
  static late SharedPreferences _preferences;
  static const themeMode = 'isDark';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();

    // Appodeal.initialize(
    //   appKey: '0c478ff9f0c261eea3db303ad66c482313460e9cf1681cb4',
    //   adTypes: [
    //     AppodealAdType.RewardedVideo,
    //     AppodealAdType.Interstitial,
    //     AppodealAdType.Banner,
    //     AppodealAdType.MREC
    //   ],
    //   onInitializationFinished: (errors) {
    //     errors?.forEach((error) => print(error.desctiption));
    //     print("onInitializationFinished: errors - ${errors?.length ?? 0}");
    //     // init();
    //   },
    // );
  }

  static Future setFirstTime(bool firstTime) async {
    await _preferences.setBool('firstTime', firstTime);
  }

  static bool? getFirstTime() => _preferences.getBool('firstTime');

  static Future setUserInfo(List<String> userInfo) async {
    await _preferences.setStringList('userInfo', userInfo);
  }

  static List<String>? getUserInfo() => _preferences.getStringList('userInfo');

  static saveDocument({required String name, required document}) async {
    Directory? directory;

    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = Directory('/sdcard/Ndere Ads/App Images');
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getApplicationDocumentsDirectory();
        }
      }

      if (document != String) {
        final bytes = await document.save();
        final file = File("${directory!.path}/$name");

        await file.writeAsBytes(bytes);
        return file;
      }
      final fileSaved = File("${directory!.path}/$name");

      return File(document).copy(fileSaved.path);
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      await appFolder(permission);
      return true;
    } else {
      final result = await permission.request();
      if (result == PermissionStatus.granted) {
        await appFolder(permission);
        return true;
      } else {
        return false;
      }
    }
  }

  static appFolder(Permission permission) async {
    final Directory documentDirectory =
        Directory('/sdcard/Ndere Ads/App Documents');
    final Directory imageDirectory = Directory('/sdcard/Ndere Ads/App Images');

    final status = await permission.request();

    if (status == PermissionStatus.granted) {
      print('yyo');
      if (!await Directory('/sdcard/Ndere Ads').exists()) {
        await Directory('/sdcard/Ndere Ads').create(recursive: true);
      }
      if (!await imageDirectory.exists()) {
        imageDirectory.create(recursive: true);
      }
      if (!await documentDirectory.exists()) {
        documentDirectory.create(recursive: true);
      }
    } else {
      print('Denied');
    }
  }

  static baseNameProvider(path) {
    return basename(
      path,
    ); // This function return the the basename path of a file.
  }

  static selectFile(List<String>? allowedExtensions) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: allowedExtensions,
    );
    if (result == null) return;
    final path = result.files.single.path!;
    return File(path);
  }

  static Future openDialog(
      BuildContext context, List<List> menuItemList, double appBarHeightSize) {
    return showMenu(
      context: context,
      position: RelativeRect.fromLTRB(1, appBarHeightSize, 0, 0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      items: [
        for (final element in menuItemList) _buildPopMenuItem(context, element),
      ],
    );
  }

  static PopupMenuItem _buildPopMenuItem(BuildContext context, List item) {
    return PopupMenuItem(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => item[2],
            ),
          );
        },
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              item[0],
              color: Theme.of(context).iconTheme.color,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              item[1],
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Comfortaa_bold',
                // color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static showFlashMessage(
      BuildContext context, String message, Color color, Size deviceSize) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Container(
        height: 40,
        width: deviceSize.width,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // static Future<void> appodealInitialization() async {
  //   Appodeal.setLogLevel(Appodeal.LogLevelVerbose);

  //   Appodeal.setAutoCache(AppodealAdType.Interstitial, false);
  //   Appodeal.setAutoCache(AppodealAdType.RewardedVideo, false);
  //   Appodeal.setUseSafeArea(true);

  //   // Set ad auto caching enabled or disabled
  //   // By default autocache is enabled for all ad types
  //   Appodeal.setAutoCache(AppodealAdType.Interstitial, false); //default - true

  //   // Set testing mode
  //   Appodeal.setTesting(false); //default - false

  //   // Set Appodeal SDK logging level
  //   Appodeal.setLogLevel(
  //       Appodeal.LogLevelVerbose); //default - Appodeal.LogLevelNone

  //   // Enable or disable child direct threatment
  //   Appodeal.setChildDirectedTreatment(false); //default - false

  //   // Disable network for specific ad type
  //   Appodeal.disableNetwork("admob");
  //   Appodeal.disableNetwork("admob", AppodealAdType.Interstitial);

  //   Appodeal.setBannerCallbacks(
  //     onBannerLoaded: (isPrecache) => {},
  //     onBannerFailedToLoad: () => {},
  //     onBannerShown: () => {},
  //     onBannerShowFailed: () => {},
  //     onBannerClicked: () => {},
  //     onBannerExpired: () => {},
  //   );

  //   Appodeal.setInterstitialCallbacks(
  //     onInterstitialLoaded: (isPrecache) => {},
  //     onInterstitialFailedToLoad: () => {},
  //     onInterstitialShown: () => {},
  //     onInterstitialShowFailed: () => {},
  //     onInterstitialClicked: () => {},
  //     onInterstitialClosed: () => {},
  //     onInterstitialExpired: () => {},
  //   );
  //   Appodeal.setRewardedVideoCallbacks(
  //     onRewardedVideoLoaded: (isPrecache) => {},
  //     onRewardedVideoFailedToLoad: () => {
  //       showAppodealRewardedVideoAds(),
  //     },
  //     onRewardedVideoShown: () => {},
  //     onRewardedVideoShowFailed: () => {
  //       showAppodealRewardedVideoAds(),
  //     },
  //     onRewardedVideoClicked: () => {},
  //     onRewardedVideoClosed: (isFinished) {},
  //     onRewardedVideoExpired: () => {},
  //   );
  // }

  // static showAppodealRewardedVideoAds() async {
  //   var isready = await Appodeal.isInitialized(AppodealAdType.RewardedVideo);
  //   var canShow = await Appodeal.canShow(AppodealAdType.RewardedVideo);

  //   if (!isready) return 1;
  //   if (!canShow) return 2;

  //   return await Appodeal.show(AppodealAdType.RewardedVideo);
  // }

  static generateTicket() async {
    final ticket = pdf_widget.Document();
    ticket.addPage(
      pdf_widget.Page(
        pageFormat: const pdf.PdfPageFormat(
          21.0 * pdf.PdfPageFormat.cm,
          29.7 * pdf.PdfPageFormat.cm,
          marginAll: 1.5 * pdf.PdfPageFormat.cm,
        ),
        build: (context) => pdf_widget.Column(),
      ),
    );
    return await saveDocument(
      name: '',
      document: ticket,
    );
  }
}
