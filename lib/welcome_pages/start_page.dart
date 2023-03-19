import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ndere_ads/screens/about_page.dart';
import 'package:ndere_ads/screens/entreprise_history_page.dart';
import 'package:ndere_ads/screens/home_page.dart';
import 'package:ndere_ads/screens/my_pending_taks_page.dart';
import 'package:ndere_ads/screens/my_post_page.dart';
import 'package:ndere_ads/screens/research_page.dart';
import 'package:ndere_ads/screens/secretariat_history_page%20copy.dart';
import 'package:ndere_ads/screens/service_page.dart';
import 'package:ndere_ads/utils/utils.dart';
import 'package:ndere_ads/welcome_pages/auth/disconnection.dart';
import 'package:ndere_ads/welcome_pages/auth/sign_in_page.dart';
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
  bool firstTimeIndex = false;
  List<String> userLoginInfo = [];

  double appBarHeightSize = 0;

  @override
  void initState() {
    super.initState();
    checkUser();
    // UtilFunctions.appodealInitialization();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final listOfScreensTitle = [
      'Acceuil',
      userLoginInfo.isNotEmpty && userLoginInfo[0] == 'Secretariat'
          ? 'Gérer'
          : 'Publications',
      'Recherche',
      userLoginInfo.isNotEmpty && userLoginInfo[0] == 'Secretariat'
          ? 'Historique'
          : 'Service',
    ];
    List<List> menuItemList = [
      [
        firstTimeIndex != null && firstTimeIndex
            ? 'assets/icons/logout.4.svg'
            : 'assets/icons/login.1.svg',
        firstTimeIndex != null && firstTimeIndex
            ? 'Deconnexion'
            : 'Se Connecter',
        firstTimeIndex != null && firstTimeIndex
            ? DeconnexionScreen()
            : SignInScreen(
                userInfo: [],
              ),
      ],
      [
        'assets/icons/info-square.4.svg',
        'A propos',
        AboutScreen(),
      ],
    ];

    final listOfScreens = [
      HomeScreen(
        deviceSize: deviceSize,
      ),
      userLoginInfo.isNotEmpty && userLoginInfo[0] == 'Secretariat'
          ? MyPendingTasksScreen(
              deviceSize: deviceSize,
            )
          : MyPostScreen(
              deviceSize: deviceSize,
              firstTimeIndex: firstTimeIndex,
            ),
      ResearchScreen(
        deviceSize: deviceSize,
      ),
      userLoginInfo.isNotEmpty && userLoginInfo[0] == 'Secretariat'
          ? SecretariatHistoryScreen(
              deviceSize: deviceSize,
            )
          : ServiceScreen(
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
          userLoginInfo.isNotEmpty &&
                  userLoginInfo[0] == 'Entreprise' &&
                  currentState == 3
              ? IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/call.5.svg',
                  ),
                )
              : Container(),
          userLoginInfo.isNotEmpty &&
                  userLoginInfo[0] == 'Entreprise' &&
                  currentState == 3
              ? IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EntrepriseHistoryScreen(deviceSize: deviceSize),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/time-circle.4.svg',
                  ),
                )
              : Container(),
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
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
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
                      userLoginInfo.isNotEmpty &&
                              userLoginInfo[0] == 'Secretariat'
                          ? 'assets/icons/activity.6.svg'
                          : 'assets/icons/plus.svg',
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
                          userLoginInfo.isNotEmpty &&
                                  userLoginInfo[0] == 'Secretariat'
                              ? 'assets/icons/activity.2.svg'
                              : 'assets/icons/plus.3.svg',
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
                      userLoginInfo.isNotEmpty &&
                              userLoginInfo[0] == 'Secretariat'
                          ? 'assets/icons/time-circle.4.svg'
                          : 'assets/icons/buy.1.svg',
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
                          userLoginInfo.isNotEmpty &&
                                  userLoginInfo[0] == 'Secretariat'
                              ? 'assets/icons/time-circle.5.svg'
                              : 'assets/icons/buy.svg',
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

  checkUser() async {
    final bool? firstTime = UtilFunctions.getFirstTime();
    final List<String>? userInfo = UtilFunctions.getUserInfo();
    print(firstTime);
    setState(() {
      firstTimeIndex = firstTime!;
      userLoginInfo = userInfo!;
      // widget.userInfo = userInfo;
    });
  }
}
