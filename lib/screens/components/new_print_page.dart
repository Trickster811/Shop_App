import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:iut_ads/utils/utils.dart';

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
        title: Text(
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
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Titre document'),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextFormField(
                    controller: documentName,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
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
                SizedBox(
                  height: 10,
                ),
                Text('Fichier'),
                Container(
                  height: 160,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.all(5.0),
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
                              Text('Importer votre document'),
                              SizedBox(
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
                            SizedBox(
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
                                padding: EdgeInsets.symmetric(
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
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
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
                SizedBox(
                  height: 10,
                ),
                Text('Couleur'),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Oui'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              couleurIndex = couleurIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.symmetric(vertical: 5.0),
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
                        Text('Non'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              couleurIndex = couleurIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.symmetric(vertical: 5.0),
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
                SizedBox(
                  height: 20.0,
                ),
                Text('Disposition'),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Recto'),
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
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.symmetric(vertical: 5.0),
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
                        Text('Recto/Verso'),
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
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.symmetric(vertical: 5.0),
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
                SizedBox(
                  height: 20.0,
                ),
                Text('Reliure'),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Oui'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              reliureIndex = reliureIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.symmetric(vertical: 5.0),
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
                        Text('Non'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              reliureIndex = reliureIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.symmetric(vertical: 5.0),
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
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('N. Copies'),
                        Container(
                          height: 50,
                          width: widget.deviceSize.width * .5 - 20,
                          margin: EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              if (int.tryParse(value) == null)
                                return UtilFunctions.showFlashMessage(
                                  context,
                                  'Veuillez entre des chiffres !!!',
                                  Colors.red,
                                  widget.deviceSize,
                                );
                              setState(() {
                                totalPrice = int.parse(value) *
                                    int.parse(documentPrice.text
                                        .toString()
                                        .substring(0, 2));
                                print(documentCopies.text);
                              });
                            },
                            controller: documentCopies,
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.numberWithOptions(),
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
                            ),
                            validator: RequiredValidator(
                              errorText: 'Veuillez renseigner cet élément',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Prix U'),
                        Container(
                          height: 50,
                          width: widget.deviceSize.width * .5 - 20,
                          margin: EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                            controller: documentPrice,
                            cursorColor: primaryColor,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
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
                SizedBox(
                  height: 10,
                ),
                Text('Prix Total'),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    totalPrice.toString() + ' FCFA',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Commentaire'),
                Container(
                  height: 150,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(
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
                    decoration: InputDecoration(
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
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text('Informations Personnelles'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Nom'),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextFormField(
                    controller: ownerName,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
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
                SizedBox(
                  height: 10,
                ),
                Text('Téléphone'),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextFormField(
                    controller: ownerPhone,
                    onChanged: (value) {
                      if (int.tryParse(value) == null) {
                        UtilFunctions.showFlashMessage(
                          context,
                          'Veuillez entre des chiffres !!!',
                          Colors.red,
                          widget.deviceSize,
                        );
                      }
                    },
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
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
                SizedBox(
                  height: 10,
                ),
                Text('Whatsapp'),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextFormField(
                    controller: ownerWhatsapp,
                    onChanged: (value) {
                      if (int.tryParse(value) == null) {
                        UtilFunctions.showFlashMessage(
                          context,
                          'Veuillez entre des chiffres !!!',
                          Colors.red,
                          widget.deviceSize,
                        );
                      }
                    },
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
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
                SizedBox(
                  height: 20,
                ),
                Center(child: Text('Paiement via')),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Orange Money'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              paymentIndex = paymentIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.symmetric(vertical: 5.0),
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
                        Text('Mtn MoMo'),
                        InkWell(
                          onTap: () {
                            setState(() {
                              paymentIndex = paymentIndex ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.symmetric(vertical: 5.0),
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
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            UtilFunctions.showFlashMessage(
              context,
              'Merci pour votre confiance !!',
              Colors.green,
              widget.deviceSize,
            );
          } else {
            UtilFunctions.showFlashMessage(
              context,
              'Veuillez remplir tous les champs !!',
              Colors.red,
              widget.deviceSize,
            );
          }
        },
        child: Container(
          height: 40,
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(1000),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/work.svg',
                color: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
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
