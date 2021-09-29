import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/constants/app_images.dart';
import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/theme/app_color_scheme.dart';

class CardItem extends StatelessWidget {
  final bool isSelected;
  const CardItem({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColorScheme.haiti,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                'Card Name',
                style: context.read<AppThemeCubit>().state.textTheme.cardNameTextStyle,
              ),
              Spacer(),
              isSelected
                  ? context.read<AppThemeCubit>().state.appIcons.checkIcon
                  : Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                    ),
            ],
          ),
          SizedBox(height: 24),
          AppText(
            '**** **** **** 4656',
            style: context.read<AppThemeCubit>().state.textTheme.cardNumberTextStyle,
          ),
          SizedBox(height: 15.72),
          Row(
            children: [
              AppImage.asset(
                AppImages.vector.visaLogo,
              ),
              Spacer(),
              AppText(
                '01/24',
                style: context.read<AppThemeCubit>().state.textTheme.cardExpDateTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
