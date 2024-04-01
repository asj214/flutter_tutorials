import 'package:flutter/material.dart';

class BasicDialog extends StatelessWidget {
  final String message;

  const BasicDialog({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: '',
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ]
    );
  }
}