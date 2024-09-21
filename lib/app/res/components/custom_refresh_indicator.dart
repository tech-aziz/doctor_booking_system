import 'package:flutter/material.dart';
class CustomRefreshIndicator extends StatelessWidget {
final double strokeWidth;
 final Color color;
 final Widget child;
  final Future<void> Function() onRefresh;
 const CustomRefreshIndicator({super.key, required this.strokeWidth, required this.color, required this.onRefresh,required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      strokeWidth: strokeWidth,
      color: Colors.green,
      onRefresh: onRefresh, child: child,
    );
  }
}
