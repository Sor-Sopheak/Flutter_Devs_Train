import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

EdgeInsets PaddingAll(DeviceScreenType deviceScreenType) {
  double paddingAll;

  if (deviceScreenType == DeviceScreenType.desktop) {
    paddingAll = 32.0;
  } else if (deviceScreenType == DeviceScreenType.tablet) {
    paddingAll = 24.0;
  } else {
    paddingAll = 16.0;
  }

  return EdgeInsets.all(paddingAll);
}

EdgeInsets PaddingSymmetric(DeviceScreenType deviceScreenType) {
  double horizontal;
  double vertical;

  if (deviceScreenType == DeviceScreenType.desktop) {
    horizontal = 32.0;
    vertical = 32.0;
  } else if (deviceScreenType == DeviceScreenType.tablet) {
    horizontal = 24.0;
    vertical = 24.0;
  } else {
    horizontal = 16.0;
    vertical = 16.0;
  }

  return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}
