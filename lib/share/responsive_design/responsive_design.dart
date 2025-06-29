import 'package:flutter/material.dart';

class ResponsiveDesign extends StatelessWidget {
  const ResponsiveDesign({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile
  });

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints) {
          if(constraints.maxWidth > 1024) {
            return desktop;
          } else if(constraints.maxWidth < 1024 && constraints.maxWidth > 600) {
            return tablet;
          } else {
            return mobile;
          }
        },
    );
  }
}
