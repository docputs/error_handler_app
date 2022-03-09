import 'package:flutter/material.dart';

import 'custom_error_widget.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Error Handler',
      builder: (context, child) {
        final errorWidget = CustomErrorWidget(
          Exception('This is a custom build phase error widget'),
        );
        ErrorWidget.builder = (details) => errorWidget;
        return child ?? const SizedBox.shrink();
      },
      home: const HomePage(),
    );
  }
}
