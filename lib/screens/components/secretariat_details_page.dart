import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iut_ads/screens/components/image_view_page.dart';
import 'package:iut_ads/screens/home_page.dart';
import 'package:iut_ads/screens/service_page.dart';
import 'package:iut_ads/utils/utils.dart';

class SecretariatDetailsScreen extends StatelessWidget {
  const SecretariatDetailsScreen({
    Key? key,
    required this.deviceSize,
    required this.documentBuilder,
  }) : super(key: key);
  final Size deviceSize;
  final DocumentBuilder documentBuilder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            // color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/chat.2.svg',
              // color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Informations sur le Document'),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Text('Document'),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 150,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      documentBuilder.documentTitle,
                      textScaleFactor: 1.2,
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 150,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/download.3.svg',
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 05.0,
                            ),
                            Text(
                              'Télecharger',
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
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Spécifications'),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Couleur'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: documentBuilder.documentColorType
                              ? Colors.green.withOpacity(.1)
                              : Colors.red.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          documentBuilder.documentColorType ? 'OUI' : 'NON',
                          style: TextStyle(
                            color: documentBuilder.documentColorType
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Reliure'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: documentBuilder.documentReliureType
                              ? Colors.green.withOpacity(.1)
                              : Colors.red.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          documentBuilder.documentReliureType ? 'OUI' : 'NON',
                          style: TextStyle(
                            color: documentBuilder.documentReliureType
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Recto/Verso'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: documentBuilder.documentdispositionType
                              ? Colors.green.withOpacity(.1)
                              : Colors.red.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          documentBuilder.documentdispositionType
                              ? 'OUI'
                              : 'NON',
                          style: TextStyle(
                            color: documentBuilder.documentdispositionType
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('N. Copies'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          '0' + documentBuilder.documentCopies.toString(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Commentaire'),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  documentBuilder.documentComment,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Informations sur le Client'),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Nom'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50.0,
                        width: deviceSize.width * .4,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(documentBuilder.ownerName),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    children: [
                      Text('Contacts'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50.0,
                        width: deviceSize.width * .4,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          documentBuilder.ownerPhone.toString(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 75.0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        // width: 60,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/tick-square.1.svg',
                color: Colors.white,
              ),
              SizedBox(
                width: 05.0,
              ),
              Text(
                'Terminer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
