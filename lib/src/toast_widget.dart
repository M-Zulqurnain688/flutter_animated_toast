import 'package:flutter/material.dart';

/// Very small toast widget. Call from an OverlayEntry.
class FAnimatedToast extends StatefulWidget {
  final String message;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Widget? icon;
  final EdgeInsets padding;
  final double borderRadius;
  final Duration duration;
  final Curve curve;

  const FAnimatedToast({
    super.key,
    required this.message,
    this.backgroundColor,
    this.textStyle,
    this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    this.borderRadius = 8.0,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeOut,
  });

  @override
  State<FAnimatedToast> createState() => _FAnimatedToastState();
}

class _FAnimatedToastState extends State<FAnimatedToast>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
  );
  late final Animation<Offset> _offset = Tween(
    begin: const Offset(0, 0.6),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _ctrl, curve: widget.curve));

  late final Animation<double> _fade = CurvedAnimation(
    parent: _ctrl,
    curve: Curves.easeOut,
  );

  @override
  void initState() {
    super.initState();
    // Animate IN
    _ctrl.forward();

    // Animate OUT after duration
    Future.delayed(widget.duration, () async {
      if (mounted) await _ctrl.reverse();
      // OverlayEntry removal is handled in parent helper.
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bg = widget.backgroundColor ?? Colors.black.withOpacity(0.8);
    final ts = widget.textStyle ?? const TextStyle(color: Colors.white);

    return SlideTransition(
      position: _offset,
      child: FadeTransition(
        opacity: _fade,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: widget.padding,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  widget.icon!,
                  const SizedBox(width: 8),
                ],
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // if (widget.heading != null)
                      //   Text(
                      //     widget.heading!,
                      //     style: ts.copyWith(fontWeight: FontWeight.bold),
                      //   ),
                      Text(widget.message, style: ts),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return SlideTransition(
    //   position: _offset,
    //   child: FadeTransition(
    //     opacity: _fade,
    //     child: Material(
    //       color: Colors.black.withValues(alpha: 0.8),
    //       borderRadius: BorderRadius.circular(8),
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    //         child: Text(
    //           widget.message,
    //           style: const TextStyle(color: Colors.white),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
