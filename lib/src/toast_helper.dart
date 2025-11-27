import 'package:flutter/material.dart';
import 'toast_widget.dart';

class FlutterAnimatedToast {
  static void show(
    BuildContext context, {
    // Default duration is 2 seconds you can override it
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    final overlay = Overlay.of(context);
    // ignore: unnecessary_null_comparison, dead_code
    if (overlay == null) return;

    final entry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 60,
        left: 24,
        right: 24,
        child: Center(
          child: FAnimatedToast(message: message, duration: duration),
        ),
      ),
    );

    overlay.insert(entry);

    Future.delayed(duration + const Duration(milliseconds: 400), () {
      entry.remove();
    });
  }
}
