import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:b_shop/utils/controllers.utils.dart';
import 'package:b_shop/utils/utils.dart';
import 'package:b_shop/welcome_pages/auth/sign_in_page.dart';

class DeconnexionScreen extends StatefulWidget {
  const DeconnexionScreen({Key? key}) : super(key: key);

  @override
  State<DeconnexionScreen> createState() => _DeconnexionScreenState();
}

class _DeconnexionScreenState extends State<DeconnexionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Column(
                  children: [
                    Text(
                      'SHOP\nAPP',
                      textAlign: TextAlign.center,
                      textScaler: TextScaler.linear(1.6),
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
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  'Deconnexion',
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
              const Spacer(),
              const Text(
                'Voulez-vous vraiment vous déconnecter ?',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Autre compte',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        Auth.signOut().then(
                          (signOut) async {
                            await UtilFunctions.setUserInfo({});

                            await UtilFunctions.setFirstTime(false);
                            //restarting the application
                            Platform.isAndroid
                                ? SystemNavigator.pop()
                                : exit(0);
                          },
                        );
                      } catch (e) {
                        UtilFunctions.showFlashMessage(
                          'Oups! Une erreur est survenue\nVeuillez réessayer !!',
                          Colors.orange,
                        );
                        debugPrint(e.toString());
                      }
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Deconnexion',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
    );
  }
}
