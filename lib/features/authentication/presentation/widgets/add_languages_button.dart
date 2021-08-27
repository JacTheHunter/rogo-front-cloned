import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

class AddLanguagesButton extends StatelessWidget {
  final Function()? onTap;
  const AddLanguagesButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 56,
        decoration: BoxDecoration(
          border: Border.all(color: context.read<AppThemeCubit>().state.appColors.primaryTextColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: context.read<AppThemeCubit>().state.appIcons.addLanguageButtonIcon,
        ),
      ),
    );
  }
}
