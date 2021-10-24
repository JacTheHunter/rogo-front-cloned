import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';

import '../../../../core/theme/app_color_scheme.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';

class CustomRangeSlider extends StatelessWidget {
  final AddPublicationState state;
  const CustomRangeSlider({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
        //TODO: Fix labels of range slider
        valueIndicatorTextStyle: context.read<AppThemeCubit>().state.textTheme.rangeSliderIndicatorsTextStyle,
        valueIndicatorColor: AppColorScheme.transparent,
        activeTrackColor: AppColorScheme.hollywoodCerise,
        inactiveTrackColor: AppColorScheme.remi,
        trackHeight: 1,
        thumbColor: AppColorScheme.hollywoodCerise,
        rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 12),
        overlayColor: AppColorScheme.remi.withOpacity(0.7),
      ),
      child: RangeSlider(
        values: state.defaultRangeValues,
        // divisions: 5,
        min: 1,
        max: 200,
        labels: RangeLabels(
          '\$' + state.defaultRangeValues.start.round().toString(),
          '\$' + state.defaultRangeValues.end.round().toString(),
        ),
        onChanged: (val) {
          context.read<AddPublicationCubit>().updateRangeValues(val);
        },
      ),
    );
  }
}
