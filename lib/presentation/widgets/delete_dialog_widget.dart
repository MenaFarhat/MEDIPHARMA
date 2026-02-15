import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final String title;
  final String message;

  const DeleteDialog({super.key, 
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              message,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
