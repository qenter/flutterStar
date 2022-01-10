import 'package:flutter/material.dart';

class AppBarFactory {
  static AppBar onlyBackAppBar(String title) {
    return AppBar(
      title: Text(title),
    );
  }
}
