import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';

final primaryColor = Color.fromARGB(255, 35, 25, 37);

class UtilFunctions {
  static Future<File?> saveDocument(
      {required String name, required String filePath}) async {
    Directory? directory;

    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = Directory('/sdcard/Ndere Ads/Images');
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getApplicationDocumentsDirectory();
        }
      }
      final bytes = await File(filePath).readAsBytes();
      final fileSaved = File(directory!.path + "/$name");

      await fileSaved.writeAsBytes(bytes);
      print('ffff');
      return fileSaved;
    } catch (e) {}
  }

  static Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      await appFolder();
      return true;
    } else {
      final result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  static appFolder() async {
    final Directory documentDirectory =
        Directory('/sdcard/Ndere Ads/App Documents');
    final Directory imageDirectory = Directory('/sdcard/Ndere Ads/App Images');

    final status = await Permission.storage.request();

    if (status == PermissionStatus.granted) {
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
        path); // This function return the the basename path of a file.
  }
}
