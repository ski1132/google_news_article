import 'package:flutter/material.dart';

class InkWellNoSplash extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  const InkWellNoSplash({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
