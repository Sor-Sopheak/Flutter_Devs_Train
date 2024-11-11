import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

// Title text style for different device types
TextStyle LargeTitleTextStyle(DeviceScreenType deviceScreenType) {
  double titleSize;
  
  if (deviceScreenType == DeviceScreenType.desktop) {
    titleSize = 30.0;  // Larger font size for desktop
  } else if (deviceScreenType == DeviceScreenType.tablet) {
    titleSize = 26.0;  // Medium font size for tablet
  } else {
    titleSize = 22.0;  // Smaller font size for mobile
  }
  
  return TextStyle(
    fontWeight: FontWeight.w800, 
    height: 0.9, 
    fontSize: titleSize,
    color: AppColors.blackColor,
  );
}

TextStyle titleTextStyle(DeviceScreenType deviceScreenType) {
  double titleSize;
  
  // Adjust title size based on device type
  if (deviceScreenType == DeviceScreenType.desktop) {
    titleSize = 20.0;  
  } else if (deviceScreenType == DeviceScreenType.tablet) {
    titleSize = 8.0;  
  } else {
    titleSize = 16.0; 
  }
  
  return TextStyle(
    fontWeight: FontWeight.w800, 
    height: 0.9, 
    fontSize: titleSize,
    color: AppColors.blackColor,
  );
}


// Description text style for different device types
TextStyle descriptionTextStyle(DeviceScreenType deviceScreenType) {
  double descriptionSize;
  
  // Adjust description size based on device type
  if (deviceScreenType == DeviceScreenType.desktop) {
    descriptionSize = 18.0;  // Larger font size for desktop
  } else if (deviceScreenType == DeviceScreenType.tablet) {
    descriptionSize = 16.0;  // Medium font size for tablet
  } else {
    descriptionSize = 14.0;  // Smaller font size for mobile
  }

  return TextStyle(
    fontSize: descriptionSize,
    height: 1.7,  
    color: AppColors.greyColor,
    fontWeight: FontWeight.w400,
  );
}


