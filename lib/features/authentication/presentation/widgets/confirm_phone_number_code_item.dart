import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

class ConfirmPhoneNumberCodeItem extends StatelessWidget {
  final String text;
  const ConfirmPhoneNumberCodeItem({Key? key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 50,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: text.isEmpty
            ? context.read<AppThemeCubit>().state.appColors.inputFillColor
            : context.read<AppThemeCubit>().state.appColors.primaryColor,
      ),
      child: Center(
        child: AppText(
          text,
          textAlign: TextAlign.center,
          style: context.read<AppThemeCubit>().state.textTheme.confirmPhoneSelectedNumberTextStyle,
        ),
      ),
    );
  }
}
