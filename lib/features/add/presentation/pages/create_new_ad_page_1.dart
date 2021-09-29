import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/app_text_form_field.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';
import '../widgets/add_photo_button.dart';
import '../widgets/cover_photo_item.dart';

class CreateNewAdPage1 extends StatelessWidget {
  CreateNewAdPage1({Key? key}) : super(key: key);
  // File? source;
  // Future setPicture() async {
  //   final XFile? takenImage = await ImagePicker().pickImage(source: ImageSource.camera);
  //   source = File(takenImage!.path);
  // }

  @override
  Widget build(BuildContext context) {
    final querySize = MediaQuery.of(context).size;
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
                Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return index == 2
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 16, right: 15),
                              child: AddPhotoButton(querySize: querySize),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 16, right: 15),
                              child: CoverPhotoItem(querySize: querySize, index: index),
                            );
                    },
                  ),
                ),

                SizedBox(height: 40),
                //TODO: Make dropdown
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: AppText(
                    'add.createNewAdPage1.categories',
                    style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                  ),
                ),
                AppTextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: AppText(
                    'add.createNewAdPage1.title',
                    style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                  ),
                ),
                AppTextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: AppText(
                    'add.createNewAdPage1.description',
                    style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                  ),
                ),
                AppTextFormField(
                  minLines: 4,
                  maxLines: 5,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                ),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: SimpleButton(
                    onTap: () {
                      context.read<AddPublicationCubit>().incrementStep();
                    },
                    text: 'Next Step',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
