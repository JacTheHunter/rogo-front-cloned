import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/presentation/pages/widgets/app_dropdown.dart';

import '../../../../core/configs/constants/app_images.dart';
import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/app_text_form_field.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';
import '../widgets/discount_alert.dart';

class CreateNewAdPage3 extends StatelessWidget {
  CreateNewAdPage3({Key? key}) : super(key: key);
  // File? source;
  // Future setPicture() async {
  //   final XFile? takenImage = await ImagePicker().pickImage(source: ImageSource.camera);
  //   source = File(takenImage!.path);
  // }

  @override
  Widget build(BuildContext context) {
    final List<String> pickUpAndDrop = [
      'I am flexible, text me',
      'I will meat you at your address',
      'Custom',
    ];

    return BlocBuilder<AddPublicationCubit, AddPublicationState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Create new ad',
                  style: context.read<AppThemeCubit>().state.textTheme.addPublicationHeaderTextStyle,
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: AppText(
                    'add.createNewAdPage3.rentalPrice',
                    style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                  ),
                ),
                AppTextFormField(
                  prefix: AppText('\$'),
                  initialValue: state.rentalPrice.value,
                  onChanged: context.read<AddPublicationCubit>().updateRentalPrice,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    AppText(
                      'Discount',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 16.75),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DiscountAlert();
                          },
                        );
                      },
                      child: AppImage.asset(
                        AppImages.vector.circleQuestionIcon,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: AppText(
                              'add.createNewAdPage3.fromDays',
                              textAlign: TextAlign.start,
                              style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                            ),
                          ),
                          AppTextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: AppText(
                              'add.createNewAdPage3.pricePerDay',
                              textAlign: TextAlign.start,
                              style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                            ),
                          ),
                          AppTextFormField(
                            prefix: AppText('\$'),
                            initialValue: state.price.value,
                            onChanged: context.read<AddPublicationCubit>().updatePrice,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: AppText(
                    'add.createNewAdPage3.pickUpAndDrop',
                    style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                  ),
                ),
                AppDropdown(
                  value: pickUpAndDrop[0],
                  onChanged: (val) {},
                  items: pickUpAndDrop,
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: AppText(
                    'add.createNewAdPage3.pickUpAndDrop',
                    style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                  ),
                ),
                AppDropdown(
                  value: pickUpAndDrop[0],
                  onChanged: (val) {},
                  items: pickUpAndDrop,
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    AppText(
                      'BLS price',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 16.75),
                    GestureDetector(
                      onTap: () {},
                      child: AppImage.asset(
                        AppImages.vector.circleQuestionIcon,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: AppText(
                    'BLS',
                    style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: AppTextFormField(
                    prefix: AppText('\$'),
                    initialValue: state.blsPrice.value,
                    onChanged: context.read<AddPublicationCubit>().updateBLSprice,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SimpleButton(
                  onTap: () {
                    context.read<AddPublicationCubit>().incrementStep();
                  },
                  text: 'Save and publish',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
