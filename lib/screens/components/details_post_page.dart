import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/components/image_view_page.dart';
import 'package:shop_app/screens/shop_page.dart';
import 'package:shop_app/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPostScreen extends StatefulWidget {
  const DetailsPostScreen({
    Key? key,
    required this.adsObjects,
    required this.deviceSize,
  }) : super(key: key);

  final AdsObjects adsObjects;
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
        // backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/arrow-left-2.2.svg",
            height: 30,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            ),
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
                  for (var image in widget.adsObjects.imageLink)
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
                    widget.adsObjects.productName,
                    textAlign: TextAlign.center,
                    textScaler: const TextScaler.linear(1.5),
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
                      'XAF ${widget.adsObjects.productPrice}',
                      textAlign: TextAlign.center,
                      textScaler: const TextScaler.linear(1.5),
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
                  colorFilter: const ColorFilter.mode(
                    Colors.red,
                    BlendMode.srcIn,
                  ),
                ),
                onRatingUpdate: (rating) {
                  debugPrint('$rating');
                },
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
              width: double.maxFinite,
              child: const Text(
                "House Details",
                style: TextStyle(
                  // fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Table(
                // defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                // border: TableBorder.symmetric(
                //   inside: BorderSide(),
                //   outside: BorderSide(),
                // ),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Theme.of(context).iconTheme.color!.withOpacity(.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6.0),
                        topRight: Radius.circular(6.0),
                      ),
                    ),
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).iconTheme.color!,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Specification",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        child: Text(
                          "Value",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  tableRowBuilder(
                    context,
                    "Town",
                    'Douala',
                    false,
                  ),
                  tableRowBuilder(
                    context,
                    "Water Source",
                    'Yes',
                    true,
                  ),
                ],
              ),
            ),
            const SizedBox(
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
                    'ButterFly'.toUpperCase(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: [
                  Text("Siège : "),
                  Text(
                    'Ngaoundere',
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
                  '690786195',
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
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
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
                  'tel:${690786195}',
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
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
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
                imageLink: widget.adsObjects.imageLink,
                deviceSize: widget.deviceSize,
                fileImage: false,
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

  TableRow tableRowBuilder(
      BuildContext context, String title, value, bool lastItem) {
    return TableRow(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).iconTheme.color!.withOpacity(.5),
            borderRadius: BorderRadius.only(
              bottomLeft: lastItem
                  ? const Radius.circular(6.0)
                  : const Radius.circular(0.0),
            ),
            border: Border(
              bottom: !lastItem
                  ? BorderSide(
                      color: Theme.of(context).iconTheme.color!,
                    )
                  : BorderSide.none,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
