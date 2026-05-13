import 'package:flutter/material.dart';

class DeleteDialog {
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,

      builder: (_) => AlertDialog(
        title: const Text("Delete Activity?"),

        content: const Text("This action cannot be undone."),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },

            child: const Text("Cancel"),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },

            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}
