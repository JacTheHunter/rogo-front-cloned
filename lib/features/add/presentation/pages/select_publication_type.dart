import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/constants/app_images.dart';
import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';

class SelectPublicationTypePage extends StatelessWidget {
  const SelectPublicationTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void tapFeedHandler() {
      context.read<AddPublicationCubit>().selectPublicationType(1);
    }

    void tapLiveSearchHandler() {
      context.read<AddPublicationCubit>().selectPublicationType(2);
    }

    void onSubmit() {
      context.read<AddPublicationCubit>().clearPhotoList();
      context.read<AddPublicationCubit>().incrementStep();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<AddPublicationCubit, AddPublicationState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 44),
                child: AppText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: context.read<AppThemeCubit>().state.textTheme.addPublicationHeaderTextStyle,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: tapFeedHandler,
                    child: buildCard(
                      isTapped: (state.isFeed != null && state.isFeed!),
                      context: context,
                      text: 'Feed',
                      image: state.isFeed == true ? AppImages.raster.addFeedSelected : AppImages.raster.addFeed,
                      iconHeight: 112.5,
                      iconWidth: 88.29,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: tapLiveSearchHandler,
                    child: buildCard(
                      isTapped: (state.isFeed != null && !state.isFeed!),
                      context: context,
                      text: 'Live-search',
                      image: state.isFeed == false
                          ? AppImages.raster.addLiveSearchSelected
                          : AppImages.raster.addLiveSearch,
                      iconHeight: 110.63,
                      iconWidth: 110.64,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SimpleButton(
                  text: 'Submit',
                  color: (state.isFeed == null) ? AppColorScheme.alto : AppColorScheme.hollywoodCerise,
                  onTap: (state.isFeed == null) ? null : onSubmit,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget buildCard({
  required BuildContext context,
  required String text,
  required String image,
  required double iconWidth,
  required double iconHeight,
  required bool isTapped,
}) {
  final querySize = MediaQuery.of(context).size;

  return Container(
    decoration: BoxDecoration(
      gradient: isTapped == false
          ? LinearGradient(
              colors: [
                AppColorScheme.gradient1_1,
                AppColorScheme.gradient1_2,
                AppColorScheme.gradient1_3,
              ],
              end: Alignment(0, -0.7),
              begin: Alignment(1, 1),
              stops: [0, 0.5307, 1],
            )
          : null,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Padding(
      padding: const EdgeInsets.all(0.8),
      child: Container(
        height: querySize.height * 0.3,
        width: querySize.width * 0.41,
        decoration: BoxDecoration(
          color: isTapped == false ? AppColorScheme.white : AppColorScheme.hollywoodCerise,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            AppText(
              text,
              style: isTapped == false
                  ? context.read<AppThemeCubit>().state.textTheme.addPublicationTypeTextStyle
                  : context
                      .read<AppThemeCubit>()
                      .state
                      .textTheme
                      .addPublicationTypeTextStyle
                      .copyWith(color: AppColorScheme.white),
            ),
            SizedBox(height: 27.5),
            AppImage.asset(
              image,
              width: iconWidth,
              height: iconHeight,
            ),
          ],
        ),
      ),
    ),
  );
}
