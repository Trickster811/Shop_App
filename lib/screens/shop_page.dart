import 'package:card_loading/card_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:b_shop/screens/components/post/details_post_page.dart';
import 'package:b_shop/screens/components/image_view_page.dart';
import 'package:b_shop/utils/controllers.utils.dart';
import 'package:b_shop/utils/utils.dart';
// import 'package:stack_appodeal_flutter/stack_appodeal_flutter.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({
    super.key,
    required this.deviceSize,
  });
  final Size deviceSize;

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int documentLimit = 15;

  // Check the app is currently fetching articles data
  bool isFetchingArticles = false;

  // Check the app is currently fetching Catrgories data
  bool isFetchingCategories = false;

  // To check if have remaining category data in our cloud firestore
  bool _hasNextCategory = true;

  // To check if have remaining article data in our cloud firestore
  bool _hasNextArticle = true;

  final scrollController = ScrollController();
  bool internetAccess = true;

  // List of categories
  List<DocumentSnapshot<Object?>> categoryToDisplay = Category.categorySnapshot;

  // The current displayed category
  String currentDisplayedCategory = '*';

  // List of articles to display depending on the filter configuration
  List<DocumentSnapshot<Object?>> articlesToDisplay = [];

  Future<void> _handleScreenRefreshing() async {
    articlesToDisplay = [];
    Article.articlesSnapshot = [];
    retreiveArticles();
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    if (Category.categorySnapshot.isEmpty) retreiveCategories();
    if (Article.articlesSnapshot.isNotEmpty) {
      filterArticlesForDisplay();
    } else {
      retreiveArticles();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >=
            scrollController.position.maxScrollExtent / 2 &&
        !scrollController.position.outOfRange &&
        _hasNextArticle) {
      retreiveArticles();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          // controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: !internetAccess
                ? Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/no-internet.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).iconTheme.color!,
                            BlendMode.srcIn,
                          ),
                          height: 75,
                          width: 75,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Pas d\'accès internet',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          // alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).iconTheme.color,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                internetAccess = true;
                              });
                              retreiveCategories();
                            },
                            child: Text(
                              'Réessayer',
                              style: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : categoryToDisplay.isEmpty && !_hasNextCategory
                    ? Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          onTap: retreiveCategories,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/no-data.svg',
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).iconTheme.color!,
                                  BlendMode.srcIn,
                                ),
                                height: 75,
                                width: 75,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Aucune Category à afficher',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                // alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0,
                                  vertical: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).iconTheme.color,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  'Actualiser',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          for (var item in categoryToDisplay)
                            toolBarElementBuilder(item['name']),
                          if (_hasNextArticle)
                            Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(),
                              child: const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                        ],
                      ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: LiquidPullToRefresh(
                onRefresh: _handleScreenRefreshing,
                // color: primaryColor,
                height: 300,
                animSpeedFactor: 2.0,
                showChildOpacityTransition: false,
                child: !internetAccess
                    ? Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/no-internet.svg',
                              colorFilter: const ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              ),
                              height: 75,
                              width: 75,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Pas d\'accès internet',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              // alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40.0,
                                vertical: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).iconTheme.color,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    internetAccess = true;
                                  });
                                  // retreiveHomes();
                                },
                                child: Text(
                                  'Réessayer',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : articlesToDisplay.isEmpty && !_hasNextArticle
                        ? Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height / 1.5,
                            width: MediaQuery.of(context).size.width,
                            child: GestureDetector(
                              onTap: retreiveArticles,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/no-data.svg',
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context).iconTheme.color!,
                                      BlendMode.srcIn,
                                    ),
                                    height: 75,
                                    width: 75,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Aucune Article à afficher',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0,
                                      vertical: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).iconTheme.color,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(
                                      'Actualiser',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              for (DocumentSnapshot item in articlesToDisplay)
                                if (item['isPublished'])
                                  adsItemBuilder(
                                    adsObjects: AdsObjects(
                                      idArticle: item.id,
                                      imageLink: item['imageLink'],
                                      productDescription:
                                          item['productDescription'],
                                      isPublished: item['isPublished'],
                                      productName: item['productName'],
                                      productPrice:
                                          double.parse(item['productPrice']),
                                      quantity: int.parse(item['quantity']),
                                      tradeCategory: item['tradeCategory'],
                                      productSpecifications:
                                          item['productSpecifications'],
                                      tradeFamily: item['tradeFamily'],
                                      ownerRef: item['ownerReference'],
                                    ),
                                    deviceSize: widget.deviceSize,
                                  ),
                              if (_hasNextArticle) ...[
                                for (var i = 0; i < 10; i++)
                                  cardLoadingBuilder(),
                              ]
                            ],
                          )),
          ),
        ),
      ],
    );
  }

  Widget toolBarElementBuilder(String title) {
    return InkWell(
      onTap: () async {
        setState(() {
          currentDisplayedCategory = title;
        });
        filterArticlesForDisplay();
      },
      child: Row(
        children: [
          const SizedBox(
            width: 05,
          ),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5.0),
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

  Widget adsItemBuilder(
      {required AdsObjects adsObjects, required Size deviceSize}) {
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
            itemCount: adsObjects.imageLink.length,
            options: CarouselOptions(
              autoPlayInterval: const Duration(
                seconds: 5,
              ),
              viewportFraction: 1,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              height: 175,
              autoPlay: true,
            ),
            itemBuilder: (context, index, realIndex) {
              final image = adsObjects.imageLink[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageViewScreen(
                        imageLink: adsObjects.imageLink,
                        deviceSize: deviceSize,
                        fileImage: false,
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
                            adsObjects.productName,
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
                            'XAF ${adsObjects.productPrice}',
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
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ngaoundere',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 05,
                          ),
                          Text(
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
                            adsObjects: adsObjects,
                            deviceSize: deviceSize,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(UtilFunctions.formatLikeCount(135098)),
                          const SizedBox(
                            width: 10.0,
                          ),
                          SvgPicture.asset(
                            'assets/icons/heart.5.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.red,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPostScreen(
                            adsObjects: adsObjects,
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
                            colorFilter: const ColorFilter.mode(
                              primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () =>
                          // showDetails(context, adsObjects);
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPostScreen(
                            adsObjects: adsObjects,
                            deviceSize: deviceSize,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 5.0,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(
                            5.0,
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

  Future retreiveCategories() async {
    if (!await Internet.checkInternetAccess()) {
      setState(() {
        internetAccess = false;
      });
      return;
    }

    if (isFetchingCategories) return;
    setState(() {
      isFetchingCategories = true;
    });

    if (!_hasNextCategory) {
      setState(() {
        _hasNextCategory = true;
      });
    }

    try {
      await Category.getCategories(
        documentLimit,
        startAfter: Category.categorySnapshot.isNotEmpty
            ? Category.categorySnapshot.last
            : null,
      );
      if (Category.categorySnapshot.length < documentLimit) {
        setState(() {
          _hasNextCategory = false;
        });
      }
    } on FirebaseException catch (errno) {
      debugPrint(errno.code.toString());
      UtilFunctions.showFlashMessage(
        errno.message.toString(),
        Colors.red,
      );
      setState(() {
        _hasNextCategory = false;
      });
    }
    setState(() {
      isFetchingCategories = false;
    });
  }

  Future retreiveArticles() async {
    if (!await Internet.checkInternetAccess()) {
      setState(() {
        internetAccess = false;
      });
      return;
    }

    if (isFetchingArticles) return;
    setState(() {
      isFetchingArticles = true;
    });

    if (!_hasNextArticle) {
      setState(() {
        _hasNextArticle = true;
      });
    }

    try {
      // if (refresh) {
      // await HomeFinder.getHomes(
      //   documentLimit,
      // );
      // } else {
      await Article.getArticles(
        documentLimit,
        startAfter: Article.articlesSnapshot.isNotEmpty
            ? Article.articlesSnapshot.last
            : null,
      );
      // }
      if (Article.articlesSnapshot.isNotEmpty) {
        filterArticlesForDisplay();
      }
      if (Article.articlesSnapshot.length < documentLimit) {
        setState(() {
          _hasNextArticle = false;
        });
      }
    } on FirebaseException catch (errno) {
      debugPrint(errno.code.toString());
      UtilFunctions.showFlashMessage(
        errno.message.toString(),
        Colors.red,
      );
      setState(() {
        _hasNextArticle = false;
      });
    }
    setState(() {
      isFetchingArticles = false;
    });
  }

  Future filterArticlesForDisplay() async {
    articlesToDisplay = [];
    articlesToDisplay.addAll(
      Article.articlesSnapshot.where(
        (house) {
          if (currentDisplayedCategory == '*') return true;
          return house['tradeCategory'].toString().toLowerCase() ==
              currentDisplayedCategory.toString().toLowerCase();
        },
      ),
    );

    // setState(() {});
  }

  Container cardLoadingBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      height: 290,
      child: const Column(
        children: [
          CardLoading(
            height: 220,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            cardLoadingTheme: CardLoadingTheme(
              colorOne: Color(0xFFE5E5E5),
              colorTwo: Color(0xFFF0F0F0),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardLoading(
                      height: 10,
                      width: 100,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      cardLoadingTheme: CardLoadingTheme(
                        colorOne: Color(0xFFE5E5E5),
                        colorTwo: Color(0xFFF0F0F0),
                      ),
                    ),
                    CardLoading(
                      height: 10,
                      width: 60,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      cardLoadingTheme: CardLoadingTheme(
                        colorOne: Color(0xFFE5E5E5),
                        colorTwo: Color(0xFFF0F0F0),
                      ),
                    ),
                    CardLoading(
                      height: 10,
                      width: 90,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      cardLoadingTheme: CardLoadingTheme(
                        colorOne: Color(0xFFE5E5E5),
                        colorTwo: Color(0xFFF0F0F0),
                      ),
                    ),
                  ],
                ),
                CardLoading(
                  height: 30,
                  width: 150,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  cardLoadingTheme: CardLoadingTheme(
                    colorOne: Color(0xFFE5E5E5),
                    colorTwo: Color(0xFFF0F0F0),
                  ),
                ),
                CardLoading(
                  height: 60,
                  width: 70,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  cardLoadingTheme: CardLoadingTheme(
                    colorOne: Color(0xFFE5E5E5),
                    colorTwo: Color(0xFFF0F0F0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AdsObjects {
  final String idArticle;
  final String productDescription;
  final List<dynamic> imageLink;
  final bool isPublished;
  final String productName;
  final double productPrice;
  final int quantity;
  final Map<String, dynamic>? productSpecifications;
  final String? tradeFamily;
  final String tradeCategory;
  final DocumentReference ownerRef;

  const AdsObjects({
    Key? key,
    required this.idArticle,
    required this.productDescription,
    required this.imageLink,
    required this.isPublished,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.productSpecifications,
    required this.tradeFamily,
    required this.tradeCategory,
    required this.ownerRef,
  });
}
