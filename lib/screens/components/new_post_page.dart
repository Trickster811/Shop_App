import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ndere_ads/screens/components/image_view_page.dart';
import 'package:ndere_ads/screens/home_page.dart';
import 'package:ndere_ads/utils/utils.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({
    Key? key,
    required this.deviceSize,
    required this.adsObjets,
    this.firstTimeIndex,
  }) : super(key: key);
  final Size deviceSize;
  final AdsObjets adsObjets;
  final bool? firstTimeIndex;

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  List<File?> imageFile = [];

  // Form key
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get categoryItems {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: Text(
          "Commerce",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
        value: "Commerce",
      ),
      DropdownMenuItem(
        child: Text(
          "Offre Service",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
        value: "Offre Service",
      ),
      DropdownMenuItem(
        child: Text(
          "Formation",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
        value: "Formation",
      ),
    ];
    return items;
  }

  @override
  void initState() {
    if (widget.adsObjets.imageLink.isNotEmpty)
      for (var item in widget.adsObjets.imageLink) imageFile.add(File(item));
  }

  @override
  Widget build(BuildContext context) {
    String category = widget.adsObjets.tradeCategory;
    // Variables to get user entries
    final price =
        TextEditingController(text: widget.adsObjets.productPrice.toString());
    final location = TextEditingController(text: widget.adsObjets.location);
    final name = TextEditingController(text: widget.adsObjets.traderName);

    final phone = TextEditingController(
        text: widget.adsObjets.traderPhoneNumber.toString());
    final whatsapp = TextEditingController(
        text: widget.adsObjets.traderWhatsappNumber.toString());

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
          'Publier',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // await getImageFromDevice();
              // print(imageFile!.path);
            },
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
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Catégorie'),
                    SvgPicture.asset(
                      'assets/icons/category.4.svg',
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
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
                    value: category,
                    validator: (value) =>
                        value == null ? 'Veuillez choisir un type' : null,
                    items: categoryItems,
                    onChanged: (String? newValue) {
                      setState(() {
                        category = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Prix Unitaire'),
                    SvgPicture.asset(
                      'assets/icons/wallet.5.svg',
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextFormField(
                    controller: price,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
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
                    ),
                    validator: RequiredValidator(
                      errorText: 'Veuillez renseigner cet élément',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Localisation'),
                    SvgPicture.asset(
                      'assets/icons/arrow-down-square.svg',
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextFormField(
                    controller: location,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.text,
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Images'),
                    SvgPicture.asset(
                      'assets/icons/image-2.svg',
                    ),
                  ],
                ),
                Container(
                  height: imageFile == null ? 250 : 310,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // child: Text(imageFile.path),
                  child: imageFile.isEmpty
                      ? InkWell(
                          onTap: () async {
                            // final imageSource = await showDialog(context);
                            await getImageFromDevice();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Importer vos images'),
                              SizedBox(
                                height: 10,
                              ),
                              SvgPicture.asset(
                                'assets/icons/image-2.svg',
                              ),
                            ],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (var image in imageFile)
                                    InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         ImageViewScreen(
                                        //       imageLink: imageFile,
                                        //       deviceSize: widget.deviceSize,
                                        //     ),
                                        //   ),
                                        // );
                                      },
                                      child: Container(
                                        height: 250,
                                        // width: 250,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.file(
                                            image!,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                // final imageSource = await showDialog(context);
                                await getImageFromDevice();
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
                                      'assets/icons/image-2.svg',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nom'),
                    SvgPicture.asset(
                      'assets/icons/profile.1.svg',
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextFormField(
                    controller: name,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.name,
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Téléphone'),
                    SvgPicture.asset(
                      'assets/icons/calling.4.svg',
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextFormField(
                    controller: phone,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.number,
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Whatsapp'),
                    SvgPicture.asset(
                      'assets/icons/whatsapp.svg',
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextFormField(
                    controller: whatsapp,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.number,
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
          if (!_formKey.currentState!.validate())
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Container(
                  height: 40,
                  width: widget.deviceSize.width,
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Veuiller renseigner tous les champs!!',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Comfortaa_bold',
                    ),
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            );
          else
            showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                message: Text(
                  'Votre demande de publication a été envoyé avec succès',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Comfortaa_bold',
                  ),
                ),
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
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
                'assets/icons/send.3.svg',
                color: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Publier',
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

  Future showDialog(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(ImageSource.camera),
            child: Text('Camera'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
            child: Text('Gallery'),
          ),
        ],
      ),
    );
  }

  /// Get from Camera
  Future getImageFromDevice() async {
    try {
      List<PickedFile>? pickedFile =
          await ImagePicker.platform.pickMultiImage();
      if (pickedFile == null) return;
      List<File?> imageList = [];
      for (var element in pickedFile) {
        imageList.add(File(element.path));
      }
      setState(() {
        imageFile = imageList;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
