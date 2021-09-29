import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/constants/app_images.dart';
import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';

class StripePage extends StatelessWidget {
  const StripePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 46),
          Center(child: AppImage.asset(AppImages.vector.stripe)),
          SizedBox(height: 24.46),
          AppText(
            'To receive payment for goods, you must \n be  authorized in Stripe \n (the payment system used by ROGO)',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: context.read<AppThemeCubit>().state.textTheme.addPublicationStripeTextStyle,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SimpleButton(
              text: 'Connect Stripe',
              color: AppColorScheme.hollywoodCerise,
              onTap: () => context.read<AddPublicationCubit>().incrementStep(),
            ),
          ),
        ],
      ),
    );
  }
}
