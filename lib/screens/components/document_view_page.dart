import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/utils/utils.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({
    Key? key,
    required this.pdfFile,
    required this.deviceSize,
  }) : super(key: key);
  final File pdfFile;
  final Size deviceSize;
  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(UtilFunctions.baseNameProvider(widget.pdfFile.path)),
        actions: [
          IconButton(
            onPressed: () async {
              final imageName =
                  UtilFunctions.baseNameProvider(widget.pdfFile.path);
              try {
                await UtilFunctions.saveDocument(
                  name: imageName,
                  document: widget.pdfFile,
                );
                UtilFunctions.showFlashMessage(
                  'Image Downloaded',
                  Colors.white,
                );
              } catch (e) {
                debugPrint('$e');
              }
            },
            icon: SvgPicture.asset(
              'assets/icons/download.3.svg',
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.share_rounded,
          //     color: Colors.white,
          //   ),
          //   onPressed: () async {
          //     await Share.shareFiles(
          //         [XFile.fromData(await widget.pdfFile.readAsBytes())]);
          //   },
          // ),
        ],
      ),
      body: SfPdfViewer.file(
        widget.pdfFile,
        controller: _pdfViewerController,
      ),
    );
  }
}
