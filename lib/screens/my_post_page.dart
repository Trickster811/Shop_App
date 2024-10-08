import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shop_app/screens/components/image_view_page.dart';
import 'package:shop_app/screens/components/new_post_page.dart';
import 'package:shop_app/screens/shop_page.dart';
import 'package:shop_app/utils/utils.dart';
import 'package:shop_app/welcome_pages/start_page.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({
    Key? key,
    required this.deviceSize,
    required this.userLoginInfo,
  }) : super(key: key);
  final Size deviceSize;
  final Map<String, dynamic> userLoginInfo;

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen>
    with TickerProviderStateMixin {
  // Variables to get user entries
  String? userType;
  final name = TextEditingController();
  final location = TextEditingController();
  final phone = TextEditingController();
  final whatsapp = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  // Variables to get user payment info
  String? paymentMethod;
  final paymentphone = TextEditingController();
  final paymentName = TextEditingController();

  // Payment form key
  final paymentFormKey = GlobalKey<FormState>();

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(
      seconds: 5,
    ),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userLoginInfo.isNotEmpty &&
        widget.userLoginInfo[0] != 'Client') {
      return Stack(
        children: [
          Container(
            height: widget.deviceSize.height,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  adsItemBuilder(
                    context,
                    const AdsObjects(
                      imageLink: [
                        'https://rukminim1.flixcart.com/image/612/612/l51d30w0/shoe/z/w/c/10-mrj1914-10-aadi-white-black-red-original-imagft9k9hydnfjp.jpeg?q=70',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH0YZh6ggzT4m0wdOK84OuihNDPGSHEuVUtwLhge3pmEPeA8k7GjZCsSSoAOgDXqzFcBI&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtaCc3GrWTcxkOL1lvXXMEDo5rVEg5DGf2LyEmxd2cYWkPTPw6gzVVdKc_3Md5Mbfz0I&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzv-wsjN5e6td-LHSyqak5TG4pdW4CcqQuTPUUpGwvDwWRVhbeBpFkpwRgZ89z_mtfOE8&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGFEzJimi75YHQQ6ClrDVpKG2ldTukwK_PIST1lklXhTmHQQI_OwGenvurqqnj3U_00c4&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9uELZlGwIYcmHNK8h4mpTLiwh-BTNv3I9f4hPNgKSLuH3v_KTJh3Ciu6K4qE3olXNvgM&usqp=CAU',
                      ],
                      productName: 'HP Elite Book',
                      productPrice: 0.25,
                      tradeFamily: 'HP',
                      productDescription:
                          'Ordinateur neuf avec carton et facture. Prix non negociable.',
                      quantity: 17,
                      productSpecifications: {
                        'CPU': '2.5 GHz',
                        'RAM': '8Go',
                      },
                      tradeCategory: 'Ordinateurs',
                      isPublished: true,
                    ),
                  ),
                  adsItemBuilder(
                    context,
                    const AdsObjects(
                      imageLink: [
                        'https://cdn.shopify.com/s/files/1/0046/9139/4658/files/SS20_HOMEPAGE_MCCLEANPAIR_880x550_crop_center.jpg?v=1614334815',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqRw1KJxR6to1NRwgUn3qZan9eWtSJXS37yC8JMJvgvqjKNpuzb7YD5ZZd3wXpFMouHHM&usqp=CAU',
                        'https://cdn.shopify.com/s/files/1/0285/9873/0883/articles/leather-full-brogue-shoes-26-05-17_1.jpg?v=1581688850',
                      ],
                      productName: 'Paires Cirées',
                      productPrice: 0.25,
                      tradeFamily: 'HP',
                      productDescription:
                          'Telephone neuf avec carton et facture. Prix non negociable.',
                      quantity: 17,
                      productSpecifications: {
                        'CPU': '2.5 GHz',
                        'RAM': '8 Go',
                        'ROM': '128 Go',
                      },
                      tradeCategory: 'Telephones',
                      isPublished: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            right: 20,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPostScreen(
                      deviceSize: widget.deviceSize,
                    ),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Abonnez-vous à",
            textScaler: TextScaler.linear(1.2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Shop App",
            textScaler: TextScaler.linear(1.2),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Et poster vos annonces et publicités\nà seulement",
            textScaler: TextScaler.linear(1.2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 100,
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => Transform.rotate(
              angle: _animationController.value * 2.0 * math.pi,
              child: Container(
                height: 100,
                width: 250,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'XAF',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '3000',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '/mois',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20,
                    ),
                    topRight: Radius.circular(
                      20,
                    ),
                  ),
                ),
                builder: (context) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Form(
                    key: paymentFormKey,
                    child: Column(
                      children: [
                        Container(
                          height: 5,
                          width: 50,
                          margin: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(
                              1000,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Text(
                                    'Veuillez Completer vos informations'),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  child: Text('Utilisateur'),
                                ),
                                DropdownButtonFormField(
                                  style: const TextStyle(
                                    fontSize: 10,
                                    height: 0.5,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                      left: 10.0,
                                      bottom: 10.0,
                                    ),
                                    filled: true,
                                    fillColor: primaryColor.withOpacity(0.1),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: 'choose',
                                  ),
                                  value: userType,
                                  validator: (value) => value == null
                                      ? 'Veuillez choisir un type'
                                      : null,
                                  items: const <DropdownMenuItem<String>>[
                                    DropdownMenuItem(
                                      value: "Entreprise",
                                      child: Text(
                                        "Entreprise",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 16,
                                          fontFamily: 'Monstserrat',
                                        ),
                                      ),
                                    ),
                                  ],
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      userType = newValue!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text('Entreprise'),
                                ),
                                TextFormField(
                                  controller: name,
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: 'nom entreprise',
                                    contentPadding: const EdgeInsets.only(
                                      left: 10.0,
                                      bottom: 10.0,
                                    ),
                                    filled: true,
                                    fillColor: primaryColor.withOpacity(0.1),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  validator: RequiredValidator(
                                    errorText:
                                        'Veuillez renseigner cet élément',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text('Siège'),
                                ),
                                TextFormField(
                                  controller: location,
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: 'localisation',
                                    contentPadding: const EdgeInsets.only(
                                      left: 10.0,
                                      bottom: 10.0,
                                    ),
                                    filled: true,
                                    fillColor: primaryColor.withOpacity(0.1),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  validator: RequiredValidator(
                                    errorText:
                                        'Veuillez renseigner cet élément',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text('Téléphone'),
                                ),
                                TextFormField(
                                  controller: phone,
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'votre numéro',
                                    contentPadding: const EdgeInsets.only(
                                      left: 10.0,
                                      bottom: 10.0,
                                    ),
                                    filled: true,
                                    fillColor: primaryColor.withOpacity(0.1),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  validator: RequiredValidator(
                                    errorText:
                                        'Veuillez renseigner cet élément',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text('Whatsapp'),
                                ),
                                TextFormField(
                                  controller: whatsapp,
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'votre whatsapp',
                                    contentPadding: const EdgeInsets.only(
                                      left: 10.0,
                                      bottom: 10.0,
                                    ),
                                    filled: true,
                                    fillColor: primaryColor.withOpacity(0.1),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  validator: RequiredValidator(
                                    errorText:
                                        'Veuillez renseigner cet élément',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Merci de choisir Shop App'),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 100,
                                  width: 250,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'XAF',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '3000',
                                        style: TextStyle(
                                          fontSize: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '/mois',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: DropdownButtonFormField(
                                        style: const TextStyle(
                                          fontSize: 10,
                                          height: 0.5,
                                        ),
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            left: 10.0,
                                            bottom: 10.0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primaryColor,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primaryColor,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primaryColor,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primaryColor,
                                            ),
                                          ),
                                          hintText: 'choose',
                                        ),
                                        value: paymentMethod,
                                        validator: (value) => value == null
                                            ? 'Veuillez choisir un type'
                                            : null,
                                        items: const <DropdownMenuItem<
                                            String?>>[
                                          DropdownMenuItem(
                                            value: 'Orange Money',
                                            child: Text(
                                              'Orange Money',
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 16,
                                                fontFamily: 'Monstserrat',
                                              ),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: 'MTN MoMo',
                                            child: Text(
                                              'MTN MoMo',
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 16,
                                                fontFamily: 'Monstserrat',
                                              ),
                                            ),
                                          ),
                                        ],
                                        onChanged: (newValue) {
                                          setState(() {
                                            paymentMethod = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: widget.deviceSize.width / 2.5,
                                      child: TextFormField(
                                        controller: paymentphone,
                                        cursorColor: primaryColor,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          label: Text('Numéro $paymentMethod'),
                                          contentPadding: const EdgeInsets.only(
                                            left: 10.0,
                                            bottom: 10.0,
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primaryColor,
                                            ),
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primaryColor,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primaryColor,
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                        validator: RequiredValidator(
                                          errorText:
                                              'Veuillez renseigner cet élément',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: paymentName,
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    label: Text('Nom $paymentMethod'),
                                    contentPadding: const EdgeInsets.only(
                                      left: 10.0,
                                      bottom: 10.0,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryColor,
                                      ),
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryColor,
                                      ),
                                    ),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryColor,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                  validator: RequiredValidator(
                                    errorText:
                                        'Veuillez renseigner cet élément',
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (!paymentFormKey.currentState!
                                        .validate()) {
                                      UtilFunctions.showFlashMessage(
                                        'Veuillez remplir tous les champs !!!',
                                        Colors.red,
                                      );
                                      return;
                                    }
                                    widget.userLoginInfo[0] = 'Entreprise';
                                    widget.userLoginInfo = [
                                      // Payment info
                                      paymentMethod!,
                                      paymentphone.text,
                                      paymentName.text,
                                    ];
                                    try {
                                      await UtilFunctions.setUserInfo(
                                          widget.userLoginInfo);
                                      await UtilFunctions.setFirstTime(true);

                                      UtilFunctions.showFlashMessage(
                                        "Votre demande d'abonnement a été envoyée avec succès. La vérification et la confirmation de votre compte se fera dans un délai d'un (01) jour ouvrable",
                                        primaryColor,
                                      );

                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyHomePage(
                                            userInfo:
                                                UtilFunctions.getUserInfo(),
                                          ),
                                        ),
                                      );
                                    } catch (e) {
                                      UtilFunctions.showFlashMessage(
                                        'Oups! Une erreur est survenue\nVeuillez réessayer',
                                        Colors.orange,
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 200,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 50.0,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: const Text(
                                      "S'abonner",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
                    'assets/icons/wallet.5.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Text(
                    "S'abonner",
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
    );
  }

  Widget adsItemBuilder(BuildContext context, AdsObjects adsObjets) {
    return StatefulBuilder(builder: (context, StateSetter setStates) {
      bool isPublished = adsObjets.isPublished;
      return Container(
        height: 300,
        width: widget.deviceSize.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewScreen(
                      imageLink: adsObjets.imageLink,
                      deviceSize: widget.deviceSize,
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
                    image: adsObjets.imageLink[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.05),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewPostScreen(
                                deviceSize: widget.deviceSize,
                                adsObjets: adsObjets,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            const Text(
                              'Modifier',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/edit-square.6.svg',
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 2.0,
                      ),
                      decoration: BoxDecoration(
                        color: isPublished ? primaryColor : thirdColor,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Publie',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                // adsObjets.isPublished = !adsObjets.isPublished;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 55,
                              padding: const EdgeInsets.all(2.0),
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              alignment: adsObjets.isPublished
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: adsObjets.isPublished
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10000),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              child: Container(
                                height: 30,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(1000),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
