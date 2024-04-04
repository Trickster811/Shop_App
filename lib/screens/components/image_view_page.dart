import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/utils/utils.dart';

class ImageViewScreen extends StatefulWidget {
  final List imageLink;
  final Size deviceSize;
  final bool fileImage;

  const ImageViewScreen({
    Key? key,
    required this.imageLink,
    required this.deviceSize,
    required this.fileImage,
  }) : super(key: key);

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  int index = 0;
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
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final imageName =
                  UtilFunctions.baseNameProvider(widget.imageLink[index]);
              try {
                await UtilFunctions.saveDocument(
                  name: imageName,
                  document: widget.imageLink[index],
                );

                UtilFunctions.showFlashMessage(
                  'Image Downloaded',
                  Colors.white,
                );
              } catch (e) {
                debugPrint(e.toString());
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
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: widget.deviceSize.width,
              width: widget.deviceSize.width,
              alignment: Alignment.center,
              child: widget.fileImage
                  ? Image.file(
                      widget.imageLink[index],
                      fit: BoxFit.cover,
                    )
                  : FadeInImage.assetNetwork(
                      placeholder: 'assets/images/2.png',
                      image: widget.imageLink[index],
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Images:',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var item in widget.imageLink)
                  Container(
                    height: 75,
                    width: 75,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.white.withOpacity(.2),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = widget.imageLink.indexOf(item);
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: InteractiveViewer(
                          maxScale: 5,
                          child: widget.fileImage
                              ? Image.file(
                                  item,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
