import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iut_ads/utils/utils.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({
    Key? key,
    required this.imageLink,
    required this.deviceSize,
  }) : super(key: key);
  final String imageLink;
  final Size deviceSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final imageName = UtilFunctions.baseNameProvider(imageLink);
              try {
                final File? image = await UtilFunctions.saveDocument(
                  name: imageName,
                  filePath: imageLink,
                );
                print(image!.path);
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Container(
                    height: 40,
                    width: deviceSize.width,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Image Downloaded',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Comfortaa_bold',
                      ),
                    ),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } catch (e) {}
            },
            icon: SvgPicture.asset(
              'assets/icons/download.3.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: deviceSize.width,
          width: deviceSize.width,
          alignment: Alignment.center,
          child: Image.asset(
            imageLink,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
