import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:shop_app/screens/components/account/about_page.dart';
import 'package:shop_app/screens/components/account/help_page.dart';
import 'package:shop_app/screens/components/account/policy_page.dart';
import 'package:shop_app/screens/components/account/settings_screen.dart';
import 'package:shop_app/screens/components/account/updates_pages.dart';
import 'package:shop_app/screens/components/image_view_page.dart';
import 'package:shop_app/screens/shop_page.dart';
import 'package:shop_app/utils/utils.dart';
import 'package:shop_app/welcome_pages/auth/disconnection.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
    required this.appBarHeightSize,
    required this.deviceSize,
    required this.userLoginInfo,
  }) : super(key: key);
  final double appBarHeightSize;
  final Size deviceSize;
  final List<String> userLoginInfo;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const PolicyScreen(),
      const HelpScreen(),
      const UpdateScreen(),
      const AboutScreen(),
      const DeconnexionScreen(),
    ];
    final List<AccountSetting> accountItem_2 = [
      const AccountSetting(
        title: 'Paramètres',
        icon: 'assets/icons/setting.6.svg',
        color: Colors.blueGrey,
        pageRoute: 0,
      ),
      const AccountSetting(
        title: 'Police Privée',
        icon: 'assets/icons/shield-done.4.svg',
        color: Colors.lightBlue,
        pageRoute: 1,
      ),
      const AccountSetting(
        title: 'Aide',
        icon: 'assets/icons/bookmark.5.svg',
        color: Colors.purple,
        pageRoute: 2,
      ),
      const AccountSetting(
        title: 'Mise à jour',
        icon: 'assets/icons/arrow-up-square.2.svg',
        color: Colors.green,
        pageRoute: 3,
      ),
      const AccountSetting(
        title: 'A propos',
        icon: 'assets/icons/info-square.3.svg',
        color: Colors.blue,
        pageRoute: 4,
      ),
      const AccountSetting(
        title: 'Déconnexion',
        icon: 'assets/icons/logout.svg',
        color: Colors.red,
        pageRoute: 5,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text(
                    'Profile Picture',
                  ),
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              ),
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  height: 150,
                  width: 150,
                  placeholder: 'assets/images/2.png',
                  placeholderFit: BoxFit.cover,
                  image:
                      'https://cdn.shopify.com/s/files/1/0046/9139/4658/files/SS20_HOMEPAGE_MCCLEANPAIR_880x550_crop_center.jpg?v=1614334815',
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset(
                    'assets/images/2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: primaryColor,
                ),
              ),
              child: const Text(
                'BUTTERFLY',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/heart.5.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.red,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('15.2k'),
                  ],
                ),
                const Text('|'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/3-user.1.svg',
                      colorFilter: const ColorFilter.mode(
                        primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('45.2k'),
                  ],
                ),
                const Text('|'),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('240'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Publi...'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  for (final element in accountItem_2)
                    settingsElement(
                      context,
                      element,
                      accountItem_2,
                      screens,
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }

  Widget settingsElement(BuildContext context, AccountSetting element,
      List<AccountSetting> accountItem, List screens) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => screens[element.pageRoute]),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).iconTheme.color!.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 30,
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
              child: SizedBox(
                // color: Colors.red,
                height: 50,
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
      ),
    );
  }
}
