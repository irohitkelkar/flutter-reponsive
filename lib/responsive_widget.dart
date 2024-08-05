import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? web;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.web,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    if (isWeb(context) && web != null) {
      return web!;
    } else if (isTablet(context) && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
