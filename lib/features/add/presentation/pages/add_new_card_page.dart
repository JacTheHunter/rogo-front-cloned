import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../../../core/injection/injection_container.dart';
import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/app_text_form_field.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';

class AddNewCardPage extends StatelessWidget {
  const AddNewCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPublicationCubit, AddPublicationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.read<AppThemeCubit>().state.appColors.scaffoldBackgroundColor,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => sl<NavigatorService>().pop(),
              child: context.read<AppThemeCubit>().state.appIcons.appBarArrowLeftIcon,
            ),
            centerTitle: true,
            title: AppText(
              'Add New Card',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: AppColorScheme.haiti,
              ),
            ),
            elevation: 0,
            backgroundColor: AppColorScheme.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: AppText(
                    'add.addNewCardPage.cardholderName',
                    style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                  ),
                ),
                AppTextFormField(
                  initialValue: state.cardHolderName.value,
                  onChanged: context.read<AddPublicationCubit>().updateCardHolderName,
                  textCapitalization: TextCapitalization.words,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('^((?:[A-Za-z]+ ?){1,3})\$'),
                      replacementString: state.cardHolderName.value,
                    ),
                  ],
                ),
                if (state.cardHolderName.invalid)
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: AppText(
                      'validators.thisFieldIsRequired',
                      style: context.read<AppThemeCubit>().state.textTheme.inputErrorTextStyle,
                    ),
                  ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: AppText(
                    'add.addNewCardPage.cardNumber',
                    style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                  ),
                ),
                AppTextFormField(
                  initialValue: state.cardNumber.value,
                  onChanged: context.read<AddPublicationCubit>().updateCardNumber,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    CreditCardCvcInputFormatter(),
                  ],
                ),
                if (state.cardNumber.invalid)
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: AppText(
                      'validators.thisFieldIsRequired',
                      style: context.read<AppThemeCubit>().state.textTheme.inputErrorTextStyle,
                    ),
                  ),
                SizedBox(height: 24),
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
                              'add.addNewCardPage.expires',
                              textAlign: TextAlign.start,
                              style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                            ),
                          ),
                          AppTextFormField(
                            initialValue: state.cardExpireDate.value,
                            onChanged: context.read<AddPublicationCubit>().updateCardExpireDate,
                            inputFormatters: [
                              // CreditCardExpirationDateFormatter(),
                              MaskedInputFormatter('00/0000'),
                            ],
                            keyboardType: TextInputType.number,
                          ),
                          if (state.cardExpireDate.invalid)
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: AppText(
                                'validators.thisFieldIsRequired',
                                style: context.read<AppThemeCubit>().state.textTheme.inputErrorTextStyle,
                              ),
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
                              'add.addNewCardPage.cvv',
                              textAlign: TextAlign.start,
                              style: context.read<AppThemeCubit>().state.textTheme.inputLabelTextStyle,
                            ),
                          ),
                          AppTextFormField(
                            initialValue: state.cardCvv.value,
                            onChanged: context.read<AddPublicationCubit>().updateCardCvv,
                            inputFormatters: [
                              CreditCardCvcInputFormatter(),
                            ],
                            keyboardType: TextInputType.number,
                          ),
                          if (state.cardCvv.invalid)
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: AppText(
                                'validators.thisFieldIsRequired',
                                style: context.read<AppThemeCubit>().state.textTheme.inputErrorTextStyle,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 43),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      activeColor: context.read<AppThemeCubit>().state.appColors.checkboxColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                      value: true,
                      onChanged: (f) {},
                    ),
                    AppText(
                      'Save my card details',
                      style: context.read<AppThemeCubit>().state.textTheme.privacyTextStyle,
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: SimpleButton(
                      text: 'Save',
                      onTap: () {
                        if (context.read<AddPublicationCubit>().isValidNewCard()) {
                          sl<NavigatorService>().pop();
                        }
                        return;
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}