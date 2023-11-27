import 'package:flutter/material.dart';

double height(double coaf, BuildContext context) {
  return MediaQuery.of(context).size.height / 800 * coaf;
}

double width(double coaf, BuildContext context) {
  return MediaQuery.of(context).size.width / 375 * coaf;
}
