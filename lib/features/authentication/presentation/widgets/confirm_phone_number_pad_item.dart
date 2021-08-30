import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../blocs/phone_verification_cubit/phone_verification_cubit.dart';

class ConfirmPhoneNumberPadItem extends StatelessWidget {
  final String text;
  const ConfirmPhoneNumberPadItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(75)),
        splashColor: context.read<AppThemeCubit>().state.appColors.inputFillColor,
        highlightColor: AppColorScheme.transparent,
        onTap: () => context.read<PhoneVerificationCubit>().updateCode(text),
        child: Center(
          child: AppText(
            text,
            textAlign: TextAlign.center,
            style: context.read<AppThemeCubit>().state.textTheme.confirmPhoneNumberPadTextStyle,
          ),
        ),
      ),
    );
  }
}
