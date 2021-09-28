import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/constants/app_colors.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'app_text.dart';

class GradientButton extends StatelessWidget {
  final Function()? onTap;
  final bool isWide;
  final Color? color;
  final Widget? child;
  final String text;
  final Color? textColor;
  final Gradient gradient;
  const GradientButton(
      {Key? key,
      this.onTap,
      this.isWide = true,
      this.color = AppColors.hollywoodCerise,
      this.child,
      this.text = '',
      required this.gradient,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isWide ? double.infinity : null,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
          gradient: gradient,
        ),
        child: isWide
            ? Center(
                child: child ??
                    AppText(
                      text,
                      style: context.appTextTheme.simpleButtonTextStyle,
                    ),
              )
            : child ??
                AppText(
                  text,
                  style: context.appTextTheme.simpleButtonTextStyle,
                ),
      ),
    );
  }
}
