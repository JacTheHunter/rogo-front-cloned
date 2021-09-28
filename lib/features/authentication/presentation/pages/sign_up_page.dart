import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:formz/formz.dart';

import '../../../../core/configs/constants/app_images.dart';
import '../../../../core/form_models/email_form_model.dart';
import '../../../../core/form_models/password_confirm_form_model.dart';
import '../../../../core/form_models/password_form_model.dart';
import '../../../../core/injection/injection_container.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_image.dart';
import '../../../../core/presentation/pages/widgets/app_loader.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/app_text_form_field.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../../../../core/services/navigation_service.dart';
import '../blocs/sign_up_cubit/sign_up_cubit.dart';
import '../widgets/guest_mode.dart';
import '../widgets/login_method_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 28),
            child: BlocConsumer<SignUpCubit, SingUpState>(
              listener: (context, state) {
                if (state.errorMessage.length > 0) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: AppText(state.errorMessage),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      GuestMode(),
                      SizedBox(height: 15),
                      Center(child: AppImage.asset(AppImages.raster.signUpScreenMain)),
                      SizedBox(height: 15),
                      AppText(
                        'authentication.signUpPage.signUp',
                        style: context.appTextTheme.authenticationTitleTextStyle,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: LoginMethodButton(
                              icon: AppImages.vector.fb,
                            ),
                          ),
                          SizedBox(width: 18),
                          Expanded(
                            child: LoginMethodButton(
                              icon: AppImages.vector.google,
                            ),
                          ),
                          SizedBox(width: 18),
                          Expanded(
                            child: LoginMethodButton(
                              icon: AppImages.vector.apple,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Center(
                          child: AppText(
                        'authentication.signUpPage.orRegisterWithEmail',
                        style: context.appTextTheme.authenticationSubTitleTextStyle,
                      )),
                      SizedBox(height: 16),
                      AppText(
                        'authentication.signUpPage.yourEmail',
                        style: context.appTextTheme.inputLabelTextStyle,
                      ),
                      AppTextFormField(
                        onChanged: context.read<SignUpCubit>().updateEmail,
                        initialValue: state.email.value,
                        isInvalid: state.email.invalid,
                      ),
                      if (state.email.invalid)
                        AppText(
                          state.email.error == EmailFormModelValidationError.empty
                              ? 'validators.thisFieldIsRequired'
                              : 'validators.invalidEmail',
                          style: context.appTextTheme.inputErrorTextStyle,
                        ),
                      SizedBox(height: 16),
                      AppText(
                        'authentication.signUpPage.password',
                        style: context.appTextTheme.inputLabelTextStyle,
                      ),
                      AppTextFormField(
                        onChanged: context.read<SignUpCubit>().updatePassword,
                        isInvalid: state.email.invalid,
                        initialValue: state.password.value,
                        obscureText: state.obsecurePassword,
                        suffixIconConstraints: BoxConstraints(maxHeight: 18),
                        suffixIcon: GestureDetector(
                          onTap: context.read<SignUpCubit>().onsecurePassword,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: state.obsecurePassword
                                ? context.appIcons.inputEyeOffIcon
                                : context.appIcons.inputEyeIcon,
                          ),
                        ),
                      ),
                      if (state.password.invalid)
                        AppText(
                          state.password.error == PasswordFormModelValidationError.empty
                              ? 'validators.thisFieldIsRequired'
                              : 'validators.invalidPassword',
                          style: context.appTextTheme.inputErrorTextStyle,
                        ),
                      SizedBox(height: 16),
                      AppText(
                        'authentication.signUpPage.reenterPassword',
                        style: context.appTextTheme.inputLabelTextStyle,
                      ),
                      AppTextFormField(
                        onChanged: context.read<SignUpCubit>().updatePasswordConfirm,
                        isInvalid: state.email.invalid,
                        initialValue: state.password.value,
                        obscureText: state.obsecurePasswordConfirm,
                        suffixIconConstraints: BoxConstraints(maxHeight: 18),
                        suffixIcon: GestureDetector(
                          onTap: context.read<SignUpCubit>().onsecurePasswordConfirm,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: state.obsecurePasswordConfirm
                                ? context.appIcons.inputEyeOffIcon
                                : context.appIcons.inputEyeIcon,
                          ),
                        ),
                      ),
                      if (state.passwordConfirm.invalid)
                        AppText(
                          state.passwordConfirm.error == PasswordConfirmFormModelValidationError.empty
                              ? 'validators.thisFieldIsRequired'
                              : 'validators.invalidPasswordConfirm',
                          style: context.appTextTheme.inputErrorTextStyle,
                        ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor: state.acceptPolicy.invalid
                                    ? context.appColors.errorColor
                                    : context.appColors.checkboxColor),
                            child: Checkbox(
                              activeColor: context.appColors.checkboxColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                              value: state.acceptPolicy.value,
                              onChanged: context.read<SignUpCubit>().updateAcceptPolicy,
                            ),
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(style: context.appTextTheme.privacyTextStyle, children: [
                                TextSpan(text: translate('authentication.signUpPage.beforeTerms')),
                                TextSpan(
                                    text: translate('authentication.signUpPage.terms'),
                                    style: context.appTextTheme.privacyLinkTextStyle),
                                TextSpan(text: translate('authentication.signUpPage.beforePolicy')),
                                TextSpan(
                                    text: translate('authentication.signUpPage.policy'),
                                    style: context.appTextTheme.privacyLinkTextStyle),
                              ]),
                            ),
                          )
                        ],
                      ),
                      if (state.acceptPolicy.invalid)
                        AppText(
                          'validators.thisFieldIsRequired',
                          style: context.appTextTheme.inputErrorTextStyle,
                        ),
                      SizedBox(height: 40),
                      state.status == FormzStatus.submissionInProgress
                          ? SimpleButton(
                              child: AppLoader(reverse: true),
                            )
                          : SimpleButton(
                              text: 'authentication.signUpPage.createAccount',
                              onTap: context.read<SignUpCubit>().send,
                            ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            'authentication.signUpPage.alreadyHaveAccount',
                            style: context.appTextTheme.authenticationTextStyle,
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: onLogin,
                            child: AppText(
                              'authentication.signUpPage.login',
                              style: context.appTextTheme.textButtonTextStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 28),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void onLogin() => sl<NavigatorService>().pop();
}
