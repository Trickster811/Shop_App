import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ndere_ads/utils/utils.dart';

class ImageViewScreen extends StatefulWidget {
  const ImageViewScreen({
    Key? key,
    required this.imageLink,
    required this.deviceSize,
  }) : super(key: key);
  final List<String> imageLink;
  final Size deviceSize;

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
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final imageName =
                  UtilFunctions.baseNameProvider(widget.imageLink);
              try {
                await UtilFunctions.saveDocument(
                  name: imageName,
                  document: widget.imageLink[index],
                );
                // print(image!.path);
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Container(
                    height: 40,
                    width: widget.deviceSize.width,
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
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
              } catch (e) {
                print(e);
              }
            },
            icon: SvgPicture.asset(
              'assets/icons/download.3.svg',
              color: Colors.white,
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
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/2.png',
                image: widget.imageLink[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: const [
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
                          child: Image.network(
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
