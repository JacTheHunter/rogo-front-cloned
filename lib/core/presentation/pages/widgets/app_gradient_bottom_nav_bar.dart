import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../../core/theme/app_color_scheme.dart';
import 'gradient_button.dart';


class AppGradientBottomNavBar extends StatelessWidget {
  const AppGradientBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .07,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsetsDirectional.all(20),
      decoration: BoxDecoration(
        color: AppColorScheme.haiti,
        borderRadius: BorderRadius.all(Radius.circular(14)),
        boxShadow: [
          BoxShadow(
            color: context
                .read<AppThemeCubit>()
                .state
                .appColors()
                .appbarShadowColor(),
            blurRadius: 24,
            offset: Offset(0, -4),
          )
        ],
      ),
      child: Row(
        children: [
          AppText(
            '\$50',
            style: context
                .read<AppThemeCubit>()
                .state
                .textTheme()
                .browseItemPriceNumberTextStyle()
                .copyWith(
                  color: AppColorScheme.white,
                  fontSize: 18,
                ),
          ),
          SizedBox(width: 8),
          AppText(
            'p/day',
            style: context
                .read<AppThemeCubit>()
                .state
                .textTheme()
                .browseItemPriceTextStyle()
                .copyWith(
                    color: AppColorScheme.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
          ),
          Spacer(),
          GradientButton(
            isWide: false,
            text: 'Rent now',
            gradient: context
                .read<AppThemeCubit>()
                .state
                .appColors()
                .createAccountHeaderGradient(),
          ),
        ],
      ),
    );
  }
}