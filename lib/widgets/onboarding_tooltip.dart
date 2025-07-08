import 'package:flutter/material.dart';

class OnboardingTooltip extends StatelessWidget {
  final String message;
  final VoidCallback onDismiss;

  const OnboardingTooltip({super.key, required this.message, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: onDismiss,
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: onDismiss,
                  child: const Text('Got it!'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
