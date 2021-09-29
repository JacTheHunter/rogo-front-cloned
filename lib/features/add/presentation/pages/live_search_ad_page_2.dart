import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/app_text_form_field.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';

class LiveSearchNewAdPage2 extends StatelessWidget {
  LiveSearchNewAdPage2({Key? key}) : super(key: key);
  // File? source;
  // Future setPicture() async {
  //   final XFile? takenImage = await ImagePicker().pickImage(source: ImageSource.camera);
  //   source = File(takenImage!.path);
  // }

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
                'Create new ad',
                style: context.read<AppThemeCubit>().state.textTheme.addPublicationHeaderTextStyle,
              ),
              SizedBox(height: 16),
              //TODO: Make dropdown
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: AppText(
                  'add.liveSearchNewAdPage2.country',
                  style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                ),
              ),
              AppTextFormField(),
              SizedBox(height: 16),
              //TODO: Make dropdown
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: AppText(
                  'add.createNewAdPage2.city',
                  style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                ),
              ),
              AppTextFormField(),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: AppText(
                  'add.createNewAdPage2.zip',
                  style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                ),
              ),
              AppTextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              Spacer(),
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
        );
      },
    );
  }
}
