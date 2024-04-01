import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/screens/shop_page.dart';
import 'package:shop_app/utils/utils.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({
    Key? key,
    required this.deviceSize,
    this.adsObjets,
    this.firstTimeIndex,
  }) : super(key: key);
  final Size deviceSize;
  final AdsObjets? adsObjets;
  final bool? firstTimeIndex;

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  List<File?> imageFile = [];

// Variables to get user entries
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final descriptionController = TextEditingController();
  String? family;
  String? specs;
  int numberSpecs = 1;
  // Form key
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get familyComputers {
    List<DropdownMenuItem<String>> items = [
      const DropdownMenuItem(
        value: "DELL",
        child: Text(
          "DELL",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "HP",
        child: Text(
          "HP",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "TOSHIBA",
        child: Text(
          "TOSHIBA",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Comfortaa_bold',
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
            color: primaryColor,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "CPU",
        child: Text(
          "CPU",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "RAM",
        child: Text(
          "RAM",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Comfortaa_bold',
          ),
        ),
      ),
      const DropdownMenuItem(
        value: "RAM",
        child: Text(
          "RAM",
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Comfortaa_bold',
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
      if (widget.adsObjets!.imageLink.isNotEmpty) {
        for (var item in widget.adsObjets!.imageLink) {
          imageFile.add(File(item));
        }
      }
      priceController.text = widget.adsObjets!.productPrice.toString();
      family = widget.adsObjets!.tradeFamily;
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
                      value == null ? 'Veuillez choisir un type' : null,
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
                Wrap(
                  children: [
                    for (var i = 0; i < numberSpecs; i++)
                      Row(
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
                                hintStyle: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              value: specs,
                              validator: (value) => value == null
                                  ? 'Veuillez choisir un type'
                                  : null,
                              items: specificationsComputers,
                              onChanged: (String? newValue) {
                                setState(() {
                                  specs = newValue!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            child: postFieldBuilder(
                              controller: quantityController,
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
                              onTap: () {},
                              child: const Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
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
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
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
                      fontFamily: 'Comfortaa_bold',
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
                    fontFamily: 'Comfortaa_bold',
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
    });
  }
}
