import 'dart:io';

import 'package:b_shop/utils/controllers.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:b_shop/screens/components/image_view_page.dart';
import 'package:b_shop/screens/shop_page.dart';
import 'package:b_shop/utils/utils.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({
    super.key,
    required this.deviceSize,
    this.adsObjets,
    this.firstTimeIndex,
  });
  final Size deviceSize;
  final AdsObjects? adsObjets;
  final bool? firstTimeIndex;

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  List imageFile = [];

  // Variables to get user entries
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final descriptionController = TextEditingController();
  String? category;
  String? family;
  bool delivery = true;
  // Specifications
  List<String?> specs = [];
  List<TextEditingController> specValueController = [];
  int numberSpecs = 1;
  // Form key
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get tradeCategory {
    List<DropdownMenuItem<String>> categories = [];
    for (var item in Category.categorySnapshot) {
      categories.add(
        DropdownMenuItem(
          value: item['name'],
          child: Text(
            item['name'],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              overflow: TextOverflow.ellipsis,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      );
    }

    return categories;
  }

  List<DropdownMenuItem<String>> get familyComputers {
    List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem(
        value: "ACER",
        child: Text(
          "ACER",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "ASUS",
        child: Text(
          "ASUS",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "DELL",
        child: Text(
          "DELL",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "HP",
        child: Text(
          "HP",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "HUAWEI",
        child: Text(
          "HUAWEI",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "LENOVO",
        child: Text(
          "LENOVO",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "LENOVO THINK",
        child: Text(
          "LENOVO THINK",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "APPLE",
        child: Text(
          "APPLE",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "SAMSUNG",
        child: Text(
          "SAMSUNG",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "SURFACE",
        child: Text(
          "SURFACE",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "TECNO",
        child: Text(
          "TECNO",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "TOSHIBA",
        child: Text(
          "TOSHIBA",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    ];
    return items;
  }

  List<DropdownMenuItem<String>> get specificationsComputers {
    List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem(
        value: "BATTERIE",
        child: Text(
          "BATTERIE",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "CPU",
        child: Text(
          "CPU",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "ECRAN",
        child: Text(
          "ECRAN",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "GPU",
        child: Text(
          "GPU",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "RAM",
        child: Text(
          "RAM",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "ROM",
        child: Text(
          "ROM",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    ];
    return items;
  }

  @override
  void initState() {
    super.initState();
    if (widget.adsObjets != null) {
      imageFile.addAll(widget.adsObjets!.imageLink);
      nameController.text = widget.adsObjets!.productName.toString();
      priceController.text = widget.adsObjets!.productPrice.toString();
      quantityController.text = widget.adsObjets!.quantity.toString();
      descriptionController.text =
          widget.adsObjets!.productDescription.toString();
      family = widget.adsObjets!.tradeFamily;
      category = widget.adsObjets!.tradeCategory;
      specs.addAll(widget.adsObjets!.productSpecifications!.keys.toList());
      for (var entry in widget.adsObjets!.productSpecifications!.entries) {
        specValueController.add(TextEditingController(
          text: entry.value,
        ));
      }
      numberSpecs = widget.adsObjets!.productSpecifications!.length;
    } else {
      specs.add(null);
      specValueController.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
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
          'Publier',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () async {
        //       // await getImageFromDevice();
        //       // print(imageFile!.path);
        //     },
        //     icon: SvgPicture.asset(
        //       'assets/icons/family.2.svg',
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Categorie'),
                    SvgPicture.asset(
                      'assets/icons/category.4.svg',
                    ),
                  ],
                ),
                DropdownButtonFormField(
                  style: const TextStyle(
                    fontSize: 10,
                    height: 0.5,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: primaryColor.withOpacity(0.1),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 8.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    hintText: 'choose',
                  ),
                  value: category,
                  validator: (value) =>
                      value == null ? 'Veuillez choisir une categorie' : null,
                  items: tradeCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      category = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                if (category == 'Ordinateurs' || category == 'Telephones') ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Family'),
                      SvgPicture.asset(
                        'assets/icons/category.4.svg',
                      ),
                    ],
                  ),
                  DropdownButtonFormField(
                    style: const TextStyle(
                      fontSize: 10,
                      height: 0.5,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: primaryColor.withOpacity(0.1),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 8.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      hintText: 'choose',
                    ),
                    value: family,
                    validator: (value) =>
                        value == null ? 'Veuillez choisir une Famille' : null,
                    items: familyComputers,
                    onChanged: (String? newValue) {
                      setState(() {
                        family = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Nom'),
                    SvgPicture.asset(
                      'assets/icons/edit.2.svg',
                    ),
                  ],
                ),
                postFieldBuilder(
                  controller: nameController,
                  fieldTitle: 'nom',
                  numericField: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Prix Unitaire'),
                    SvgPicture.asset(
                      'assets/icons/wallet.5.svg',
                    ),
                  ],
                ),
                postFieldBuilder(
                  controller: priceController,
                  fieldTitle: '0.0',
                  numericField: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Quantite'),
                    SvgPicture.asset(
                      'assets/icons/quantity-1.svg',
                    ),
                  ],
                ),
                postFieldBuilder(
                  controller: quantityController,
                  fieldTitle: '00',
                  numericField: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Images'),
                    SvgPicture.asset(
                      'assets/icons/image-2.svg',
                    ),
                  ],
                ),
                Container(
                  height: imageFile.isEmpty ? 250 : 310,
                  width: widget.deviceSize.width,
                  margin: const EdgeInsets.all(5.0),
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
                              const Text('Importer vos images'),
                              const SizedBox(
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ImageViewScreen(
                                              imageLink: imageFile,
                                              deviceSize: widget.deviceSize,
                                              fileImage:
                                                  widget.adsObjets != null
                                                      ? false
                                                      : true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 250,
                                        // width: 250,
                                        margin: const EdgeInsets.symmetric(
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
                                          child: widget.adsObjets == null
                                              ? Image.file(
                                                  image!,
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.network(
                                                  image!,
                                                  fit: BoxFit.fill,
                                                ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(
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
                                      'assets/icons/image-2.svg',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Description'),
                    SvgPicture.asset(
                      'assets/icons/description.svg',
                    ),
                  ],
                ),
                postFieldBuilder(
                  controller: descriptionController,
                  fieldTitle: 'details',
                  numericField: false,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Livraison Gratuite'),
                    SvgPicture.asset(
                      'assets/icons/delivery.svg',
                      height: 20,
                    ),
                  ],
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
                              delivery = delivery ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: const EdgeInsets.all(2.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            alignment: delivery
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: delivery
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
                              delivery = delivery ? false : true;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 55,
                            padding: const EdgeInsets.all(2.0),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            alignment: !delivery
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: !delivery
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
                if (category == 'Ordinateurs' || category == 'Telephones') ...[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Specifications'),
                      SvgPicture.asset(
                        'assets/icons/specifications-1.svg',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ...[
                    for (var i = 0; i < numberSpecs; i++)
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: widget.deviceSize.width * .3,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                menuMaxHeight: widget.deviceSize.height * .8,
                                style: const TextStyle(
                                  fontSize: 10,
                                  overflow: TextOverflow.ellipsis,
                                  height: 0.5,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: primaryColor.withOpacity(0.1),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 8.0,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  hintText: 'choose',
                                  hintStyle: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                value: specs[i],
                                validator: (value) => value == null
                                    ? 'Veuillez choisir un type'
                                    : null,
                                items: specificationsComputers,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    specs[i] = newValue!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: postFieldBuilder(
                                controller: specValueController[i],
                                fieldTitle: '00',
                                numericField: true,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                onTap: () {
                                  _removeSpecification(index: i);
                                },
                                child: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: _addSpecification,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (!_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Container(
                      height: 40,
                      width: widget.deviceSize.width,
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Veuiller renseigner tous les champs!!',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                );
              } else {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    message: const Text(
                      'Votre demande de publication a été enregistree avec succès',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Container(
              height: 40,
              width: widget.deviceSize.width / 2.5,
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: thirdColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
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
                    'assets/icons/send.3.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    'Enregistrer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (!_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Container(
                      height: 40,
                      width: widget.deviceSize.width,
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Veuiller renseigner tous les champs!!',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                );
              } else {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    message: const Text(
                      'Votre demande de publication a été envoyé avec succès',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Container(
              height: 40,
              width: widget.deviceSize.width / 2.5,
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
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
                    'assets/icons/send.3.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
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
        ],
      ),
    );
  }

  DropdownButtonFormField<String> dropDownBuilder({
    required String? controller,
    required String fieldTitle,
    required List<DropdownMenuItem<String>>? dropDownItemsList,
  }) {
    return DropdownButtonFormField(
      style: const TextStyle(
        fontSize: 10,
        height: 0.5,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: primaryColor.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: 'choose',
      ),
      value: controller,
      validator: (value) =>
          value == null ? 'Veuillez choisir une $fieldTitle' : null,
      items: dropDownItemsList,
      onChanged: (String? newValue) {
        setState(() {
          controller = newValue!;
        });
      },
    );
  }

  TextFormField postFieldBuilder({
    required TextEditingController controller,
    required String fieldTitle,
    required bool numericField,
  }) {
    return TextFormField(
      controller: controller,
      cursorColor: primaryColor,
      keyboardType: numericField
          ? const TextInputType.numberWithOptions(
              decimal: true,
            )
          : TextInputType.text,
      maxLines: fieldTitle == 'details' ? 5 : 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: primaryColor.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        hintText: fieldTitle,
      ),
      validator: RequiredValidator(
        errorText: 'Veuillez renseigner cet élément',
      ).call,
    );
  }

  Future showDialog(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(ImageSource.camera),
            child: const Text('Camera'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
            child: const Text('Gallery'),
          ),
        ],
      ),
    );
  }

  /// Get from Camera
  Future getImageFromDevice() async {
    final ImagePicker picker = ImagePicker();
    try {
      final pickedFile = await picker.pickMultiImage();

      if (pickedFile.isEmpty) return;
      List<File?> imagesFiles = [];
      for (var pic in pickedFile) {
        imagesFiles.add(File(pic.path));
      }
      setState(() {
        imageFile = imagesFiles;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  _addSpecification() {
    setState(() {
      numberSpecs++;
      specs.add(null);
      specValueController.add(TextEditingController());
    });
  }

  _removeSpecification({required int index}) {
    setState(() {
      numberSpecs--;
      specs.removeAt(index);
      specValueController.removeAt(index);
    });
  }
}
