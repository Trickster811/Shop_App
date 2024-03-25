import 'package:flutter/material.dart';

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
    return const SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }
}
