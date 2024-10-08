import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:b_shop/screens/components/image_view_page.dart';
import 'package:b_shop/utils/utils.dart';

class RestaurantScreen extends StatefulWidget {
  final Size deviceSize;

  const RestaurantScreen({
    super.key,
    required this.deviceSize,
  });

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  // Order form key
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final phoneController = TextEditingController();

  final List foodSnapshots = [
    const Food(
      imageLink: [
        'https://www.shoe-tease.com/wp-content/uploads/2021/10/Shoes-that-go-with-everything-ShoeTease-Blog.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZNdz-mIrSJtcSry4OKCjYGUo_zZcWqjDdMkAxHDdmbaRfjagUcB5JVNYRdByps4sABr8&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScqH7-rT4dGQyiiotOLaY6NMyUKmow4sB0h4UScgVlw_PVeIPfbAFXHaaMy0FicQ1wKqY&usqp=CAU',
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1345098657.jpg',
        'https://images.dsw.ca/is/image/dswca/113103072_120_ss_01?impolicy=colpg&imwidth=400&imdensity=1',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO3WoxUdbu67ymI1b8Jdv3JBWCo6kssA-9Zzr9Ua-Y87blL6vseVA2GTyQQfT4imz8xQQ&usqp=CAU',
      ],
      foodName: 'Taro Sauce Jaune',
      foodDescription: 'Pimente et accompagne d\'une boisson gazuese',
      foodPrice: 1725,
      foodCategory: 'Local',
    ),
    const Food(
      imageLink: [
        'https://www.shoe-tease.com/wp-content/uploads/2021/10/Shoes-that-go-with-everything-ShoeTease-Blog.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZNdz-mIrSJtcSry4OKCjYGUo_zZcWqjDdMkAxHDdmbaRfjagUcB5JVNYRdByps4sABr8&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScqH7-rT4dGQyiiotOLaY6NMyUKmow4sB0h4UScgVlw_PVeIPfbAFXHaaMy0FicQ1wKqY&usqp=CAU',
        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1345098657.jpg',
        'https://images.dsw.ca/is/image/dswca/113103072_120_ss_01?impolicy=colpg&imwidth=400&imdensity=1',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO3WoxUdbu67ymI1b8Jdv3JBWCo6kssA-9Zzr9Ua-Y87blL6vseVA2GTyQQfT4imz8xQQ&usqp=CAU',
      ],
      foodName: 'Taro Sauce Jaune',
      foodDescription:
          'Pimente et non pimente et accompagne d\'une boisson gazeuse ou eau plate (au choix)',
      foodPrice: 1725,
      foodCategory: 'Local',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: _handleScreenRefreshing,
      color: primaryColor,
      height: 300,
      animSpeedFactor: 2.0,
      showChildOpacityTransition: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (var item in foodSnapshots)
              foodCardBuilder(
                context,
                item,
              ),
          ],
        ),
      ),
    );
  }

  Container foodCardBuilder(BuildContext context, item) {
    return Container(
      height: 300,
      // width: deviceSize.width,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageViewScreen(
                    imageLink: item.imageLink,
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
                  image: item.imageLink[0],
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
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.foodName.toUpperCase(),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          item.foodDescription,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          padding: const EdgeInsets.all(2.0),
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: secondColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.foodPrice.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              const Text(
                                'FCFA',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  width: (widget.deviceSize.width - 20) * .40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.03),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Livraison Gratuite',
                        style: TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () => {
                          // showCupertinoModalPopup(
                          //   context: context,
                          //   builder: (context) => CupertinoActionSheet(
                          //     title: const Text(
                          //       'Passer une commande\nVeuillew renseigner les details de votre achat',
                          //     ),
                          //     message: SizedBox(
                          //       height: MediaQuery.of(context).size.height * .5,
                          //       //   child: Form(
                          //       //     child: Column(
                          //       //       children: [
                          //       //         const Text('Nom et Prenom'),
                          //       //         TextFormField(
                          //       //           controller: TextEditingController(),
                          //       //           cursorColor: primaryColor,
                          //       //           keyboardType: TextInputType.name,
                          //       //           decoration: InputDecoration(
                          //       //             hintText: 'votre nom',
                          //       //             contentPadding: const EdgeInsets.only(
                          //       //               left: 10.0,
                          //       //               bottom: 10.0,
                          //       //             ),
                          //       //             filled: true,
                          //       //             fillColor:
                          //       //                 primaryColor.withOpacity(0.1),
                          //       //             enabledBorder:
                          //       //                 const OutlineInputBorder(
                          //       //               borderSide: BorderSide(
                          //       //                 color: Colors.transparent,
                          //       //               ),
                          //       //             ),
                          //       //             errorBorder: const OutlineInputBorder(
                          //       //               borderSide: BorderSide(
                          //       //                 color: Colors.transparent,
                          //       //               ),
                          //       //             ),
                          //       //             focusedErrorBorder:
                          //       //                 const OutlineInputBorder(
                          //       //               borderSide: BorderSide(
                          //       //                 color: Colors.transparent,
                          //       //               ),
                          //       //             ),
                          //       //             focusedBorder:
                          //       //                 const OutlineInputBorder(
                          //       //               borderSide: BorderSide(
                          //       //                 color: Colors.transparent,
                          //       //               ),
                          //       //             ),
                          //       //           ),
                          //       //           validator: RequiredValidator(
                          //       //             errorText:
                          //       //                 'Veuillez renseigner cet élément',
                          //       //           ),
                          //       //         ),
                          //       //       ],
                          //       //     ),
                          //       //   ),
                          //     ),
                          //     actions: [
                          //       CupertinoActionSheetAction(
                          //         onPressed: () => (),
                          //         child: const Text(
                          //           "Payer",
                          //           style: TextStyle(
                          //             // fontSize: 12,
                          //             color: primaryColor,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //     cancelButton: CupertinoActionSheetAction(
                          //       onPressed: () => Navigator.pop(context),
                          //       child: const Text(
                          //         "Annuler",
                          //         style: TextStyle(
                          //           color: Colors.red,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // )
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => SingleChildScrollView(
                              child: Container(
                                height: MediaQuery.of(context).size.height * .8,
                                padding: const EdgeInsets.all(4.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 5.0,
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                    left: 10.0,
                                    right: 10.0,
                                  ),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Container(
                                          width: 50,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                const SizedBox(
                                                  width: double.maxFinite,
                                                  child: Text(
                                                    'Passer une commande pour :',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20.0,
                                                ),
                                                const Text(
                                                  "Nom (Exp: Jean, Ngono, ...)",
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                TextFormField(
                                                  controller: nameController,
                                                  cursorColor: primaryColor,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  decoration: InputDecoration(
                                                    hintText: 'nom',
                                                    hintStyle: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                      left: 10.0,
                                                      bottom: 10.0,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: RequiredValidator(
                                                    errorText:
                                                        'Veuillez renseigner votre nom',
                                                  ).call,
                                                ),
                                                const SizedBox(
                                                  height: 20.0,
                                                ),
                                                const Text(
                                                  "Position (Exp: Bureau, Maison, ...)",
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      positionController,
                                                  cursorColor: primaryColor,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'lieu de livraison',
                                                    hintStyle: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                      left: 10.0,
                                                      bottom: 10.0,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: RequiredValidator(
                                                    errorText:
                                                        'Veuillez renseigner votre position',
                                                  ).call,
                                                ),
                                                const SizedBox(
                                                  height: 20.0,
                                                ),
                                                const Text(
                                                  "Nom (OM | MoMo)",
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      positionController,
                                                  cursorColor: primaryColor,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  decoration: InputDecoration(
                                                    hintText: 'nom OM | MoMo',
                                                    hintStyle: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                      left: 10.0,
                                                      bottom: 10.0,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: RequiredValidator(
                                                    errorText:
                                                        'Veuillez renseigner votre Nom OM | MoMo',
                                                  ).call,
                                                ),
                                                const SizedBox(
                                                  height: 20.0,
                                                ),
                                                const Text(
                                                  "Numero payeur (OM | MoMo)",
                                                ),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                InternationalPhoneNumberInput(
                                                  selectorConfig:
                                                      const SelectorConfig(
                                                    selectorType:
                                                        PhoneInputSelectorType
                                                            .DIALOG,
                                                    showFlags: true,
                                                    useEmoji: false,
                                                    setSelectorButtonAsPrefixIcon:
                                                        false,
                                                    useBottomSheetSafeArea:
                                                        false,
                                                  ),
                                                  initialValue: PhoneNumber(
                                                      isoCode: 'CM'),
                                                  countries: const ["CM"],
                                                  onInputChanged:
                                                      (PhoneNumber number) {
                                                    setState(() {
                                                      phoneController.text =
                                                          number.phoneNumber!;
                                                    });
                                                  },
                                                  // textFieldController: phoneController,
                                                  textStyle: TextStyle(
                                                    color: Theme.of(context)
                                                        .iconTheme
                                                        .color,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  selectorTextStyle: TextStyle(
                                                    color: Theme.of(context)
                                                        .iconTheme
                                                        .color,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  spaceBetweenSelectorAndTextField:
                                                      0,
                                                  keyboardType:
                                                      const TextInputType
                                                          .numberWithOptions(
                                                    signed: true,
                                                    decimal: true,
                                                  ),
                                                  inputDecoration:
                                                      InputDecoration(
                                                    hintText: PhoneNumber(
                                                      phoneNumber:
                                                          '6xx xx xx xx',
                                                    ).phoneNumber,
                                                    hintStyle: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                      left: 10.0,
                                                      bottom: 10.0,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: (phone) => phone !=
                                                              null &&
                                                          phoneController.text
                                                                  .trim()
                                                                  .length <
                                                              13
                                                      ? 'Veuillez saisir une numéro de téléphone valide'
                                                      : null,
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () => {
                                                  if (!_formKey.currentState!
                                                      .validate())
                                                    {}
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 20.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10.0,
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    "Payer",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 20.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10.0,
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    "Annuler",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            // horizontal: 10.0,
                            vertical: 5.0,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/buy.3.svg',
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              // const SizedBox(
                              //   width: 5,
                              // ),
                              const Text(
                                'Commander',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleScreenRefreshing() async {
    return await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
  }
}

class Food {
  final List<String> imageLink;
  final String foodName;
  final String foodDescription;
  final double foodPrice;
  final String foodCategory;
  const Food({
    Key? key,
    required this.imageLink,
    required this.foodName,
    required this.foodDescription,
    required this.foodPrice,
    required this.foodCategory,
  });
}
