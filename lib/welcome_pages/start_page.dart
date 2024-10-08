import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:b_shop/screens/components/account/about_page.dart';
import 'package:b_shop/screens/components/restaurant/order_list_page.dart';
import 'package:b_shop/screens/restaurant_page.dart';
import 'package:b_shop/screens/shop_page.dart';
import 'package:b_shop/screens/my_post_page.dart';
import 'package:b_shop/screens/account_page.dart';
import 'package:b_shop/screens/research_page.dart';
import 'package:b_shop/utils/utils.dart';
import 'package:b_shop/welcome_pages/auth/sign_out_page.dart';
import 'package:b_shop/welcome_pages/auth/sign_in_page.dart';
// import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

class MyHomePage extends StatefulWidget {
  final Map<String, dynamic> userInfo;

  const MyHomePage({
    Key? key,
    required this.userInfo,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentState = 0;
  // bool firstTimeIndex = false;

  double appBarHeightSize = 0;

  @override
  void initState() {
    super.initState();
    // checkUser();
    // UtilFunctions.appodealInitialization();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final listOfScreensTitle = [
      'B-Shop',
      'Restaurant',
      'Publications',
      'Recherche',
      'Account',
    ];
    List<List> menuItemList = [
      [
        widget.userInfo.isNotEmpty
            ? 'assets/icons/logout.4.svg'
            : 'assets/icons/login.1.svg',
        widget.userInfo.isNotEmpty ? 'Deconnexion' : 'Se Connecter',
        widget.userInfo.isNotEmpty
            ? const DeconnexionScreen()
            : const SignInScreen(
                userInfo: {},
              ),
      ],
      [
        'assets/icons/info-square.4.svg',
        'A propos',
        const AboutScreen(),
      ],
    ];

    final listOfScreens = [
      ShopScreen(
        deviceSize: deviceSize,
      ),
      RestaurantScreen(
        deviceSize: deviceSize,
      ),
      MyPostScreen(
        deviceSize: deviceSize,
        userLoginInfo: widget.userInfo,
      ),
      ResearchScreen(
        deviceSize: deviceSize,
      ),
      ProfileScreen(
        appBarHeightSize: appBarHeightSize,
        deviceSize: deviceSize,
        userLoginInfo: widget.userInfo,
      )
    ];
    return Scaffold(
      extendBody: true,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          listOfScreensTitle[currentState],
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          if (currentState == 1)
            IconButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderListScreen(),
                  ),
                )
              },
              icon: SvgPicture.asset(
                'assets/icons/delivery.svg',
                height: 20,
              ),
            ),
          IconButton(
            onPressed: () => {},
            icon: SvgPicture.asset(
              'assets/icons/search.1.svg',
            ),
          ),
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
      bottomNavigationBar: Container(
        height: 50,
        width: deviceSize.width,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: thirdColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
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
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
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
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
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
                      'assets/icons/restaurant-1.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      height: 20,
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
                          'assets/icons/restaurant.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                          height: 20,
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
                      // widget.userInfo.isNotEmpty && widget.userInfo[0] == 'Client'
                      //     ? 'assets/icons/activity.6.svg'
                      'assets/icons/plus.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
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
                          // widget.userInfo.isNotEmpty &&
                          //         widget.userInfo[0] == 'Client'
                          //     ? 'assets/icons/activity.2.svg'
                          'assets/icons/plus.3.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
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
                      'assets/icons/search.1.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
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
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentState = 4;
                });
              },
              icon: currentState != 4
                  ? SvgPicture.asset(
                      // widget.userInfo.isNotEmpty && widget.userInfo[0] == 'Client'
                      //     ? 'assets/icons/time-circle.4.svg'
                      'assets/icons/profile.6.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
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
                          // widget.userInfo.isNotEmpty &&
                          //         widget.userInfo[0] == 'Client'
                          //     ? 'assets/icons/time-circle.5.svg'
                          'assets/icons/profile.3.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // checkUser() async {
  //   final bool? firstTime = UtilFunctions.getFirstTime();
  //   final List<String>? widget.userInfo = UtilFunctions.getwidget.UserInfo();
  //   print(firstTime);
  //   setState(() {
  //     firstTimeIndex = firstTime!;
  //     widget.userInfo = widget.userInfo!;
  //     // widget.widget.userInfo = widget.userInfo;
  //   });
  // }
}
