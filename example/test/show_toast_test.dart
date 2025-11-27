// import 'package:flutter_animated_toast/flutter_animated_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_toast/flutter_animated_toast.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('showAnimatedToast inserts toast in overlay', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  FlutterAnimatedToast.show(context, message: "Test");
                },
                child: const Text("Show"),
              );
            },
          ),
        ),
      ),
    );

    // Tap the button to show toast
    await tester.tap(find.text("Show"));
    await tester.pump(); // start the animation

    // Toast should appear
    expect(find.text("Test"), findsOneWidget);

    // Let animations finish (duration + reverse)
    await tester.pump(const Duration(seconds: 3));

    // Toast removed after reverse animation
    expect(find.text("Test"), findsNothing);
  });
}
