import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IconWidget extends StatelessWidget {
  final double dimension;
  final String icon;

  const IconWidget({
    super.key,
    required this.icon,
    this.dimension = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animation/$icon.json',
      height: dimension,
      width: dimension,
      errorBuilder: (context, e, s) => const SizedBox(),
    );
  }
}
