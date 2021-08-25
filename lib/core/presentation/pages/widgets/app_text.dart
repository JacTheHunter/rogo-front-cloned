import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/theme/app_color_scheme.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

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
    final colorizedStyle =
        style?.copyWith(color: style?.color ?? context.read<AppThemeCubit>().state.appColors.primaryTextColor);
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
