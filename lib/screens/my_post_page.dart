import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ndere_ads/screens/components/image_view_page.dart';
import 'package:ndere_ads/screens/components/new_post_page.dart';
import 'package:ndere_ads/screens/home_page.dart';
import 'package:ndere_ads/utils/utils.dart';
import 'package:ndere_ads/welcome_pages/auth/sign_in_page.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({
    Key? key,
    required this.deviceSize,
    required this.firstTimeIndex,
  }) : super(key: key);
  final Size deviceSize;
  final bool? firstTimeIndex;

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.firstTimeIndex!
        ? Stack(
            children: [
              Container(
                height: widget.deviceSize.height,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      adsItemBuilder(
                        context,
                        AdsObjets(
                          imageLink: [
                            'https://rukminim1.flixcart.com/image/612/612/l51d30w0/shoe/z/w/c/10-mrj1914-10-aadi-white-black-red-original-imagft9k9hydnfjp.jpeg?q=70',
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH0YZh6ggzT4m0wdOK84OuihNDPGSHEuVUtwLhge3pmEPeA8k7GjZCsSSoAOgDXqzFcBI&usqp=CAU',
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtaCc3GrWTcxkOL1lvXXMEDo5rVEg5DGf2LyEmxd2cYWkPTPw6gzVVdKc_3Md5Mbfz0I&usqp=CAU',
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzv-wsjN5e6td-LHSyqak5TG4pdW4CcqQuTPUUpGwvDwWRVhbeBpFkpwRgZ89z_mtfOE8&usqp=CAU',
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGFEzJimi75YHQQ6ClrDVpKG2ldTukwK_PIST1lklXhTmHQQI_OwGenvurqqnj3U_00c4&usqp=CAU',
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9uELZlGwIYcmHNK8h4mpTLiwh-BTNv3I9f4hPNgKSLuH3v_KTJh3Ciu6K4qE3olXNvgM&usqp=CAU',
                          ],
                          productName: 'Chocolat',
                          productPrice: 0.25,
                          location: 'Bini - Dang',
                          traderName: 'Julie Queen',
                          traderPhoneNumber: 690786195,
                          traderWhatsappNumber: 690786195,
                          tradeCategory: 'Formation',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 90,
                right: 20,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPostScreen(
                          deviceSize: widget.deviceSize,
                          adsObjets: AdsObjets(
                            imageLink: [],
                            productName: '',
                            productPrice: 0.00,
                            location: '',
                            traderName: '',
                            traderPhoneNumber: 0,
                            traderWhatsappNumber: 0000,
                            tradeCategory: 'Commerce',
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Connecter pour pouvoir poster des annonces ou publicités",
                  textScaleFactor: 1.2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(
                          userInfo: [],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 30.0,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/login.1.svg',
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "Se Connecter",
                          style: TextStyle(
                            color: Colors.white,
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

  Widget adsItemBuilder(BuildContext context, AdsObjets adsObjets) {
    return Container(
      height: 300,
      width: widget.deviceSize.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageViewScreen(
                    imageLink: adsObjets.imageLink,
                    deviceSize: widget.deviceSize,
                  ),
                ),
              );
            },
            child: Container(
              height: 175,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/2.png',
                  image: adsObjets.imageLink[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 125,
                  // width: (widget.deviceSize.width - 20) * .65,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            adsObjets.productName,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 05,
                          ),
                          Text(
                            "(Produit)",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '€ ${adsObjets.productPrice}',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 05,
                          ),
                          Text(
                            "(Prix U)",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            adsObjets.location,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 05,
                          ),
                          Text(
                            "(Position)",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 125,
                width: (widget.deviceSize.width - 20) * .35,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewPostScreen(
                                deviceSize: widget.deviceSize,
                                adsObjets: adsObjets,
                              ),
                            ),
                          );
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/edit-square.6.svg',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/delete.3.svg',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
