import 'package:flutter/material.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({
    required this.onAllow,
    required this.onCancel,
    super.key,
  });

  final VoidCallback onAllow;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Row(
        children: [
          Icon(Icons.camera_alt, color: Colors.blue),
          SizedBox(width: 12),
          Text('Camera Permission Required'),
        ],
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lexigo needs camera access to scan objects and help you learn vocabulary.',
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.security, color: Colors.blue, size: 16),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Your privacy is protected. Images are processed locally.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: onAllow,
          child: const Text('Allow Camera'),
        ),
      ],
    );
  }
}
