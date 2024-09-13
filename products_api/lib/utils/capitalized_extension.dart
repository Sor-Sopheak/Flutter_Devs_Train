import 'package:flutter/material.dart';

extension MyExtension on String {
  String capitalize() {
    return"${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}