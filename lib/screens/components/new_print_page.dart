import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [Text('')],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (!_formKey.currentState!.validate()) {
            final snackBar = SnackBar(
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
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {}
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
