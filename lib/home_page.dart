import 'package:error_handler_app/custom_error_handler.dart';
import 'package:flutter/material.dart';

import 'custom_handler_tile.dart';
import 'default_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedHandlerIndex = 0;
  var _shouldThrowBuildPhaseError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Handler App'),
      ),
      body: Column(
        children: [
          if (_shouldThrowBuildPhaseError)
            Builder(builder: (_) => throw Exception('Build phase exception')),
          const SizedBox(height: 16),
          DefaultButton(
            onPressed: () => throw Exception('Exception caught by Flutter'),
            label: 'Throw error caught by Flutter',
          ),
          DefaultButton(
            onPressed: () {
              setState(() {
                _shouldThrowBuildPhaseError = true;
              });
            },
            label: 'Throw build phase error',
          ),
          const SizedBox(height: 36),
          const Text(
            'Errors caught by Flutter',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
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
