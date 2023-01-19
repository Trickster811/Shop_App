import 'package:flutter/material.dart';
import 'package:iut_ads/screens/components/my_documents_page.dart';
import 'package:iut_ads/screens/components/new_print_page.dart';
import 'package:iut_ads/screens/my_post_page.dart';
import 'package:iut_ads/utils/utils.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);
  final Size deviceSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceSize.height,
      width: deviceSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Services impression de documents par le secrétariat LMD',
            textAlign: TextAlign.center,
            textScaleFactor: 1.1,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewPrintSCreen(
                    deviceSize: deviceSize,
                  ),
                ),
              );
            },
            child: Container(
              height: 50,
              width: 200,
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Nouveau',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyDocumentsScreen(
                    deviceSize: deviceSize,
                  ),
                ),
              );
            },
            child: Container(
              height: 50,
              width: 200,
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Mes Documents',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DocumentBuilder {
  final String documentTitle;
  final String documentLink;
  final int documentCopies;
  final bool documentColorType;
  final bool documentdispositionType;
  final bool documentReliureType;
  final DateTime documentSendingDate;
  final String ownerName;
  final int ownerPhone;
  final bool documentStatus;

  const DocumentBuilder({
    Key? key,
    required this.documentTitle,
    required this.documentLink,
    required this.documentCopies,
    required this.documentColorType,
    required this.documentdispositionType,
    required this.documentReliureType,
    required this.documentSendingDate,
    required this.ownerName,
    required this.ownerPhone,
    required this.documentStatus,
  });
}
