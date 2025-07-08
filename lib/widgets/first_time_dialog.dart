import 'package:flutter/material.dart';

class FirstTimeDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onClose;

  const FirstTimeDialog({super.key, required this.title, required this.message, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onClose,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
