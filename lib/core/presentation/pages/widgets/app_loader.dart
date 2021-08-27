import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/app_color_scheme.dart';
import '../../blocs/app_theme_cubit/app_theme_cubit.dart';

class AppLoader extends StatelessWidget {
  final bool reverse;
  const AppLoader({Key? key, this.reverse = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: reverse ? AppColorScheme.white : context.read<AppThemeCubit>().state.appColors.primaryColor,
      ),
    );
  }
}
