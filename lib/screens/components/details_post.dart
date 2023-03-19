import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ndere_ads/screens/components/image_view_page.dart';
import 'package:ndere_ads/screens/home_page.dart';
import 'package:ndere_ads/utils/utils.dart';

class DetailsPostScreen extends StatefulWidget {
  const DetailsPostScreen({
    Key? key,
    required this.adsObjets,
    required this.deviceSize,
  }) : super(key: key);

  final AdsObjets adsObjets;
  final Size deviceSize;

  @override
  State<DetailsPostScreen> createState() => _DetailsPostScreenState();
}

class _DetailsPostScreenState extends State<DetailsPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left-2.2.svg',
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var image in widget.adsObjets.imageLink)
                    itemBuilder(context, image),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'XAF 225',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 40,
            // width: 60,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/whatsapp.svg',
                    height: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 05.0,
                  ),
                  Text(
                    'Whatsapp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 40,
            // width: 60,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/call.svg',
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 05.0,
                  ),
                  Text(
                    'Phone',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemBuilder(BuildContext context, String image) {
    return Container(
      height: widget.deviceSize.width * .9,
      width: widget.deviceSize.width * .9,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 30,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageViewScreen(
                imageLink: widget.adsObjets.imageLink,
                deviceSize: widget.deviceSize,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/2.png',
            image: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
