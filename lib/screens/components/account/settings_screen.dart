import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      // const ThemeScreen(),
      // LanguageScreen(
      //   userInfo: widget.userInfo,
      // ),
    ];

    final List<AccountSetting> accountItem_1 = [
      const AccountSetting(
        title: 'Thèmes',
        icon: 'assets/icons/discount.5.svg',
        color: Colors.green,
        pageRoute: 0,
      ),
    ];
    final List<AccountSetting> accountItem_2 = [
      const AccountSetting(
        title: 'Langue',
        icon: 'assets/icons/language.svg',
        color: Colors.yellow,
        pageRoute: 1,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
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
        title: Text(
          'Paramètres',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Application',
                style: TextStyle(
                  // color: kPrimaryColor,
                  fontSize: 15,
                  fontFamily: 'Comfortaa_bold',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  // height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).iconTheme.color!.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      for (final element in accountItem_1)
                        subSettingsElement(
                          context,
                          element,
                          accountItem_1,
                          screens,
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Langues',
                style: TextStyle(
                  // color: kPrimaryColor,
                  fontSize: 15,
                  fontFamily: 'Comfortaa_bold',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  // height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).iconTheme.color!.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      for (final element in accountItem_2)
                        subSettingsElement(
                          context,
                          element,
                          accountItem_2,
                          screens,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget subSettingsElement(BuildContext context, AccountSetting element,
      List<AccountSetting> accountItem, List<Widget> screens) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => screens[element.pageRoute]),
        ),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 40,
            child: SvgPicture.asset(
              element.icon,
              colorFilter: ColorFilter.mode(
                element.color,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              // color: Colors.red,
              height: 50,
              decoration: element != accountItem.last
                  ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context)
                              .iconTheme
                              .color!
                              .withOpacity(0.4),
                        ),
                      ),
                    )
                  : const BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    element.title,
                    style: const TextStyle(
                      // color: kPrimaryColor,
                      fontSize: 15,
                      fontFamily: 'Comfortaa_regular',
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/arrow-right-2.4.svg',
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).iconTheme.color!.withOpacity(0.7),
                      BlendMode.srcIn,
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
}

class AccountSetting {
  final String title, icon;
  final Color color;
  final int pageRoute;

  const AccountSetting({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.pageRoute,
  });
}
