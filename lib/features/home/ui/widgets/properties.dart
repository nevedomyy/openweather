import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:openweather/core/utils/utils.dart';

class Properties extends StatelessWidget {
  final String svgIconPath;
  final String value;
  final String text;

  const Properties({
    required this.svgIconPath,
    required this.value,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          svgIconPath,
          height: 30,
          width: 30,
        ),
        const SizedBox(width: 4),
        Text(
          '$text: $value',
          style: AppTextStyle.black18,
        ),
      ],
    );
  }
}
