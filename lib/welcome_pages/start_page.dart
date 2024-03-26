import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/about_page.dart';
import 'package:shop_app/screens/home_page.dart';
import 'package:shop_app/screens/my_post_page.dart';
import 'package:shop_app/screens/profile_page.dart';
import 'package:shop_app/screens/research_page.dart';
import 'package:shop_app/utils/utils.dart';
import 'package:shop_app/welcome_pages/auth/disconnection.dart';
import 'package:shop_app/welcome_pages/auth/sign_in_page.dart';
// import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

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
      'Acceuil',
      // widget.userInfo.isNotEmpty && widget.userInfo[0] == 'Client'
      //     ? 'Gérer'
      'Publications',
      'Recherche',
      'Profil',
      // widget.userInfo.isNotEmpty && widget.userInfo[0] == 'Client'
      //     ? 'Historique'
      //     : 'Service',
    ];
    List<List> menuItemList = [
      // if (widget.userInfo.isNotEmpty &&
      //     widget.userInfo[0] == 'Entreprise' &&
      //     currentState == 3) ...[
      //   [
      //     'assets/icons/call.5.svg',
      //     'Service Client',
      //     const AboutScreen(),
      //   ],
      //   [
      //     'assets/icons/time-circle.4.svg',
      //     'Historique',
      //     EntrepriseHistoryScreen(deviceSize: deviceSize),
      //   ]
      // ],
      [
        widget.userInfo!.isNotEmpty
            ? 'assets/icons/logout.4.svg'
            : 'assets/icons/login.1.svg',
        widget.userInfo!.isNotEmpty ? 'Deconnexion' : 'Se Connecter',
        widget.userInfo!.isNotEmpty
            ? const DeconnexionScreen()
            : const SignInScreen(
                userInfo: [],
              ),
      ],
      [
        'assets/icons/info-square.4.svg',
        'A propos',
        const AboutScreen(),
      ],
    ];

    final listOfScreens = [
      HomeScreen(
        deviceSize: deviceSize,
      ),
      // widget.userInfo.isNotEmpty && widget.userInfo[0] == 'Client'
      //     ? MyPendingTasksScreen(
      //         deviceSize: deviceSize,
      //       )
      MyPostScreen(
        deviceSize: deviceSize,
        userLoginInfo: widget.userInfo!,
      ),
      ResearchScreen(
        deviceSize: deviceSize,
      ),
      // widget.userInfo.isNotEmpty && widget.userInfo[0] == 'Client'
      //     ? SecretariatHistoryScreen(
      //         deviceSize: deviceSize,
      //       )
      // ServiceScreen(
      //   deviceSize: deviceSize,
      // ),
      ProfileScreen(
        appBarHeightSize: appBarHeightSize,
        deviceSize: deviceSize,
        userLoginInfo: widget.userInfo!,
      )
    ];
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          listOfScreensTitle[currentState],
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          // IconButton(
          //   onPressed: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ProfileScreen(
          //         appBarHeightSize: appBarHeightSize,
          //         deviceSize: deviceSize,
          //         widget.userInfo: widget.userInfo,
          //       ),
          //     ),
          //   ),
          //   icon: SvgPicture.asset(
          //     'assets/icons/profile.6.svg',
          //   ),
          // ),
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
          color: primaryColor,
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
                  currentState = 2;
                });
              },
              icon: currentState != 2
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
                  currentState = 3;
                });
              },
              icon: currentState != 3
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
