import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:ndere_ads/screens/components/details_post_page.dart';
import 'package:ndere_ads/screens/components/image_view_page.dart';
import 'package:ndere_ads/utils/utils.dart';
// import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

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
  String currentDisplayedCategory = 'All';
  Future<void> _handleScreenRefreshing() async {
    return await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> toolBarElement = [
      'All',
      'Commerce',
      'Offre Service',
      'Formation',
    ];
    final List test = [
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
    ];

    return Column(
      children: [
        SingleChildScrollView(
          // controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                for (var item in toolBarElement) toolBarElementBuilder(item),
              ],
            ),
          ),
        ),
        Expanded(
          child: LiquidPullToRefresh(
            onRefresh: _handleScreenRefreshing,
            color: primaryColor,
            height: 300,
            animSpeedFactor: 2.0,
            showChildOpacityTransition: false,
            child: ListView.builder(
              itemCount: test.length,
              itemBuilder: (context, index) => AdsItemBuilder(
                adsObjets: test[index],
                deviceSize: widget.deviceSize,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget toolBarElementBuilder(String title) {
    return InkWell(
      onTap: () async {
        setState(() {});
        // var ads = await UtilFunctions.showAppodealRewardedVideoAds();
        // if (ads == 1)
        //   UtilFunctions.showFlashMessage(
        //     context,
        //     'Appodeal not ready to Show Ads',
        //     Colors.white60,
        //     widget.deviceSize,
        //   );
        // if (ads == 2)
        //   UtilFunctions.showFlashMessage(
        //     context,
        //     'Failed to Show Ads',
        //     Colors.white60,
        //     widget.deviceSize,
        //   );
      },
      child: Row(
        children: [
          const SizedBox(
            width: 05,
          ),
          Container(
            height: 40,
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 05,
          ),
        ],
      ),
    );
  }

  Widget detailsItemBuilder(String title, String description) {
    return Column(
      children: [
        Row(
          children: [
            Text(title),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                description,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

class AdsItemBuilder extends StatelessWidget {
  const AdsItemBuilder({
    Key? key,
    required this.adsObjets,
    required this.deviceSize,
  }) : super(key: key);
  final AdsObjets adsObjets;
  final Size deviceSize;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      height: 300,
      width: deviceSize.width,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: adsObjets.imageLink.length,
            options: CarouselOptions(
              autoPlayInterval: const Duration(
                seconds: 4,
              ),
              viewportFraction: 1,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              height: 175,
              autoPlay: true,
            ),
            itemBuilder: (context, index, realIndex) {
              final image = adsObjets.imageLink[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageViewScreen(
                        imageLink: adsObjets.imageLink,
                        deviceSize: deviceSize,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 175,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/2.png',
                      image: image,
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
              );
            },
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 125,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
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
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 05,
                          ),
                          const Text(
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
                            'XAF ${adsObjets.productPrice}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 05,
                          ),
                          const Text(
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
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 05,
                          ),
                          const Text(
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
              ),
              Container(
                height: 125,
                width: (deviceSize.width - 20) * .35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.03),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPostScreen(
                            adsObjets: adsObjets,
                            deviceSize: deviceSize,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('125.5k'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          SvgPicture.asset(
                            'assets/icons/heart.5.svg',
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPostScreen(
                            adsObjets: adsObjets,
                            deviceSize: deviceSize,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('15.5k'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          SvgPicture.asset(
                            'assets/icons/3-user.1.svg',
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () =>
                          // showDetails(context, adsObjets);
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPostScreen(
                            adsObjets: adsObjets,
                            deviceSize: deviceSize,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: const Text(
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
}

class AdsObjets {
  final List<String> imageLink;
  final String productName;
  final double productPrice;
  final String location;
  final String traderName;
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
    required this.traderPhoneNumber,
    required this.traderWhatsappNumber,
    required this.tradeCategory,
  });
}
