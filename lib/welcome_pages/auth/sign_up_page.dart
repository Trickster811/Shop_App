import 'package:email_validator/email_validator.dart' as email_validator;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shop_app/utils/controllers.utils.dart';
import 'package:shop_app/utils/utils.dart';
import 'package:shop_app/welcome_pages/auth/sign_in_page.dart';
import 'package:shop_app/welcome_pages/loading_page.dart';
import 'package:shop_app/welcome_pages/start_page.dart';

class SignUpScreen extends StatefulWidget {
  final List<String>? userInfo;
  final Size deviceSize;
  const SignUpScreen({
    Key? key,
    required this.userInfo,
    required this.deviceSize,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  bool showPassword = false;

  // Variables to get user entries
  String _controllerUserType = "";
  final _controllerUsername = TextEditingController();
  String _controllerTown = '';
  final _controllerPhone = TextEditingController();
  final _controllerWhatsapp = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  // Variables to get user payment info
  String? paymentMethod;
  final paymentphone = TextEditingController();
  final paymentName = TextEditingController();

  // Registration form key
  final _signUpFormKey = GlobalKey<FormState>();

  // Payment form key
  final paymentFormKey = GlobalKey<FormState>();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      User? userSignedUp = await Auth.createUserWithEmailAndPassword(
        userName: _controllerUsername.text.trim(),
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim(),
      );
      if (userSignedUp != null) {
        await UserAccount.cloudSaving(
          data: {
            'userType': _controllerUserType,
            'username': userSignedUp.displayName,
            'town': _controllerTown,
            'phone': _controllerPhone.text.trim(),
            'whatsapp': _controllerWhatsapp.text.trim(),
            'email': _controllerEmail.text.trim(),
            'photoURL': userSignedUp.photoURL,
          },
        );
        final newUserInfos = UtilFunctions.getUserInfo();
        showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
            title: Text(
              'Bon retour M/Mme ${userSignedUp.displayName!.substring(0, userSignedUp.displayName!.indexOf('|'))}!!',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            message: const Text(
              'Vos informations ont été mises à jour avec succès.\nL\'application effectuera des mises à jour en local.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LoadingScreen(userInfo: newUserInfos),
                    ),
                    (Route<dynamic> route) => false,
                  );
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MyHomePage(
                  //       userInfo: {
                  //         'userType': userSignedUp.displayName!.substring(
                  //             userSignedUp.displayName!.indexOf('|') + 1),
                  //         'username': userSignedUp.displayName!.substring(
                  //             0, userSignedUp.displayName!.indexOf('|')),
                  //         'town': _controllerTown,
                  //         'phone': _controllerPhone.text.trim(),
                  //         'whatsapp': _controllerWhatsapp.text.trim(),
                  //         'email': userSignedUp.email,
                  //         'photoURL': userSignedUp.photoURL,
                  //       },
                  //     ),
                  //   ),
                  // );
                },
                child: const Text(
                  'Commencer à travailler avec B-Shop',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      debugPrint(
        e.toString(),
      );
    }
  } // Function for redirecting

  // void redirection() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => OtpVerificationScreen(
  //         phone: _controllerPhone.text.trim(),
  //         updatePhone: false,
  //         userType: _controllerUserType,
  //         age: int.parse(_controllerAge.text.trim()),
  //         town: _controllerTown,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Hero(
                  tag: 'description_tag',
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Shop\nApp'.toUpperCase(),
                          textAlign: TextAlign.center,
                          textScaler: const TextScaler.linear(1.6),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          'by MacNight_nj',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    'Inscription',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: Text('Compte'),
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
                    focusedErrorBorder: const OutlineInputBorder(
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
                  value: _controllerUserType,
                  validator: (value) {
                    if (value == "") {
                      return 'Veuillez sélectionner le type de comtpe';
                    }
                    return null;
                  },
                  items: const [
                    DropdownMenuItem(
                      value: "Client",
                      child: Text(
                        "Client",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Entreprise",
                      child: Text(
                        "Entreprise",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Restaurant",
                      child: Text(
                        "Restaurant",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      _controllerUserType = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                if (_controllerUserType == 'Entreprise' ||
                    _controllerUserType == 'Restaurant') ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(_controllerUserType),
                  ),
                  _entryField(
                    context,
                    'assets/icons/profile.4.svg',
                    'nom d\'utilisateur',
                    _controllerUsername,
                    false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text('Siège'),
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
                      focusedErrorBorder: const OutlineInputBorder(
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
                    value: _controllerTown,
                    validator: (value) {
                      if (value == "") {
                        return 'Veuillez sélectionner votre ville';
                      }
                      return null;
                    },
                    items: [
                      DropdownMenuItem(
                        value: "Bafoussam",
                        child: Text(
                          'Bafoussam',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Bamenda",
                        child: Text(
                          'Bamenda',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Buea",
                        child: Text(
                          'Buea',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Bertoua",
                        child: Text(
                          'Bertoua',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Douala",
                        child: Text(
                          'Douala',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Ebolowa",
                        child: Text(
                          'Ebolowa',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Garoua",
                        child: Text(
                          'Garoua',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Maroua",
                        child: Text(
                          'Maroua',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Ngaoundere",
                        child: Text(
                          'Ngaoundéré',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Yaounde",
                        child: Text(
                          'Yaoundé',
                          style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _controllerTown = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text('Téléphone'),
                  ),
                  InternationalPhoneNumberInput(
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                      showFlags: true,
                      useEmoji: false,
                      setSelectorButtonAsPrefixIcon: false,
                      useBottomSheetSafeArea: false,
                    ),
                    initialValue: PhoneNumber(isoCode: 'CM'),
                    countries: const ["CM"],
                    onInputChanged: (PhoneNumber number) {
                      setState(() {
                        _controllerPhone.text = number.phoneNumber!;
                      });
                    },
                    // textFieldController: _controllerPhone,
                    textStyle: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontWeight: FontWeight.normal,
                    ),
                    selectorTextStyle: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontWeight: FontWeight.normal,
                    ),
                    spaceBetweenSelectorAndTextField: 0,
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    inputDecoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).iconTheme.color!,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).iconTheme.color!,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'téléphone',
                    ),
                    validator: (phone) => phone != null &&
                            _controllerPhone.text.trim().length < 13
                        ? 'Veuillez saisir une numéro de téléphone valide'
                        : null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text('Whatsapp'),
                  ),
                  InternationalPhoneNumberInput(
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                      showFlags: true,
                      useEmoji: false,
                      setSelectorButtonAsPrefixIcon: false,
                      useBottomSheetSafeArea: false,
                    ),
                    initialValue: PhoneNumber(isoCode: 'CM'),
                    countries: const ["CM"],
                    onInputChanged: (PhoneNumber number) {
                      setState(() {
                        _controllerWhatsapp.text = number.phoneNumber!;
                      });
                    },
                    // textFieldController: _controllerWhatsapp,
                    textStyle: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontWeight: FontWeight.normal,
                    ),
                    selectorTextStyle: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontWeight: FontWeight.normal,
                    ),
                    spaceBetweenSelectorAndTextField: 0,
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    inputDecoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).iconTheme.color!,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).iconTheme.color!,
                        ),
                      ),
                      hintStyle: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'téléphone',
                    ),
                    validator: (phone) => phone != null &&
                            _controllerWhatsapp.text.trim().length < 13
                        ? 'Veuillez saisir une numéro de téléphone valide'
                        : null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text('Email'),
                ),
                _entryField(
                  context,
                  'assets/icons/message.svg',
                  'email',
                  _controllerEmail,
                  false,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text('Mot de passe'),
                ),
                _entryField(
                  context,
                  'assets/icons/lock.6.svg',
                  'mot de passe',
                  _controllerPassword,
                  true,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Déjà parmi nous ?'),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(
                              userInfo: {},
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Se Connecter",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 50.0,
              ),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Annuler',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              if (!isLoading) {
                if (!_signUpFormKey.currentState!.validate()) {
                  return;
                }

                await createUserWithEmailAndPassword();
              }
            },
            //   showModalBottomSheet(
            //     context: context,
            //     shape: const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(
            //           20,
            //         ),
            //         topRight: Radius.circular(
            //           20,
            //         ),
            //       ),
            //     ),
            //     builder: (context) => Padding(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 10.0,
            //       ),
            //       child: Form(
            //         key: paymentFormKey,
            //         child: SingleChildScrollView(
            //           child: Column(
            //             children: [
            //               Container(
            //                 height: 5,
            //                 width: 50,
            //                 margin: const EdgeInsets.symmetric(
            //                   vertical: 5.0,
            //                 ),
            //                 decoration: BoxDecoration(
            //                   color: primaryColor,
            //                   borderRadius: BorderRadius.circular(
            //                     1000,
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               const Text('Merci de choisir Shop App'),
            //               const SizedBox(
            //                 height: 20,
            //               ),
            //               Container(
            //                 height: 100,
            //                 width: 250,
            //                 alignment: Alignment.center,
            //                 padding: const EdgeInsets.all(10.0),
            //                 decoration: BoxDecoration(
            //                   color: primaryColor,
            //                   borderRadius: BorderRadius.circular(
            //                     10.0,
            //                   ),
            //                 ),
            //                 child: const Row(
            //                   mainAxisAlignment:
            //                       MainAxisAlignment.spaceEvenly,
            //                   children: [
            //                     Text(
            //                       'XAF',
            //                       style: TextStyle(
            //                         fontSize: 18,
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                     Text(
            //                       '3000',
            //                       style: TextStyle(
            //                         fontSize: 40,
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                     Text(
            //                       '/mois',
            //                       style: TextStyle(
            //                         fontSize: 18,
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: 20,
            //               ),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Expanded(
            //                     child: DropdownButtonFormField(
            //                       style: const TextStyle(
            //                         fontSize: 10,
            //                         height: 0.5,
            //                       ),
            //                       decoration: const InputDecoration(
            //                         contentPadding: EdgeInsets.only(
            //                           left: 10.0,
            //                           bottom: 10.0,
            //                         ),
            //                         enabledBorder: OutlineInputBorder(
            //                           borderSide: BorderSide(
            //                             color: primaryColor,
            //                           ),
            //                         ),
            //                         errorBorder: OutlineInputBorder(
            //                           borderSide: BorderSide(
            //                             color: primaryColor,
            //                           ),
            //                         ),
            //                         focusedErrorBorder: OutlineInputBorder(
            //                           borderSide: BorderSide(
            //                             color: primaryColor,
            //                           ),
            //                         ),
            //                         focusedBorder: OutlineInputBorder(
            //                           borderSide: BorderSide(
            //                             color: primaryColor,
            //                           ),
            //                         ),
            //                         hintText: 'choose',
            //                       ),
            //                       value: paymentMethod,
            //                       validator: (value) => value == null
            //                           ? 'Veuillez choisir un type'
            //                           : null,
            //                       items: const <DropdownMenuItem<String?>>[
            //                         DropdownMenuItem(
            //                           value: 'Orange Money',
            //                           child: Text(
            //                             'Orange Money',
            //                             style: TextStyle(
            //                               color: primaryColor,
            //                               fontSize: 16,
            //                               fontFamily: 'Monstserrat',
            //                             ),
            //                           ),
            //                         ),
            //                         DropdownMenuItem(
            //                           value: 'MTN MoMo',
            //                           child: Text(
            //                             'MTN MoMo',
            //                             style: TextStyle(
            //                               color: primaryColor,
            //                               fontSize: 16,
            //                               fontFamily: 'Monstserrat',
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                       onChanged: (newValue) {
            //                         setState(() {
            //                           paymentMethod = newValue!;
            //                         });
            //                       },
            //                     ),
            //                   ),
            //                   const SizedBox(
            //                     width: 10,
            //                   ),
            //                   SizedBox(
            //                     width: widget.deviceSize.width / 2.5,
            //                     child: TextFormField(
            //                       controller: paymentphone,
            //                       cursorColor: primaryColor,
            //                       keyboardType: TextInputType.number,
            //                       decoration: InputDecoration(
            //                         label: Text('Numéro $paymentMethod'),
            //                         contentPadding: const EdgeInsets.only(
            //                           left: 10.0,
            //                           bottom: 10.0,
            //                         ),
            //                         enabledBorder: const OutlineInputBorder(
            //                           borderSide: BorderSide(
            //                             color: primaryColor,
            //                           ),
            //                         ),
            //                         errorBorder: const OutlineInputBorder(
            //                           borderSide: BorderSide(
            //                             color: primaryColor,
            //                           ),
            //                         ),
            //                         focusedErrorBorder:
            //                             const OutlineInputBorder(
            //                           borderSide: BorderSide(
            //                             color: primaryColor,
            //                           ),
            //                         ),
            //                         focusedBorder: const OutlineInputBorder(
            //                           borderSide: BorderSide(
            //                             color: primaryColor,
            //                           ),
            //                         ),
            //                       ),
            //                       validator: RequiredValidator(
            //                         errorText:
            //                             'Veuillez renseigner cet élément',
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               const SizedBox(
            //                 height: 20,
            //               ),
            //               TextFormField(
            //                 controller: paymentName,
            //                 cursorColor: primaryColor,
            //                 keyboardType: TextInputType.text,
            //                 decoration: InputDecoration(
            //                   label: Text('Nom $paymentMethod'),
            //                   contentPadding: const EdgeInsets.only(
            //                     left: 10.0,
            //                     bottom: 10.0,
            //                   ),
            //                   enabledBorder: const OutlineInputBorder(
            //                     borderSide: BorderSide(
            //                       color: primaryColor,
            //                     ),
            //                   ),
            //                   errorBorder: const OutlineInputBorder(
            //                     borderSide: BorderSide(
            //                       color: primaryColor,
            //                     ),
            //                   ),
            //                   focusedErrorBorder: const OutlineInputBorder(
            //                     borderSide: BorderSide(
            //                       color: primaryColor,
            //                     ),
            //                   ),
            //                   focusedBorder: const OutlineInputBorder(
            //                     borderSide: BorderSide(
            //                       color: primaryColor,
            //                     ),
            //                   ),
            //                 ),
            //                 validator: RequiredValidator(
            //                   errorText: 'Veuillez renseigner cet élément',
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () async {
            //                   if (!paymentFormKey.currentState!.validate()) {
            //                     UtilFunctions.showFlashMessage(
            //                       'Veuillez remplir tous les champs !!!',
            //                       Colors.red,
            //                     );
            //                     return;
            //                   }
            //                   final Map<String, dynamic> userLoginInfo = [
            //                     userType!,
            //                     name.text,
            //                     phone.text,
            //                     whatsapp.text,
            //                     email.text,
            //                     password.text,
            //                     // Payment info
            //                     paymentMethod!,
            //                     paymentphone.text,
            //                     paymentName.text,
            //                   ];
            //                   try {
            //                     await UtilFunctions.setUserInfo(
            //                         userLoginInfo);
            //                     await UtilFunctions.setFirstTime(true);

            //                     UtilFunctions.showFlashMessage(
            //                       "Vos Informations et votre demande d'abonnement a été envoyée avec succès. La vérification et la confirmation de votre compte se fera dans un délai d'un (01) jour ouvrable",
            //                       primaryColor,
            //                     );

            //                     Navigator.pushReplacement(
            //                       context,
            //                       MaterialPageRoute(
            //                         builder: (context) => MyHomePage(
            //                           userInfo: UtilFunctions.getUserInfo(),
            //                         ),
            //                       ),
            //                     );
            //                   } catch (e) {
            //                     UtilFunctions.showFlashMessage(
            //                       'Oups! Une erreur est survenue\nVeuillez réessayer',
            //                       Colors.orange,
            //                     );
            //                   }
            //                 },
            //                 child: Container(
            //                   height: 40,
            //                   width: 200,
            //                   alignment: Alignment.center,
            //                   padding: const EdgeInsets.symmetric(
            //                     vertical: 10.0,
            //                     horizontal: 50.0,
            //                   ),
            //                   margin: const EdgeInsets.symmetric(
            //                     vertical: 10.0,
            //                   ),
            //                   decoration: BoxDecoration(
            //                     color: primaryColor,
            //                     borderRadius: BorderRadius.circular(10.0),
            //                   ),
            //                   child: const Text(
            //                     "S'abonner",
            //                     style: TextStyle(
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   );
            // }

            child: Container(
              height: 40,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 50.0,
              ),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                "S'inscrire",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _entryField(
    BuildContext context,
    String icon,
    String fieldTitle,
    TextEditingController controller,
    bool isPassword,
  ) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).iconTheme.color,
        ),
        cursorColor: Theme.of(context).iconTheme.color,
        obscureText: showPassword ? !showPassword : isPassword,
        decoration: InputDecoration(
          icon: fieldTitle == 'age'
              ? SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                  height: 17,
                )
              : SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                ),
          suffix: isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: SvgPicture.asset(
                    showPassword
                        ? "assets/icons/show.5.svg"
                        : "assets/icons/show.3.svg",
                    // height: 10,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).iconTheme.color!,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : const SizedBox(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).iconTheme.color!,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).iconTheme.color!,
            ),
          ),
          hintStyle: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.normal,
          ),
          hintText: fieldTitle,
        ),
        // value: dropdownvalue_1,
        controller: controller,
        onChanged: (text) {},
        validator: (value) => value!.trim() == ''
            ? 'Votre $fieldTitle'
            : fieldTitle == 'email' &&
                    !email_validator.EmailValidator.validate(value.trim())
                ? 'Veuillez saisir un $fieldTitle valide'
                : fieldTitle == ('mot de passe') && value.trim().length < 8
                    ? 'Votre $fieldTitle doit contenir au moins 08 caractères (Une combinaison de caractères alphanumérique et de chiffres)'
                    : null,
      ),
    );
  }
}
