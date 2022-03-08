import 'dart:io';

import 'package:flutter/foundation.dart';

class CustomErrorHandler {
  final String title;
  final String description;
  final void Function() onSelected;

  const CustomErrorHandler({
    required this.title,
    required this.description,
    required this.onSelected,
  });
}

final customErrorHandlers = [
  CustomErrorHandler(
    title: 'Default',
    description: 'Flutter default error handler',
    onSelected: () {
      FlutterError.onError = (details) => FlutterError.presentError(details);
    },
  ),
  CustomErrorHandler(
    title: 'Dont dump to console',
    description: 'Dont show error in the console',
    onSelected: () {
      FlutterError.onError = null;
    },
  ),
  CustomErrorHandler(
    title: 'Exit app',
    description: 'Exit the app when error is thrown',
    onSelected: () {
      FlutterError.onError = (details) => exit(1);
    },
  ),
  CustomErrorHandler(
    title: 'Exit app and show in console',
    description: 'Exit the app and show error in console',
    onSelected: () {
      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        exit(1);
      };
    },
  ),
];
