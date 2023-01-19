import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iut_ads/utils/utils.dart';
import 'package:iut_ads/welcome_pages/auth/sign_in_page.dart';

class DeconnexionScreen extends StatefulWidget {
  const DeconnexionScreen({Key? key}) : super(key: key);

  @override
  State<DeconnexionScreen> createState() => _DeconnexionScreenState();
}

class _DeconnexionScreenState extends State<DeconnexionScreen> {
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // extendBody: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  'Inscription',
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
              Spacer(),
              Text(
                'Voulez-vous vraiment vous déconnecter ?',
                textAlign: TextAlign.center,
              ),
              SizedBox(
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
                          builder: (context) => SignInScreen(
                            userInfo: [],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Text(
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
                        await UtilFunctions.setUserInfo(['', '', '']);

                        await UtilFunctions.setFirstTime(false);
                        print('object');
                        //restarting the application
                        Platform.isAndroid ? SystemNavigator.pop() : exit(0);
                      } catch (e) {
                        UtilFunctions.showFlashMessage(
                          context,
                          'Oups! Une erreur est survenue\nVeuillez réessayer !!',
                          Colors.orange,
                          deviceSize,
                        );
                        print(e);
                      }
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(
                        10.0,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Text(
                        'Deconnexion',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
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
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(.5),
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Text(
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
