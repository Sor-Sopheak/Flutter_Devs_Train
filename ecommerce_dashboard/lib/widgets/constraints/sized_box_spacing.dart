import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

SizedBox HeightSized(DeviceScreenType deviceScreenType) {
  double heightSized;
  if (deviceScreenType == DeviceScreenType.desktop) {
    heightSized = 32.0;
  } else if (deviceScreenType == DeviceScreenType.tablet) {
    heightSized = 24.0;
  } else {
    heightSized = 16.0;
  }

  return SizedBox(
    height: heightSized,
  );
}

SizedBox WidthSized(DeviceScreenType deviceScreenType) {
  double widthSized;
  if (deviceScreenType == DeviceScreenType.desktop) {
    widthSized = 32.0;
  } else if (deviceScreenType == DeviceScreenType.tablet) {
    widthSized = 24.0;
  } else {
    widthSized = 16.0;
  }

  return SizedBox(
    width: widthSized,
  );
}
