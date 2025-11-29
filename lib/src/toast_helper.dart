import 'package:flutter/material.dart';
import 'toast_widget.dart';

enum ToastPosition { top, center, bottom }

class FlutterAnimatedToast {
  static void show(
    BuildContext context, {
    required String message,
    // Default duration is 2 seconds you can override it
    Duration duration = const Duration(seconds: 2),
    ToastPosition position = ToastPosition.bottom,
    Color? backgroundColor,
    TextStyle? textStyle,
    Widget? icon,
    EdgeInsets? padding,
    double borderRadius = 8.0,
  }) {
    final overlay = Overlay.of(context);
    // ignore: unnecessary_null_comparison, dead_code
    if (overlay == null) return;

    final entry = OverlayEntry(
      builder: (context) {
        Widget toast = FAnimatedToast(
          message: message,
          backgroundColor: backgroundColor,
          textStyle: textStyle,
          icon: icon,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          borderRadius: borderRadius,
          duration: duration,
        );

        if (position == ToastPosition.center) {
          return Center(child: toast);
        }

        final bottom = position == ToastPosition.bottom ? 60.0 : null;
        final top = position == ToastPosition.top
            ? MediaQuery.of(context).viewPadding.top + 16.0
            : null;

        return Positioned(
          top: top,
          bottom: bottom,
          left: 24,
          right: 24,
          child: Center(child: toast),
        );
      },
    );

    overlay.insert(entry);

    Future.delayed(duration + const Duration(milliseconds: 400), () {
      entry.remove();
    });
  }
}
