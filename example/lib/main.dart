import 'package:flutter/material.dart';
import 'package:flutter_animated_toast/flutter_animated_toast.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Animated Toast Example")),
        body: Center(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  FlutterAnimatedToast.show(
                    context,
                    message: 'Hello from flutter animated toast!',
                  );
                },
                child: const Text("Show Toast"),
              );
            }
          ),
        ),
      ),
    );
  }
}
