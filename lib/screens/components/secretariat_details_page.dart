import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/service_page.dart';
import 'package:shop_app/utils/utils.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Informations sur le Document'),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text('Document'),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 150,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      documentBuilder.documentTitle,
                      textScaler: const TextScaler.linear(1.2),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 150,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/download.3.svg',
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(
                              width: 05.0,
                            ),
                            const Text(
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
              const SizedBox(
                height: 20.0,
              ),
              const Text('Spécifications'),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('Couleur'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
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
                      const Text('Reliure'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
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
                      const Text('Recto/Verso'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
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
                      const Text('N. Copies'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50,
                        width: 60,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          '0${documentBuilder.documentCopies}',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Commentaire'),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  documentBuilder.documentComment,
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Informations sur le Client'),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('Nom'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50.0,
                        width: deviceSize.width * .4,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(documentBuilder.ownerName),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    children: [
                      const Text('Contacts'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50.0,
                        width: deviceSize.width * .4,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
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
              const SizedBox(
                height: 75.0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 40,
        // width: 60,
        margin: const EdgeInsets.all(20),
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
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(
                width: 05.0,
              ),
              const Text(
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
