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
        appBar: AppBar(title: const Text("Flutter Animated Toast Example")),
        body: Center(
          child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  FlutterAnimatedToast.show(
                    context,
                    message: "Success!",
                    // message: "Warning!",
                    // message: "Error!",
                    // message: "Info!",
                    icon: Icon(Icons.check_circle_outline, color: Colors.white, size: 16.0,),
                    // icon: Icon(Icons.warning_amber_outlined, color: Colors.white, size: 16.0,),
                    // icon: Icon(Icons.error_outline_outlined, color: Colors.white, size: 16.0,),
                    // icon: Icon(Icons.info_outline, color: Colors.white, size: 16.0,),
                    backgroundColor: Colors.green,
                    // backgroundColor: Colors.amber,
                    // backgroundColor: Colors.red,
                    position: ToastPosition.top,
                    // position: ToastPosition.center,
                    // position: ToastPosition.bottom,
                    // duration: Duration(seconds: 5),
                  );
                },
                child: const Text("Show Toast"),
              );
            },
          ),
        ),
      ),
    );
  }
}
