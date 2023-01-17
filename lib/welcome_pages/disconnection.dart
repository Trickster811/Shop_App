import 'package:flutter/material.dart';
import 'package:iut_ads/utils/utils.dart';

class DeconnexionScreen extends StatelessWidget {
  const DeconnexionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
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
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(vertical: 10.0),
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
          InkWell(
            onTap: () async {
              try {
                final List<String> userInfo =
                    await UtilFunctions.setUserInfo([]);

                await UtilFunctions.setFirstTime(false);
                //redirecting
                Navigator.pop(context);
              } catch (e) {
                UtilFunctions.showFlashMessage(
                  context,
                  'Oups! Une erreur est survenue\nVeuillez réessayer !!',
                  Colors.orange,
                  deviceSize,
                );
              }
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
