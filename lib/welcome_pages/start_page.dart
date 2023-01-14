import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:iut_ads/screens/components/new_post_page.dart';
import 'package:iut_ads/screens/home_page.dart';
import 'package:iut_ads/screens/my_post_page.dart';
import 'package:iut_ads/screens/research_page.dart';
import 'package:iut_ads/screens/service_page.dart';
import 'package:iut_ads/utils/utils.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentState = 0;

  final listOfScreensTitle = [
    'Acceuil',
    'Poster',
    'Recherche',
    'Service',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final listOfIcons = [
      Icons.home,
      Icons.favorite,
      Icons.settings,
      Icons.search,
    ];
    final listOfScreens = [
      HomeScreen(
        deviceSize: size,
      ),
      MyPostScreen(
        deviceSize: size,
      ),
      ResearchScreen(
        deviceSize: size,
      ),
      ServiceScreen(
        deviceSize: size,
      ),
    ];
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          listOfScreensTitle[currentState],
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          currentState != 1
              ? IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/category.2.svg',
                  ),
                )
              : InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPostScreen(
                          deviceSize: size,
                          adsObjets: AdsObjets(
                            imageLink: '',
                            productName: '',
                            productPrice: 0,
                            location: '',
                            traderName: '',
                            traderIdNumber: 0,
                            traderPhoneNumber: 0,
                            traderWhatsappNumber: 0,
                            tradeCategory: 'Commerce',
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    // width: 80,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Publier',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
        ],
      ),
      body: listOfScreens[currentState],
      bottomNavigationBar: Container(
        height: 50,
        width: size.width,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(100000),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentState = 0;
                });
              },
              icon: currentState != 0
                  ? SvgPicture.asset(
                      'assets/icons/bag.1.svg',
                      color: Colors.white,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 5,
                          width: 15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1000),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/bag.4.svg',
                          color: Colors.white,
                        ),
                      ],
                    ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentState = 1;
                });
              },
              icon: currentState != 1
                  ? SvgPicture.asset(
                      'assets/icons/plus.svg',
                      color: Colors.white,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 5,
                          width: 15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1000),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/plus.3.svg',
                          color: Colors.white,
                        ),
                      ],
                    ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentState = 2;
                });
              },
              icon: currentState != 2
                  ? SvgPicture.asset(
                      'assets/icons/search.1.svg',
                      color: Colors.white,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 5,
                          width: 15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1000),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/search.6.svg',
                          color: Colors.white,
                        ),
                      ],
                    ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentState = 3;
                });
              },
              icon: currentState != 3
                  ? SvgPicture.asset(
                      'assets/icons/buy.1.svg',
                      color: Colors.white,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 5,
                          width: 15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1000),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/buy.svg',
                          color: Colors.white,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
