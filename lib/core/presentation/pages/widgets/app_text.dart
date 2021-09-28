import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../theme/app_color_scheme.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';

class AppText extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final double? height;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextStyle? style;

  const AppText(
    this.data, {
    Key? key,
    this.color = AppColorScheme.haiti,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorizedStyle = style?.copyWith(color: style?.color ?? context.appColors.primaryTextColor);
    return Text(
      translate(data),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      style: colorizedStyle ??
          TextStyle(
            fontWeight: fontWeight,
            color: color,
            fontSize: fontSize,
            height: height,
          ),
    );
  }
}
