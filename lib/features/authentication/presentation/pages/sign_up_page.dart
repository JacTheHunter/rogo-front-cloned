import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:formz/formz.dart';
import 'package:rogo/core/configs/constants/app_images.dart';
import 'package:rogo/core/form_models/email.dart';
import 'package:rogo/core/form_models/password.dart';
import 'package:rogo/core/form_models/password_confirm.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text_form_field.dart';
import 'package:rogo/core/presentation/pages/widgets/simple_button.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/core/services/navigation_service.dart';
import 'package:rogo/core/theme/app_color_scheme.dart';
import 'package:rogo/features/authentication/presentation/blocs/sign_up_cubit/sign_up_cubit.dart';
import 'package:rogo/features/authentication/presentation/widgets/guest_mode.dart';
import 'package:rogo/features/authentication/presentation/widgets/login_method_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
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
                    GuestMode(),
                    SizedBox(height: 15),
                    Center(child: AppImage.asset(AppImages.raster.signUpScreenMain)),
                    SizedBox(height: 15),
                    AppText(
                      'authentication.signUpPage.signUp',
                      style: context.read<AppThemeCubit>().state.textTheme().authenticationTitleTextStyle(),
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
                      style: context.read<AppThemeCubit>().state.textTheme().authenticationSubTitleTextStyle(),
                    )),
                    SizedBox(height: 16),
                    AppText(
                      'authentication.signUpPage.yourEmail',
                      style: context.read<AppThemeCubit>().state.textTheme().inputLabelTextStyle(),
                    ),
                    AppTextFormField(
                      onChanged: context.read<SignUpCubit>().updateEmail,
                      initialValue: state.email.value,
                      isInvalid: state.email.invalid,
                    ),
                    if (state.email.invalid)
                      AppText(
                        state.email.error == EmailValidationError.empty
                            ? 'validators.thisFieldIsRequired'
                            : 'validators.invalidEmail',
                        style: context.read<AppThemeCubit>().state.textTheme().inputErrorTextStyle(),
                      ),
                    SizedBox(height: 16),
                    AppText(
                      'authentication.signUpPage.password',
                      style: context.read<AppThemeCubit>().state.textTheme().inputLabelTextStyle(),
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
                              ? context.read<AppThemeCubit>().state.appIcons().inputEyeOffIcon()
                              : context.read<AppThemeCubit>().state.appIcons().inputEyeIcon(),
                        ),
                      ),
                    ),
                    if (state.password.invalid)
                      AppText(
                        state.password.error == PasswordValidationError.empty
                            ? 'validators.thisFieldIsRequired'
                            : 'validators.invalidPassword',
                        style: context.read<AppThemeCubit>().state.textTheme().inputErrorTextStyle(),
                      ),
                    SizedBox(height: 16),
                    AppText(
                      'authentication.signUpPage.reenterPassword',
                      style: context.read<AppThemeCubit>().state.textTheme().inputLabelTextStyle(),
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
                              ? context.read<AppThemeCubit>().state.appIcons().inputEyeOffIcon()
                              : context.read<AppThemeCubit>().state.appIcons().inputEyeIcon(),
                        ),
                      ),
                    ),
                    if (state.passwordConfirm.invalid)
                      AppText(
                        state.passwordConfirm.error == PasswordConfirmValidationError.empty
                            ? 'validators.thisFieldIsRequired'
                            : 'validators.invalidPasswordConfirm',
                        style: context.read<AppThemeCubit>().state.textTheme().inputErrorTextStyle(),
                      ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor: state.acceptPolicy.invalid
                                  ? context.read<AppThemeCubit>().state.appColors().errorColor()
                                  : context.read<AppThemeCubit>().state.appColors().checkboxColor()),
                          child: Checkbox(
                            activeColor: context.read<AppThemeCubit>().state.appColors().checkboxColor(),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                            value: state.acceptPolicy.value,
                            onChanged: context.read<SignUpCubit>().updateAcceptPolicy,
                          ),
                        ),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                                style: context.read<AppThemeCubit>().state.textTheme().privacyTextStyle(),
                                children: [
                                  TextSpan(text: translate('authentication.signUpPage.beforeTerms')),
                                  TextSpan(
                                      text: translate('authentication.signUpPage.terms'),
                                      style: context.read<AppThemeCubit>().state.textTheme().privacyLinkTextStyle()),
                                  TextSpan(text: translate('authentication.signUpPage.beforePolicy')),
                                  TextSpan(
                                      text: translate('authentication.signUpPage.policy'),
                                      style: context.read<AppThemeCubit>().state.textTheme().privacyLinkTextStyle()),
                                ]),
                          ),
                        )
                      ],
                    ),
                    if (state.acceptPolicy.invalid)
                      AppText(
                        'validators.thisFieldIsRequired',
                        style: context.read<AppThemeCubit>().state.textTheme().inputErrorTextStyle(),
                      ),
                    SizedBox(height: 40),
                    state.status == FormzStatus.submissionInProgress
                        ? SimpleButton(
                            child: CircularProgressIndicator(
                              color: AppColorScheme.white,
                            ),
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
                          style: context.read<AppThemeCubit>().state.textTheme().authenticationTextStyle(),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: onLogin,
                          child: AppText(
                            'authentication.signUpPage.login',
                            style: context.read<AppThemeCubit>().state.textTheme().textButtonTextStyle(),
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
    );
  }

  void onLogin() => sl<NavigatorService>().pop();
}
