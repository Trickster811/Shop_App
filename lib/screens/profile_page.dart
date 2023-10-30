import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:ndere_ads/screens/components/image_view_page.dart';
import 'package:ndere_ads/screens/home_page.dart';
import 'package:ndere_ads/utils/utils.dart';
import 'package:ndere_ads/welcome_pages/auth/disconnection.dart';
import 'package:ndere_ads/welcome_pages/auth/sign_in_page.dart';

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
    final List<AdsObjets> postsList = [
      const AdsObjets(
        imageLink: [
          'https://rukminim1.flixcart.com/image/612/612/l51d30w0/shoe/z/w/c/10-mrj1914-10-aadi-white-black-red-original-imagft9k9hydnfjp.jpeg?q=70',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH0YZh6ggzT4m0wdOK84OuihNDPGSHEuVUtwLhge3pmEPeA8k7GjZCsSSoAOgDXqzFcBI&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtaCc3GrWTcxkOL1lvXXMEDo5rVEg5DGf2LyEmxd2cYWkPTPw6gzVVdKc_3Md5Mbfz0I&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzv-wsjN5e6td-LHSyqak5TG4pdW4CcqQuTPUUpGwvDwWRVhbeBpFkpwRgZ89z_mtfOE8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGFEzJimi75YHQQ6ClrDVpKG2ldTukwK_PIST1lklXhTmHQQI_OwGenvurqqnj3U_00c4&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9uELZlGwIYcmHNK8h4mpTLiwh-BTNv3I9f4hPNgKSLuH3v_KTJh3Ciu6K4qE3olXNvgM&usqp=CAU',
        ],
        productName: 'Baskets',
        productPrice: 0.25,
        location: 'Bini - Dang',
        traderName: 'Julie Queen',
        traderPhoneNumber: 690786195,
        traderWhatsappNumber: 690786195,
        tradeCategory: 'Commerce',
      ),
      const AdsObjets(
        imageLink: [
          'https://cdn.shopify.com/s/files/1/0046/9139/4658/files/SS20_HOMEPAGE_MCCLEANPAIR_880x550_crop_center.jpg?v=1614334815',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqRw1KJxR6to1NRwgUn3qZan9eWtSJXS37yC8JMJvgvqjKNpuzb7YD5ZZd3wXpFMouHHM&usqp=CAU',
          'https://cdn.shopify.com/s/files/1/0285/9873/0883/articles/leather-full-brogue-shoes-26-05-17_1.jpg?v=1581688850',
        ],
        productName: 'Paires Cirées',
        productPrice: 0.25,
        location: 'Bini - Dang',
        traderName: 'Julie Queen',
        traderPhoneNumber: 690786195,
        traderWhatsappNumber: 690786195,
        tradeCategory: 'Offre Service',
      ),
      const AdsObjets(
        imageLink: [
          'https://rukminim1.flixcart.com/image/612/612/l51d30w0/shoe/z/w/c/10-mrj1914-10-aadi-white-black-red-original-imagft9k9hydnfjp.jpeg?q=70',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH0YZh6ggzT4m0wdOK84OuihNDPGSHEuVUtwLhge3pmEPeA8k7GjZCsSSoAOgDXqzFcBI&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtaCc3GrWTcxkOL1lvXXMEDo5rVEg5DGf2LyEmxd2cYWkPTPw6gzVVdKc_3Md5Mbfz0I&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzv-wsjN5e6td-LHSyqak5TG4pdW4CcqQuTPUUpGwvDwWRVhbeBpFkpwRgZ89z_mtfOE8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGFEzJimi75YHQQ6ClrDVpKG2ldTukwK_PIST1lklXhTmHQQI_OwGenvurqqnj3U_00c4&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9uELZlGwIYcmHNK8h4mpTLiwh-BTNv3I9f4hPNgKSLuH3v_KTJh3Ciu6K4qE3olXNvgM&usqp=CAU',
        ],
        productName: 'Baskets',
        productPrice: 0.25,
        location: 'Bini - Dang',
        traderName: 'Julie Queen',
        traderPhoneNumber: 690786195,
        traderWhatsappNumber: 690786195,
        tradeCategory: 'Commerce',
      ),
      const AdsObjets(
        imageLink: [
          'https://www.shoe-tease.com/wp-content/uploads/2021/10/Shoes-that-go-with-everything-ShoeTease-Blog.jpg',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZNdz-mIrSJtcSry4OKCjYGUo_zZcWqjDdMkAxHDdmbaRfjagUcB5JVNYRdByps4sABr8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScqH7-rT4dGQyiiotOLaY6NMyUKmow4sB0h4UScgVlw_PVeIPfbAFXHaaMy0FicQ1wKqY&usqp=CAU',
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1345098657.jpg',
          'https://images.dsw.ca/is/image/dswca/113103072_120_ss_01?impolicy=colpg&imwidth=400&imdensity=1',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO3WoxUdbu67ymI1b8Jdv3JBWCo6kssA-9Zzr9Ua-Y87blL6vseVA2GTyQQfT4imz8xQQ&usqp=CAU',
        ],
        productName: 'Féminin',
        productPrice: 0.25,
        location: 'Bini - Dang',
        traderName: 'Julie Queen',
        traderPhoneNumber: 690786195,
        traderWhatsappNumber: 690786195,
        tradeCategory: 'Formation',
      ),
      const AdsObjets(
        imageLink: [
          'https://cdn.shopify.com/s/files/1/0046/9139/4658/files/SS20_HOMEPAGE_MCCLEANPAIR_880x550_crop_center.jpg?v=1614334815',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqRw1KJxR6to1NRwgUn3qZan9eWtSJXS37yC8JMJvgvqjKNpuzb7YD5ZZd3wXpFMouHHM&usqp=CAU',
          'https://cdn.shopify.com/s/files/1/0285/9873/0883/articles/leather-full-brogue-shoes-26-05-17_1.jpg?v=1581688850',
        ],
        productName: 'Paires Cirées',
        productPrice: 0.25,
        location: 'Bini - Dang',
        traderName: 'Julie Queen',
        traderPhoneNumber: 690786195,
        traderWhatsappNumber: 690786195,
        tradeCategory: 'Offre Service',
      ),
      const AdsObjets(
        imageLink: [
          'https://www.shoe-tease.com/wp-content/uploads/2021/10/Shoes-that-go-with-everything-ShoeTease-Blog.jpg',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZNdz-mIrSJtcSry4OKCjYGUo_zZcWqjDdMkAxHDdmbaRfjagUcB5JVNYRdByps4sABr8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScqH7-rT4dGQyiiotOLaY6NMyUKmow4sB0h4UScgVlw_PVeIPfbAFXHaaMy0FicQ1wKqY&usqp=CAU',
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1345098657.jpg',
          'https://images.dsw.ca/is/image/dswca/113103072_120_ss_01?impolicy=colpg&imwidth=400&imdensity=1',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO3WoxUdbu67ymI1b8Jdv3JBWCo6kssA-9Zzr9Ua-Y87blL6vseVA2GTyQQfT4imz8xQQ&usqp=CAU',
        ],
        productName: 'Féminin',
        productPrice: 0.25,
        location: 'Bini - Dang',
        traderName: 'Julie Queen',
        traderPhoneNumber: 690786195,
        traderWhatsappNumber: 690786195,
        tradeCategory: 'Formation',
      ),
      const AdsObjets(
        imageLink: [
          'https://rukminim1.flixcart.com/image/612/612/l51d30w0/shoe/z/w/c/10-mrj1914-10-aadi-white-black-red-original-imagft9k9hydnfjp.jpeg?q=70',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH0YZh6ggzT4m0wdOK84OuihNDPGSHEuVUtwLhge3pmEPeA8k7GjZCsSSoAOgDXqzFcBI&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtaCc3GrWTcxkOL1lvXXMEDo5rVEg5DGf2LyEmxd2cYWkPTPw6gzVVdKc_3Md5Mbfz0I&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzv-wsjN5e6td-LHSyqak5TG4pdW4CcqQuTPUUpGwvDwWRVhbeBpFkpwRgZ89z_mtfOE8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGFEzJimi75YHQQ6ClrDVpKG2ldTukwK_PIST1lklXhTmHQQI_OwGenvurqqnj3U_00c4&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9uELZlGwIYcmHNK8h4mpTLiwh-BTNv3I9f4hPNgKSLuH3v_KTJh3Ciu6K4qE3olXNvgM&usqp=CAU',
        ],
        productName: 'Baskets',
        productPrice: 0.25,
        location: 'Bini - Dang',
        traderName: 'Julie Queen',
        traderPhoneNumber: 690786195,
        traderWhatsappNumber: 690786195,
        tradeCategory: 'Commerce',
      ),
      const AdsObjets(
        imageLink: [
          'https://www.shoe-tease.com/wp-content/uploads/2021/10/Shoes-that-go-with-everything-ShoeTease-Blog.jpg',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZNdz-mIrSJtcSry4OKCjYGUo_zZcWqjDdMkAxHDdmbaRfjagUcB5JVNYRdByps4sABr8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScqH7-rT4dGQyiiotOLaY6NMyUKmow4sB0h4UScgVlw_PVeIPfbAFXHaaMy0FicQ1wKqY&usqp=CAU',
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1345098657.jpg',
          'https://images.dsw.ca/is/image/dswca/113103072_120_ss_01?impolicy=colpg&imwidth=400&imdensity=1',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO3WoxUdbu67ymI1b8Jdv3JBWCo6kssA-9Zzr9Ua-Y87blL6vseVA2GTyQQfT4imz8xQQ&usqp=CAU',
        ],
        productName: 'Féminin',
        productPrice: 0.25,
        location: 'Bini - Dang',
        traderName: 'Julie Queen',
        traderPhoneNumber: 690786195,
        traderWhatsappNumber: 690786195,
        tradeCategory: 'Formation',
      ),
      const AdsObjets(
        imageLink: [
          'https://cdn.shopify.com/s/files/1/0046/9139/4658/files/SS20_HOMEPAGE_MCCLEANPAIR_880x550_crop_center.jpg?v=1614334815',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqRw1KJxR6to1NRwgUn3qZan9eWtSJXS37yC8JMJvgvqjKNpuzb7YD5ZZd3wXpFMouHHM&usqp=CAU',
          'https://cdn.shopify.com/s/files/1/0285/9873/0883/articles/leather-full-brogue-shoes-26-05-17_1.jpg?v=1581688850',
        ],
        productName: 'Paires Cirées',
        productPrice: 0.25,
        location: 'Bini - Dang',
        traderName: 'Julie Queen',
        traderPhoneNumber: 690786195,
        traderWhatsappNumber: 690786195,
        tradeCategory: 'Offre Service',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: Text(DateTime.now().toIso8601String()),
                ),
              ),
              child: const Text(
                "Premium Account",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
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
            const Text("JULIE'S COLLECTION"),
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
                      color: Colors.red,
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
                      color: primaryColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('45.2k'),
                  ],
                ),
                const Text('|'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
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
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: primaryColor,
                ),
              ),
              child: const Text(
                'MES PUBLICATIONS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.spaceEvenly,
              children: [
                for (var adsObjets in postsList)
                  FocusedMenuHolder(
                    menuItems: [
                      FocusedMenuItem(
                        title: const Text(
                          'Edit',
                        ),
                        trailingIcon: const Icon(
                          Icons.edit,
                          color: primaryColor,
                        ),
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                      ),
                      FocusedMenuItem(
                        title: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                        trailingIcon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        backgroundColor: Colors.transparent,
                        onPressed: () {},
                      ),
                    ],
                    // duration: Duration(seconds: 0),
                    animateMenuItems: true,
                    openWithTap: false,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageViewScreen(
                          imageLink: adsObjets.imageLink,
                          deviceSize: widget.deviceSize,
                        ),
                      ),
                    ),
                    menuWidth: MediaQuery.of(context).size.width * 0.5,
                    menuOffset: 8,
                    menuItemExtent: 40,
                    menuBoxDecoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white,
                    ),
                    blurSize: 1,
                    child: SizedBox(
                      height: 110,
                      width: 110,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/2.png',
                        image: adsObjets.imageLink[0],
                        fit: BoxFit.cover,
                        placeholderFit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          'assets/images/2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
// widget.userLoginInfo.isNotEmpty
        