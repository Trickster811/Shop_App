import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:iut_ads/utils/utils.dart';
import 'package:iut_ads/welcome_pages/auth/sign_up_page.dart';
import 'package:iut_ads/welcome_pages/start_page.dart';

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
      DropdownMenuItem(
        child: Text(
          "Secretariat",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
        value: "Secretariat",
      ),
      DropdownMenuItem(
        child: Text(
          "Entreprise",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
        value: "Entreprise",
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
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'NDERE\nADS',
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.6,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 10,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'by MacNight_nj',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    'Connexion',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 10,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text('Utilisateur'),
                Container(
                  height: 50,
                  width: deviceSize.width,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonFormField(
                    style: TextStyle(
                      fontSize: 10,
                      height: 0.5,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
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
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Email'),
                Container(
                  height: 50,
                  width: deviceSize.width,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: email,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'votre email',
                      contentPadding: EdgeInsets.only(bottom: 10.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    validator: RequiredValidator(
                      errorText: 'Veuillez renseigner cet élément',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Mot de passe'),
                Container(
                  height: 50,
                  width: deviceSize.width,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: password,
                    cursorColor: primaryColor,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'mot de passe',
                      contentPadding: EdgeInsets.only(bottom: 10.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    validator: RequiredValidator(
                      errorText: 'Veuillez renseigner cet élément',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text('Nouveau parmi nous? '),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(
                              userInfo: [], deviceSize: deviceSize),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 50.0,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        "S'inscire",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
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
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 50.0,
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Annuler',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              if (!_formKey.currentState!.validate())
                return UtilFunctions.showFlashMessage(
                  context,
                  'Veuillez remplir tous les champs !!!',
                  Colors.red,
                  deviceSize,
                );

              final List<String> userLoginInfo = [
                userType!,
                email.text,
                password.text,
              ];
              try {
                final List<String> userInfo =
                    await UtilFunctions.setUserInfo(userLoginInfo);
                if (userInfo.length == 0)
                  return UtilFunctions.showFlashMessage(
                    context,
                    'Aucun compte existant avec cet email !!',
                    Colors.orange,
                    deviceSize,
                  );
                for (var element in userInfo) {
                  if (element != userLoginInfo[userInfo.indexOf(element)])
                    return UtilFunctions.showFlashMessage(
                      context,
                      'Email ou Mot de passe incorrect',
                      Colors.red,
                      deviceSize,
                    );
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
                  context,
                  'Aucun compte existant avec cet email !!',
                  Colors.orange,
                  deviceSize,
                );
              }
            },
            child: Container(
              height: 40,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 30.0,
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
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
