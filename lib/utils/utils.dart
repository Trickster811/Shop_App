import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    //     errors?.forEach((error) => debugPrint(error.desctiption));
    //     debugPrint("onInitializationFinished: errors - ${errors?.length ?? 0}");
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
      debugPrint(e.toString());
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
      debugPrint('yyo');
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
      debugPrint('Denied');
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
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
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

  static final messagerKey = GlobalKey<ScaffoldMessengerState>();

  static showFlashMessage(String message, Color color) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Container(
        height: 40,
        // width: deviceSize.width,
        margin: const EdgeInsets.all(10), padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color.withOpacity(.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Comfortaa_bold',
            // color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
    messagerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
