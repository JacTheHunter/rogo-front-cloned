import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/app_color_scheme.dart';
import '../../blocs/app_theme_cubit/app_theme_cubit.dart';
import 'app_text.dart';

class HaitiButton extends StatelessWidget {
  final Function()? onTap;
  final bool isWide;
  final Color? color;
  final Widget? child;
  final String text;
  final Color? textColor;
  const HaitiButton(
      {Key? key,
      this.onTap,
      this.isWide = true,
      this.color = AppColorScheme.white,
      this.child,
      this.text = '',
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isWide ? double.infinity : null,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColorScheme.haiti,
          ),
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: isWide
            ? Center(
                child: child ??
                    AppText(
                      text,
                      style: context
                          .read<AppThemeCubit>()
                          .state
                          .textTheme()
                          .haitiButtonTextStyle(),
                    ),
              )
            : child ??
                AppText(
                  text,
                  style: context
                      .read<AppThemeCubit>()
                      .state
                      .textTheme()
                      .haitiButtonTextStyle(),
                ),
      ),
    );
  }
}
