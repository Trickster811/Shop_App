import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ndere_ads/screens/about_page.dart';
import 'package:ndere_ads/screens/components/image_view_page.dart';
import 'package:ndere_ads/utils/utils.dart';
import 'package:ndere_ads/welcome_pages/auth/disconnection.dart';
import 'package:ndere_ads/welcome_pages/auth/sign_in_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
    required this.appBarHeightSize,
    required this.deviceSize,
    required this.firstTimeIndex,
  }) : super(key: key);
  final double appBarHeightSize;
  final Size deviceSize;
  final bool? firstTimeIndex;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    List<List> menuItemList = [
      [
        'assets/icons/edit-square.6.svg',
        'Editer Compte',
        const AboutScreen(),
      ],
      [
        'assets/icons/logout.4.svg',
        'Deconnexion',
        const DeconnexionScreen(),
      ],
    ];
    final List<String> postsList = [
      'https://rukminim1.flixcart.com/image/612/612/l51d30w0/shoe/z/w/c/10-mrj1914-10-aadi-white-black-red-original-imagft9k9hydnfjp.jpeg?q=70',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH0YZh6ggzT4m0wdOK84OuihNDPGSHEuVUtwLhge3pmEPeA8k7GjZCsSSoAOgDXqzFcBI&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtaCc3GrWTcxkOL1lvXXMEDo5rVEg5DGf2LyEmxd2cYWkPTPw6gzVVdKc_3Md5Mbfz0I&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzv-wsjN5e6td-LHSyqak5TG4pdW4CcqQuTPUUpGwvDwWRVhbeBpFkpwRgZ89z_mtfOE8&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGFEzJimi75YHQQ6ClrDVpKG2ldTukwK_PIST1lklXhTmHQQI_OwGenvurqqnj3U_00c4&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9uELZlGwIYcmHNK8h4mpTLiwh-BTNv3I9f4hPNgKSLuH3v_KTJh3Ciu6K4qE3olXNvgM&usqp=CAU',
      'https://cdn.shopify.com/s/files/1/0046/9139/4658/files/SS20_HOMEPAGE_MCCLEANPAIR_880x550_crop_center.jpg?v=1614334815',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqRw1KJxR6to1NRwgUn3qZan9eWtSJXS37yC8JMJvgvqjKNpuzb7YD5ZZd3wXpFMouHHM&usqp=CAU',
      'https://cdn.shopify.com/s/files/1/0285/9873/0883/articles/leather-full-brogue-shoes-26-05-17_1.jpg?v=1581688850',
      'https://www.shoe-tease.com/wp-content/uploads/2021/10/Shoes-that-go-with-everything-ShoeTease-Blog.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZNdz-mIrSJtcSry4OKCjYGUo_zZcWqjDdMkAxHDdmbaRfjagUcB5JVNYRdByps4sABr8&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScqH7-rT4dGQyiiotOLaY6NMyUKmow4sB0h4UScgVlw_PVeIPfbAFXHaaMy0FicQ1wKqY&usqp=CAU',
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1345098657.jpg',
      'https://images.dsw.ca/is/image/dswca/113103072_120_ss_01?impolicy=colpg&imwidth=400&imdensity=1',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO3WoxUdbu67ymI1b8Jdv3JBWCo6kssA-9Zzr9Ua-Y87blL6vseVA2GTyQQfT4imz8xQQ&usqp=CAU',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Profil',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontSize: 25,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
        actions: [
          if (widget.firstTimeIndex!)
            IconButton(
              onPressed: () {
                UtilFunctions.openDialog(
                    context, menuItemList, widget.appBarHeightSize);
              },
              icon: SvgPicture.asset(
                'assets/icons/category.2.svg',
              ),
            ),
        ],
      ),
      body: widget.firstTimeIndex!
          ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                children: [
                  ClipOval(
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
                            'assets/icons/star.4.svg',
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('45.2k'),
                        ],
                      )
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
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      children: [
                        for (var item in postsList)
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImageViewScreen(
                                    imageLink: [item],
                                    deviceSize: widget.deviceSize,
                                  ),
                                ),
                              );
                            },
                            child: FadeInImage.assetNetwork(
                              height: 150,
                              width: 150,
                              placeholder: 'assets/images/2.png',
                              placeholderFit: BoxFit.cover,
                              image: item,
                              fit: BoxFit.cover,
                              imageErrorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Connecter pour pouvoir poster des annonces ou publicités",
                    textScaleFactor: 1.2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(
                            userInfo: [],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
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
                          const SizedBox(
                            width: 15.0,
                          ),
                          const Text(
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
            ),
    );
  }
}
