import 'package:ecommerce_dashboard/widgets/texts/text_display.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GreetingText extends StatelessWidget {
  final String greeting;
  final String userName;
  final String description;
  const GreetingText(
      {super.key,
      required this.greeting,
      required this.userName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      TextStyle titleStyle = titleTextStyle(sizingInformation.deviceScreenType);
      TextStyle descriptionStyle =
          descriptionTextStyle(sizingInformation.deviceScreenType);
      
      return RichText(
        text: TextSpan(
          text: '${greeting}, ',
          style: titleStyle,
          children: <TextSpan>[
            TextSpan(
              text: '${userName}!',
            ),
            TextSpan(
              text: '\n${description}',
              style: descriptionStyle,
            ),

          ],
        ),
      );
    });
  }
}
