import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shop_app/utils/utils.dart';

class NewPrintSCreen extends StatefulWidget {
  const NewPrintSCreen({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);
  final Size deviceSize;

  @override
  State<NewPrintSCreen> createState() => _NewPrintSCreenState();
}

class _NewPrintSCreenState extends State<NewPrintSCreen> {
  bool couleurIndex = true;
  bool dispositionIndex = true;
  bool reliureIndex = true;
  bool paymentIndex = true;

  File? documentFile;

  int? totalPrice = 15;

  //Variables
  final documentName = TextEditingController();
  final documentCopies = TextEditingController(text: '1');
  final documentPrice = TextEditingController(text: '15 FCFA');
  final ownerName = TextEditingController();
  final ownerPhone = TextEditingController();
  final ownerWhatsapp = TextEditingController();

  // Form key
  final _formKey = GlobalKey<FormState>();
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
        title: const Text(
          'Nouveau',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/category.2.svg',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Titre document'),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: documentName,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'titre du document',
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
                const SizedBox(
                  height: 10,
                ),
                const Text('Fichier'),
                Container(
                  height: 160,
                  width: widget.deviceSize.width,
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: documentFile == null
                      ? InkWell(
                          onTap: () async {
                            final temporalyFile =
                                await UtilFunctions.selectFile([]);
                            setState(() {
                              documentFile = temporalyFile;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Importer votre document'),
                              const SizedBox(
                                height: 10,
                              ),
                              SvgPicture.asset(
                                'assets/icons/document.2.svg',
                              ),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              UtilFunctions.baseNameProvider(
                                  documentFile!.path),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                final temporalyFile =
                                    await UtilFunctions.selectFile([]);
                                setState(() {
                                  documentFile = temporalyFile;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/document.2.svg',
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    const Text(
                                      'Changer',
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
                  height: 10,
                ),
                const Text('Couleur'),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text('Oui'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              couleurIndex = couleurIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: const EdgeInsets.all(2.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            alignment: couleurIndex
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: couleurIndex
                                  ? Colors.green
                                  : Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10000),
                              border: Border.all(
                                color: Colors.green.withOpacity(0.2),
                              ),
                            ),
                            child: Container(
                              height: 30,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Non'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              couleurIndex = couleurIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: const EdgeInsets.all(2.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            alignment: !couleurIndex
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: !couleurIndex
                                  ? Colors.orange
                                  : Colors.orange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10000),
                              border: Border.all(
                                color: Colors.orange.withOpacity(0.2),
                              ),
                            ),
                            child: Container(
                              height: 30,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text('Disposition'),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text('Recto'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              dispositionIndex =
                                  dispositionIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: const EdgeInsets.all(2.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            alignment: dispositionIndex
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: dispositionIndex
                                  ? Colors.green
                                  : Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10000),
                              border: Border.all(
                                color: Colors.green.withOpacity(0.2),
                              ),
                            ),
                            child: Container(
                              height: 30,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Recto/Verso'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              dispositionIndex =
                                  dispositionIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: const EdgeInsets.all(2.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            alignment: !dispositionIndex
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: !dispositionIndex
                                  ? Colors.orange
                                  : Colors.orange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10000),
                              border: Border.all(
                                color: Colors.orange.withOpacity(0.2),
                              ),
                            ),
                            child: Container(
                              height: 30,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text('Reliure'),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text('Oui'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              reliureIndex = reliureIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: const EdgeInsets.all(2.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            alignment: reliureIndex
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: reliureIndex
                                  ? Colors.green
                                  : Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10000),
                              border: Border.all(
                                color: Colors.green.withOpacity(0.2),
                              ),
                            ),
                            child: Container(
                              height: 30,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Non'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              reliureIndex = reliureIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: const EdgeInsets.all(2.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            alignment: !reliureIndex
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: !reliureIndex
                                  ? Colors.orange
                                  : Colors.orange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10000),
                              border: Border.all(
                                color: Colors.orange.withOpacity(0.2),
                              ),
                            ),
                            child: Container(
                              height: 30,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('N. Copies'),
                        Container(
                          height: 50,
                          width: widget.deviceSize.width * .5 - 20,
                          margin: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              if (int.tryParse(value) == null) {
                                UtilFunctions.showFlashMessage(
                                  'Veuillez entre des chiffres !!!',
                                  Colors.red,
                                );
                                return;
                              }
                              setState(() {
                                totalPrice = int.parse(value) *
                                    int.parse(documentPrice.text
                                        .toString()
                                        .substring(0, 2));
                                debugPrint(documentCopies.text);
                              });
                            },
                            controller: documentCopies,
                            cursorColor: primaryColor,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            decoration: const InputDecoration(
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
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Prix U'),
                        Container(
                          height: 50,
                          width: widget.deviceSize.width * .5 - 20,
                          margin: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            controller: documentPrice,
                            cursorColor: primaryColor,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            decoration: const InputDecoration(
                              enabled: false,
                              contentPadding: EdgeInsets.only(bottom: 10.0),
                              disabledBorder: UnderlineInputBorder(
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
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Prix Total'),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    '$totalPrice FCFA',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Commentaire'),
                Container(
                  height: 150,
                  width: widget.deviceSize.width,
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: documentName,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.text,
                    maxLines: 05,
                    decoration: const InputDecoration(
                      hintText: 'Commentaire ou Instructions',
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
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text('Informations Personnelles'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Nom'),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: ownerName,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'votre nom',
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
                const SizedBox(
                  height: 10,
                ),
                const Text('Téléphone'),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: ownerPhone,
                    onChanged: (value) {
                      if (int.tryParse(value) == null) {
                        UtilFunctions.showFlashMessage(
                          'Veuillez entre des chiffres !!!',
                          Colors.red,
                        );
                      }
                    },
                    cursorColor: primaryColor,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(
                      hintText: 'numéro téléphone',
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
                const SizedBox(
                  height: 10,
                ),
                const Text('Whatsapp'),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: ownerWhatsapp,
                    onChanged: (value) {
                      if (int.tryParse(value) == null) {
                        UtilFunctions.showFlashMessage(
                          'Veuillez entre des chiffres !!!',
                          Colors.red,
                        );
                      }
                    },
                    cursorColor: primaryColor,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(
                      hintText: 'numéro whatsapp',
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
                const SizedBox(
                  height: 20,
                ),
                const Center(child: Text('Paiement via')),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text('Orange Money'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              paymentIndex = paymentIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: const EdgeInsets.all(2.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            alignment: paymentIndex
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: paymentIndex
                                  ? Colors.orange
                                  : Colors.orange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10000),
                              border: Border.all(
                                color: Colors.orange.withOpacity(0.2),
                              ),
                            ),
                            child: Container(
                              height: 30,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Mtn MoMo'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              paymentIndex = paymentIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: const EdgeInsets.all(2.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            alignment: !paymentIndex
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: !paymentIndex
                                  ? Colors.yellow
                                  : Colors.yellow.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10000),
                              border: Border.all(
                                color: Colors.yellow.withOpacity(0.5),
                              ),
                            ),
                            child: Container(
                              height: 30,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                          ),
                        ),
                      ],
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
      bottomNavigationBar: InkWell(
        onTap: () async {
          if (!_formKey.currentState!.validate()) {
            UtilFunctions.showFlashMessage(
              'Veuillez remplir tous les champs !!',
              Colors.red,
            );
          }

          await UtilFunctions.generateTicket();

          UtilFunctions.showFlashMessage(
            'Merci pour votre confiance !!',
            const Color.fromARGB(255, 75, 82, 76),
          );
        },
        child: Container(
          height: 40,
          margin: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/work.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Text(
                'Imprimer',
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
