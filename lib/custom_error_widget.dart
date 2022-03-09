import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomErrorWidget extends ErrorWidget {
  final Object exception;

  CustomErrorWidget(this.exception) : super(exception);

  @override
  RenderBox createRenderObject(BuildContext context) {
    RenderErrorBox.backgroundColor = Colors.lightBlue.shade900;
    return RenderErrorBox(exception.toString());
  }
}
