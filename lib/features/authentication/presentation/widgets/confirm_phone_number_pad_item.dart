import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rogo/core/helpers/extentions_on_build_context.dart';
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
        splashColor: context.appColors.inputFillColor,
        highlightColor: AppColorScheme.transparent,
        onTap: () => context.read<PhoneVerificationCubit>().updateCode(text),
        child: Center(
          child: AppText(
            text,
            textAlign: TextAlign.center,
            style: context.appTextTheme.confirmPhoneNumberPadTextStyle,
          ),
        ),
      ),
    );
  }
}
