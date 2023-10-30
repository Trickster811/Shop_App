import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ndere_ads/utils/utils.dart';
import 'package:ndere_ads/welcome_pages/auth/sign_in_page.dart';
import 'package:ndere_ads/welcome_pages/start_page.dart';

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

  // Registration form key
  final _formKey = GlobalKey<FormState>();

  // Payment form key
  final paymentFormKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get userTypeList {
    List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem(
        value: "Client",
        child: Text(
          "Client",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontFamily: 'Comfortaa',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "Entreprise",
        child: Text(
          "Entreprise",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontFamily: 'Comfortaa',
          ),
        ),
      ),
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _formKey,
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
                          textScaleFactor: 1.6,
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
                  value: userType,
                  validator: (value) =>
                      value == null ? 'Veuillez choisir un type' : null,
                  items: userTypeList,
                  onChanged: (String? newValue) {
                    setState(() {
                      userType = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                if (userType == 'Entreprise') ...[
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
                    ),
                    validator: RequiredValidator(
                      errorText: 'Veuillez renseigner cet élément',
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
                    ),
                    validator: RequiredValidator(
                      errorText: 'Veuillez renseigner cet élément',
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
                    ),
                    validator: RequiredValidator(
                      errorText: 'Veuillez renseigner cet élément',
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
                      errorBorder: OutlineInputBorder(
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
                    ),
                    validator: RequiredValidator(
                      errorText: 'Veuillez renseigner cet élément',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text('Email'),
                ),
                TextFormField(
                  controller: email,
                  cursorColor: primaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'votre email',
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
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner cet élément',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text('Mot de passe'),
                ),
                TextFormField(
                  controller: password,
                  cursorColor: primaryColor,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'mot de passe',
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
                  ),
                  validator: RequiredValidator(
                    errorText: 'Veuillez renseigner cet élément',
                  ),
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
                              userInfo: [],
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
              if (!_formKey.currentState!.validate()) {
                UtilFunctions.showFlashMessage(
                  context,
                  'Veuillez remplir tous les champs !!!',
                  Colors.red,
                  widget.deviceSize,
                );
                return;
              }
              if (userType == "Client") {
                final List<String> userLoginInfo = [
                  userType!,
                  name.text,
                  phone.text,
                  whatsapp.text,
                  email.text,
                  password.text,
                ];
                try {
                  await UtilFunctions.setUserInfo(userLoginInfo);
                  await UtilFunctions.setFirstTime(true);

                  UtilFunctions.showFlashMessage(
                    context,
                    "Vos Informations et votre demande d'inscription a été envoyée avec succès. Bienvenue sur ShopApp",
                    primaryColor,
                    widget.deviceSize,
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(
                        userInfo: UtilFunctions.getUserInfo(),
                      ),
                    ),
                  );
                } catch (e) {
                  UtilFunctions.showFlashMessage(
                    context,
                    'Oups! Une erreur est survenue\nVeuillez réessayer',
                    Colors.orange,
                    widget.deviceSize,
                  );
                }
              } else {
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
                      child: SingleChildScrollView(
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      focusedErrorBorder: OutlineInputBorder(
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
                                    items: const <DropdownMenuItem<String?>>[
                                      DropdownMenuItem(
                                        value: 'Orange Money',
                                        child: Text(
                                          'Orange Money',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontFamily: 'Comfortaa',
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
                                            fontFamily: 'Comfortaa',
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
                                focusedErrorBorder: const OutlineInputBorder(
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
                                errorText: 'Veuillez renseigner cet élément',
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                if (!paymentFormKey.currentState!.validate()) {
                                  UtilFunctions.showFlashMessage(
                                    context,
                                    'Veuillez remplir tous les champs !!!',
                                    Colors.red,
                                    widget.deviceSize,
                                  );
                                  return;
                                }
                                final List<String> userLoginInfo = [
                                  userType!,
                                  name.text,
                                  phone.text,
                                  whatsapp.text,
                                  email.text,
                                  password.text,
                                  // Payment info
                                  paymentMethod!,
                                  paymentphone.text,
                                  paymentName.text,
                                ];
                                try {
                                  await UtilFunctions.setUserInfo(
                                      userLoginInfo);
                                  await UtilFunctions.setFirstTime(true);

                                  UtilFunctions.showFlashMessage(
                                    context,
                                    "Vos Informations et votre demande d'abonnement a été envoyée avec succès. La vérification et la confirmation de votre compte se fera dans un délai d'un (01) jour ouvrable",
                                    primaryColor,
                                    widget.deviceSize,
                                  );

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyHomePage(
                                        userInfo: UtilFunctions.getUserInfo(),
                                      ),
                                    ),
                                  );
                                } catch (e) {
                                  UtilFunctions.showFlashMessage(
                                    context,
                                    'Oups! Une erreur est survenue\nVeuillez réessayer',
                                    Colors.orange,
                                    widget.deviceSize,
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
                  ),
                );
              }
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
}
