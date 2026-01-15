import 'package:flutter_test/flutter_test.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('CustomButton has label', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomButton(
          onPressed: () {},
          label: 'Click Me',
        ),
      ),
    );

    expect(find.text('Click Me'), findsOneWidget);
  });
}
