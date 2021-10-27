import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/configs/constants/app_images.dart';
import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';
import '../widgets/calendar.dart';
import '../widgets/range_slider.dart';

class LiveSearchNewAdPage3 extends StatelessWidget {
  LiveSearchNewAdPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPublicationCubit, AddPublicationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'add.liveSearchNewAdPage3.createNewAd',
                style: context.read<AppThemeCubit>().state.textTheme.addPublicationHeaderTextStyle,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: AppText(
                  'add.liveSearchNewAdPage3.rentalPrice',
                  style: context.read<AppThemeCubit>().state.textTheme.liveSearchAdPage3TextStyle,
                ),
              ),
              SizedBox(height: 40),
              CustomRangeSlider(state: state),
              AppText(
                'add.liveSearchNewAdPage3.selectDates',
                style: context.read<AppThemeCubit>().state.textTheme.liveSearchAdPage3TextStyle,
              ),
              SizedBox(height: 4),
              AppText(
                'add.liveSearchNewAdPage3.textSelectDates',
                style: context
                    .read<AppThemeCubit>()
                    .state
                    .textTheme
                    .inputLabelTextStyle
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    constraints: BoxConstraints.loose(
                      Size(
                        MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height * 0.65,
                      ),
                    ),
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    builder: (BuildContext context) {
                      return BlocBuilder<AddPublicationCubit, AddPublicationState>(
                        builder: (context, state) {
                          return Calendar(state: state);
                        },
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: context.read<AppThemeCubit>().state.appColors.inputFillColor,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppImage.asset(AppImages.vector.calendarIcon),
                      SizedBox(width: 8),
                      AppText(
                        (state.rangeStartDay != null && state.rangeEndDay != null)
                            ? DateFormat('dd MMM yyyy').format(state.rangeStartDay!) +
                                ' \u2014 ' +
                                DateFormat('dd MMM yyyy').format(state.rangeEndDay!)
                            : '',
                        style: context.read<AppThemeCubit>().state.textTheme.inputTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              if (state.rStartDay.invalid && state.rEndDay.invalid)
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: AppText(
                    'validators.dateIsRequired',
                    style: context.read<AppThemeCubit>().state.textTheme.inputErrorTextStyle,
                  ),
                ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SimpleButton(
                  onTap: () {
                    context.read<AddPublicationCubit>().incrementStep();
                    print(state.currentStep);
                  },
                  text: 'add.liveSearchNewAdPage3.saveAndPublish',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
