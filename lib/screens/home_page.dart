import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iut_ads/screens/components/details_page.dart';
import 'package:iut_ads/screens/components/image_view_page.dart';
import 'package:iut_ads/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);
  final Size deviceSize;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int starRate0 = 0;
  int starRate1 = 0;
  int starRate2 = 0;
  int starRate3 = 0;
  int starRate4 = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                toolBarElementBuilder('All'),
                toolBarElementBuilder('Commerce'),
                toolBarElementBuilder('Offre Service'),
                toolBarElementBuilder('Formation'),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                adsItemBuilder(
                  context,
                  AdsObjets(
                    imageLink: 'assets/images/2.png',
                    productName: 'Chocolat',
                    productPrice: 0.25,
                    location: 'Bini - Dang',
                    traderName: 'Julie Queen',
                    traderIdNumber: 101115020,
                    traderPhoneNumber: 690786195,
                    traderWhatsappNumber: 690786195,
                    tradeCategory: 'Commerce',
                  ),
                ),
                adsItemBuilder(
                  context,
                  AdsObjets(
                    imageLink: 'assets/images/2.png',
                    productName: 'Chocolat',
                    productPrice: 0.25,
                    location: 'Bini - Dang',
                    traderName: 'Julie Queen',
                    traderIdNumber: 101115020,
                    traderPhoneNumber: 690786195,
                    traderWhatsappNumber: 690786195,
                    tradeCategory: 'Offre Service',
                  ),
                ),
                adsItemBuilder(
                  context,
                  AdsObjets(
                    imageLink: 'assets/images/2.png',
                    productName: 'Chocolat',
                    productPrice: 0.25,
                    location: 'Bini - Dang',
                    traderName: 'Julie Queen',
                    traderIdNumber: 101115020,
                    traderPhoneNumber: 690786195,
                    traderWhatsappNumber: 690786195,
                    tradeCategory: 'Formation',
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget adsItemBuilder(BuildContext context, AdsObjets adsObjets) {
    return Container(
      height: 300,
      width: widget.deviceSize.width,
      margin: EdgeInsets.all(10),
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
                child: Image.asset(
                  adsObjets.imageLink,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 125,
                width: (widget.deviceSize.width - 20) * .65,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              starRate0 = starRate0 == 0 ? 1 : 0;
                            });
                          },
                          child: starRate0 == 0
                              ? SvgPicture.asset(
                                  'assets/icons/star.5.svg',
                                )
                              : SvgPicture.asset(
                                  'assets/icons/star.4.svg',
                                ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              starRate1 = starRate1 == 0 ? 1 : 0;
                              starRate0 = starRate1 == 1 ? 1 : 0;
                            });
                          },
                          child: starRate1 == 0
                              ? SvgPicture.asset(
                                  'assets/icons/star.5.svg',
                                )
                              : SvgPicture.asset(
                                  'assets/icons/star.4.svg',
                                ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              starRate2 = starRate2 == 0 ? 1 : 0;
                              starRate1 = starRate2 == 1 ? 1 : 0;
                              starRate0 = starRate2 == 1 ? 1 : 0;
                            });
                          },
                          child: starRate1 == 0
                              ? SvgPicture.asset(
                                  'assets/icons/star.5.svg',
                                )
                              : SvgPicture.asset(
                                  'assets/icons/star.4.svg',
                                ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              starRate3 = starRate3 == 0 ? 1 : 0;
                              starRate2 = starRate3 == 1 ? 1 : 0;
                              starRate1 = starRate3 == 1 ? 1 : 0;
                              starRate0 = starRate3 == 1 ? 1 : 0;
                            });
                          },
                          child: starRate1 == 0
                              ? SvgPicture.asset(
                                  'assets/icons/star.5.svg',
                                )
                              : SvgPicture.asset(
                                  'assets/icons/star.4.svg',
                                ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailsScreen(
                        //       deviceSize: widget.deviceSize,
                        //       adsObjets: adsObjets,
                        //     ),
                        //   ),
                        // );
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            contentPadding: EdgeInsets.all(0),
                            content: Container(
                              height: 100,
                              padding: EdgeInsets.all(10),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        adsObjets.traderName,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 05,
                                      ),
                                      Text(
                                        "(Vendeur)",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${adsObjets.traderIdNumber}',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 05,
                                      ),
                                      Text(
                                        "(CNI)",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${adsObjets.traderPhoneNumber}',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 05,
                                      ),
                                      Text(
                                        "(Phone)",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/icons/calling.4.svg',
                                          color: Colors.white,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/icons/whatsapp.svg',
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
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(
                              10,
                            )),
                        child: Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget toolBarElementBuilder(String title) {
    return Row(
      children: [
        SizedBox(
          width: 05,
        ),
        Container(
          height: 40,
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 05,
        ),
      ],
    );
  }
}

class AdsObjets {
  final String imageLink;
  final String productName;
  final double productPrice;
  final String location;
  final String traderName;
  final double traderIdNumber;
  final int traderPhoneNumber;
  final int traderWhatsappNumber;
  final String tradeCategory;
  const AdsObjets({
    Key? key,
    required this.imageLink,
    required this.productName,
    required this.productPrice,
    required this.location,
    required this.traderName,
    required this.traderIdNumber,
    required this.traderPhoneNumber,
    required this.traderWhatsappNumber,
    required this.tradeCategory,
  });
}
