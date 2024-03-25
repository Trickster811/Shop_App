import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/components/image_view_page.dart';
import 'package:shop_app/screens/home_page.dart';
import 'package:shop_app/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    articleItemBuilder(context, image),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.adsObjets.productName,
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                    style: const TextStyle(
                      color: primaryColor,
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'XAF ${widget.adsObjets.productPrice}',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.5,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Text('Notez nous!!!'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                glowColor: Colors.red,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => SvgPicture.asset(
                  'assets/icons/heart.5.svg',
                  color: Colors.red,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: [
                  const Text("Entreprise : "),
                  Text(
                    widget.adsObjets.traderName.toUpperCase(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: [
                  const Text("Siège : "),
                  Text(
                    widget.adsObjets.location,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: [
                  const Text("Numèro : "),
                  Text(
                    widget.adsObjets.traderPhoneNumber.toString(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: [
                  const Text("Whatsapp : "),
                  Text(
                    widget.adsObjets.traderWhatsappNumber.toString(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 40,
            // width: 60,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () async {
                final whatsappContact = Uri.https(
                  'wa.me',
                  widget.adsObjets.traderPhoneNumber.toString(),
                  {'text': 'Bonjour'},
                );
                if (await canLaunchUrl(whatsappContact)) {
                  await launchUrl(
                    whatsappContact,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/whatsapp.svg',
                    height: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 05.0,
                  ),
                  const Text(
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
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () async {
                final phoneContact = Uri.parse(
                  'tel:${widget.adsObjets.traderPhoneNumber}',
                );
                if (await canLaunchUrl(phoneContact)) {
                  await launchUrl(
                    phoneContact,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/call.svg',
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 05.0,
                  ),
                  const Text(
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

  Widget articleItemBuilder(BuildContext context, String image) {
    return Container(
      height: widget.deviceSize.width * .9,
      width: widget.deviceSize.width * .9,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 30,
            offset: const Offset(0, 4),
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
