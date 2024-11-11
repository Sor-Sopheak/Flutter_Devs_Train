import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

TextStyle titleFontSize(DeviceScreenType deviceScreenType) {
  double titleSize = deviceScreenType == DeviceScreenType.mobile ? 50 : 80;
  return TextStyle(
      fontWeight: FontWeight.w800, height: 0.9, fontSize: titleSize);
}

TextStyle descriptionFontSize(DeviceScreenType deviceScreenType) {
  double descriptionSize =
      deviceScreenType == DeviceScreenType.mobile ? 16 : 21;
  return TextStyle(fontSize: descriptionSize, height: 1.7);
}
