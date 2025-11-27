import 'package:flutter_animated_toast/flutter_animated_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AnimatedToast builds correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: FAnimatedToast(message: 'Hello'),
        ),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
  });
}
