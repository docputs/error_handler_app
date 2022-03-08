import 'package:flutter/material.dart';

import 'custom_error_handler.dart';

class CustomHandlerTile extends StatelessWidget {
  final CustomErrorHandler handler;
  final bool isSelected;
  final VoidCallback onEnabled;

  const CustomHandlerTile(
    this.handler, {
    Key? key,
    required this.isSelected,
    required this.onEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        handler.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(handler.description),
      trailing: SizedBox(
        width: 90,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: isSelected ? Colors.green : Colors.grey,
          ),
          onPressed: () {
            handler.onSelected();
            onEnabled();
          },
          child: Text(isSelected ? 'Enabled' : 'Disabled'),
        ),
      ),
    );
  }
}
