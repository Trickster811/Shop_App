import 'package:flutter/material.dart';

class DeletePostScreen extends StatelessWidget {
  const DeletePostScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).iconTheme.color,
        title: const Text(
          'Supprimer Publication',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
