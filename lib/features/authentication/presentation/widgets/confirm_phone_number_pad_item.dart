import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/theme/app_color_scheme.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

class ConfirmPhoneNumberPadItem extends StatelessWidget {
  final String text;
  final Function() onTap;
  const ConfirmPhoneNumberPadItem({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(75)),
        splashColor: context.read<AppThemeCubit>().state.appColors().inputFillColor(),
        highlightColor: AppColorScheme.transparent,
        onTap: onTap,
        child: Center(
          child: AppText(
            text,
            textAlign: TextAlign.center,
            style: context.read<AppThemeCubit>().state.textTheme().confirmPhoneNumberPadTextStyle(),
          ),
        ),
      ),
    );
  }
}
