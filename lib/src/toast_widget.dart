import 'package:flutter/material.dart';

/// Very small toast widget. Call from an OverlayEntry.
class FlutterAnimatedToast extends StatefulWidget {
  final String message;
  final Duration duration;
  final Curve curve;

  const FlutterAnimatedToast({
    super.key,
    required this.message,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeOut,
  });

  @override
  State<FlutterAnimatedToast> createState() => _FlutterAnimatedToastState();
}

class _FlutterAnimatedToastState extends State<FlutterAnimatedToast> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
  late final Animation<Offset> _offset = Tween(begin: const Offset(0, 0.6), end: Offset.zero).animate(CurvedAnimation(parent: _ctrl, curve: widget.curve));

  @override
  void initState() {
    super.initState();
    _ctrl.forward();
    Future.delayed(widget.duration, () async {
      await _ctrl.reverse();
      if (mounted) {
        // remove overlay in host code
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offset,
      child: Material(
        // color: Colors.black.withOpacity(0.8),
        color: Colors.black.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(widget.message, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
