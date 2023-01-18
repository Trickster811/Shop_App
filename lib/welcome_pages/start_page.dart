import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:iut_ads/screens/about_page.dart';
import 'package:iut_ads/screens/components/new_post_page.dart';
import 'package:iut_ads/screens/home_page.dart';
import 'package:iut_ads/screens/my_post_page.dart';
import 'package:iut_ads/screens/research_page.dart';
import 'package:iut_ads/screens/service_page.dart';
import 'package:iut_ads/utils/utils.dart';
import 'package:iut_ads/welcome_pages/auth/sign_in_page.dart';
import 'package:iut_ads/welcome_pages/disconnection.dart';

class MyHomePage extends StatefulWidget {
  final List<String>? userInfo;

  const MyHomePage({
    Key? key,
    required this.userInfo,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentState = 0;
  bool? firstTimeIndex;

  final listOfScreensTitle = [
    'Acceuil',
    'Poster',
    'Recherche',
    'Service',
  ];

  double appBarHeightSize = 0;
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  checkUser() async {
    final bool? firstTime = UtilFunctions.getFirstTime();
    final List<String>? userInfo = UtilFunctions.getUserInfo();
    print(firstTime);
    setState(() {
      firstTimeIndex = firstTime;
      // widget.userInfo = userInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    List<List> menuItemList = [
      [
        firstTimeIndex! != null && firstTimeIndex!
            ? 'assets/icons/login.1.svg'
            : 'assets/icons/logout.4.svg',
        firstTimeIndex! != null && firstTimeIndex!
            ? 'Se Connecter'
            : 'Deconnexion',
        firstTimeIndex! != null && firstTimeIndex!
            ? SignInScreen(
                userInfo: [],
              )
            : DeconnexionScreen(),
      ],
      [
        'assets/icons/info-square.4.svg',
        'A propos',
        AboutScreen(),
      ],
    ];

    final listOfIcons = [
      Icons.home,
      Icons.favorite,
      Icons.settings,
      Icons.search,
    ];
    final listOfScreens = [
      HomeScreen(
        deviceSize: deviceSize,
      ),
      MyPostScreen(
        deviceSize: deviceSize,
        firstTimeIndex: firstTimeIndex,
      ),
      ResearchScreen(
        deviceSize: deviceSize,
      ),
      ServiceScreen(
        deviceSize: deviceSize,
      ),
    ];
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          IconButton(
            onPressed: () {
              UtilFunctions.openDialog(context, menuItemList, appBarHeightSize);
            },
            icon: SvgPicture.asset(
              'assets/icons/category.2.svg',
            ),
          ),
        ],
      ),
      body: listOfScreens[currentState],
      floatingActionButton: firstTimeIndex! && currentState == 1
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPostScreen(
                      deviceSize: deviceSize,
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
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),
            )
          : Container(),
      bottomNavigationBar: Container(
        height: 50,
        width: deviceSize.width,
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
