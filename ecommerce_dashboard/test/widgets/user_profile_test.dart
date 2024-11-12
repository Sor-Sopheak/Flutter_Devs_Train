import 'package:ecommerce_dashboard/widgets/profiles/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserProfile Widget Tests', () {
    testWidgets('Displays image only when name and position are not provided',
        (WidgetTester tester) async {
      // setup
      const testImage = 'assets/images/user_profile.jpg';

      // action
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UserProfile(image: testImage),
          ),
        ),
      );

      //test
      final imageFinder = find.byType(Image);
      final nameFinder = find.text('Test User');
      final positionFinder = find.text('Developer');

      expect(imageFinder, findsOneWidget);
      expect(nameFinder, findsNothing);
      expect(positionFinder, findsNothing);
    });

    testWidgets('Display name and position when provided',
        (WidgetTester tester) async {
      // setup
      const testImage = 'assets/images/user_profile.jpg';
      const testName = 'Test User';
      const testPosition = 'Developer';

      // action
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UserProfile(
              image: testImage,
              name: testName,
              position: testPosition,
            ),
          ),
        ),
      );

      //test
      final nameFinder = find.text(testName);
      final positionFinder = find.text(testPosition);

      expect(nameFinder, findsOneWidget);
      expect(positionFinder, findsOneWidget);
    });

    testWidgets('Displays image with correct width and height', (WidgetTester tester) async {

      const testImage = 'assets/images/user_profile.jpg';
      const testWidth = 40.0;
      const testHeight = 40.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UserProfile(
              image: testImage,
              width: testWidth,
              height: testHeight,
            ),
          ),
        ),
      );

      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);

      expect(containerWidget.constraints!.maxWidth, equals(testWidth));
      expect(containerWidget.constraints!.maxHeight, equals(testHeight));
    });
  });
}
