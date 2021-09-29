import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

class Indicator extends StatelessWidget {
  final bool isCurrent;
  const Indicator({Key? key, required this.isCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 2,
      decoration: BoxDecoration(
        color: isCurrent
            ? context.read<AppThemeCubit>().state.appColors.addPageIndicatorSelectedColor
            : context.read<AppThemeCubit>().state.appColors.addPageIndicatorColor,
      ),
      duration: Duration(milliseconds: 400),
      curve: Curves.bounceIn,
    );
  }
}
