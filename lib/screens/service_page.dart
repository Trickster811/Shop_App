import 'package:flutter/material.dart';
import 'package:shop_app/screens/components/my_documents_page.dart';
import 'package:shop_app/screens/components/new_print_page.dart';
import 'package:shop_app/utils/utils.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);
  final Size deviceSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceSize.height,
      width: deviceSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Services impression de documents par le secrétariat LMD',
            textAlign: TextAlign.center,
            textScaleFactor: 1.1,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
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
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Nouveau',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
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
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
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
  final String documentComment;
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
    required this.documentComment,
    required this.ownerName,
    required this.ownerPhone,
    required this.documentStatus,
  });
}
