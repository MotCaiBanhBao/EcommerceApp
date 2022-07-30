import 'package:flutter/material.dart';

enum Languages { english, vietnam }

extension ParseToLocale on Languages {
  Locale toLocale() {
    if (this == Languages.vietnam) {
      return const Locale('vi');
    } else if (this == Languages.english) {
      return const Locale('en');
    } else {
      return const Locale('en');
    }
  }
}
