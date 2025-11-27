import 'package:flutter/material.dart';
import 'toast_widget.dart';

void showAnimatedToast(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 2),
}) {
  final overlay = Overlay.of(context);
  // if (overlay == null) return;

  final entry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 60,
      left: 24,
      right: 24,
      child: Center(
        child: FlutterAnimatedToast(
          message: message,
          duration: duration,
        ),
      ),
    ),
  );

  overlay.insert(entry);

  Future.delayed(duration + const Duration(milliseconds: 400), () {
    entry.remove();
  });
}
