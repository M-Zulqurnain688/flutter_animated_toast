// import 'package:flutter_animated_toast/flutter_animated_toast.dart';
import 'package:flutter/material.dart';

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
          child: ElevatedButton(
            onPressed: () =>{
              
            }, 
            // showAnimatedToast(context, 'Hello from package!', duration: const Duration(seconds: 5)),
            child: const Text("Show Toast"),
          ),
        ),
      ),
    );
  }
}
