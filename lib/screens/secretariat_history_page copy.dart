import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ndere_ads/screens/components/image_view_page.dart';
import 'package:ndere_ads/screens/components/new_post_page.dart';
import 'package:ndere_ads/screens/home_page.dart';
import 'package:ndere_ads/utils/utils.dart';
import 'package:ndere_ads/welcome_pages/auth/sign_in_page.dart';

class SecretariatHistoryScreen extends StatefulWidget {
  const SecretariatHistoryScreen({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);
  final Size deviceSize;

  @override
  State<SecretariatHistoryScreen> createState() =>
      _SecretariatHistoryScreenState();
}

class _SecretariatHistoryScreenState extends State<SecretariatHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }
}
