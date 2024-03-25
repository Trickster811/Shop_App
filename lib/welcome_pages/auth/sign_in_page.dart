import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shop_app/utils/utils.dart';
import 'package:shop_app/welcome_pages/auth/sign_up_page.dart';
import 'package:shop_app/welcome_pages/start_page.dart';

class SignInScreen extends StatefulWidget {
  final List<String>? userInfo;
  const SignInScreen({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Variables to get user entries
  final email = TextEditingController();

  final password = TextEditingController();

  // Form key
  final _formKey = GlobalKey<FormState>();

  String? userType;

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
    final deviceSize = MediaQuery.of(context).size;
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
                    'Connexion',
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
                const Text('Email'),
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
                const Text('Mot de passe'),
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
                    const Text('Nouveau parmi nous? '),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(
                                userInfo: const [], deviceSize: deviceSize),
                          ),
                        );
                      },
                      child: const Text(
                        "S'inscire",
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
                  height: 20,
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
                return UtilFunctions.showFlashMessage(
                  'Veuillez remplir tous les champs !!!',
                  Colors.red,
                );
              }

              final List<String> userLoginInfo = [
                userType!,
                email.text,
                password.text,
              ];
              try {
                final List<String> userInfo =
                    await UtilFunctions.setUserInfo(userLoginInfo);
                if (userInfo.isEmpty) {
                  return UtilFunctions.showFlashMessage(
                    'Aucun compte existant avec cet email !!',
                    Colors.orange,
                  );
                }
                for (var element in userInfo) {
                  if (element != userLoginInfo[userInfo.indexOf(element)]) {
                    return UtilFunctions.showFlashMessage(
                      'Email ou Mot de passe incorrect',
                      Colors.red,
                    );
                  }
                }
                await UtilFunctions.setFirstTime(true);
                //redirecting
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(
                      userInfo: userLoginInfo,
                    ),
                  ),
                );
              } catch (e) {
                UtilFunctions.showFlashMessage(
                  'Aucun compte existant avec cet email !!',
                  Colors.orange,
                );
              }
            },
            child: Container(
              height: 40,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 30.0,
              ),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Se Connecter',
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
