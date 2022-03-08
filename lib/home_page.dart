import 'package:error_handler_app/custom_error_handler.dart';
import 'package:flutter/material.dart';

import 'custom_handler_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedHandlerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Handler App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Errors caught by Flutter',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    throw Exception();
                  },
                  child: const Text(
                    'THROW',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: customErrorHandlers.length,
              itemBuilder: (context, index) {
                final handler = customErrorHandlers[index];
                return CustomHandlerTile(
                  handler,
                  isSelected: _selectedHandlerIndex == index,
                  onEnabled: () {
                    setState(() {
                      _selectedHandlerIndex = index;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
