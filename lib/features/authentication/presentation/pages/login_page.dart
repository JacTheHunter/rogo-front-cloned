import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:rogo/core/configs/constants/app_images.dart';
import 'package:rogo/core/configs/constants/app_routes.dart';
import 'package:rogo/core/form_models/email.dart';
import 'package:rogo/core/form_models/password.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text_form_field.dart';
import 'package:rogo/core/presentation/pages/widgets/simple_button.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/core/services/navigation_service.dart';
import 'package:rogo/core/theme/app_color_scheme.dart';
import 'package:rogo/features/authentication/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:rogo/features/authentication/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:rogo/features/authentication/presentation/widgets/guest_mode.dart';
import 'package:rogo/features/authentication/presentation/widgets/login_method_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 28),
          child: BlocConsumer<LoginCubit, LoginState>(
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
                    Center(child: AppImage.asset(AppImages.raster.loginScreenMain)),
                    SizedBox(height: 15),
                    AppText(
                      'authentication.loginPage.login',
                      style: context.read<AppThemeCubit>().state.textTheme().authenticationTitleTextStyle(),
                    ),
                    SizedBox(height: 12),
                    AppText(
                      'authentication.loginPage.yourEmail',
                      style: context.read<AppThemeCubit>().state.textTheme().inputLabelTextStyle(),
                    ),
                    AppTextFormField(
                      onChanged: context.read<LoginCubit>().updateEmail,
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
                      'authentication.loginPage.password',
                      style: context.read<AppThemeCubit>().state.textTheme().inputLabelTextStyle(),
                    ),
                    AppTextFormField(
                      onChanged: context.read<LoginCubit>().updatePassword,
                      isInvalid: state.email.invalid,
                      initialValue: state.password.value,
                      obscureText: state.obsecurePassword,
                      suffixIconConstraints: BoxConstraints(maxHeight: 18),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () => sl<NavigatorService>().pushNamed(AppRoutes.forgotPasswordPage),
                          child: AppText(
                            'authentication.loginPage.forgot',
                            style: context.read<AppThemeCubit>().state.textTheme().textButtonTextStyle(),
                          ),
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
                    SizedBox(height: 28),
                    state.status == FormzStatus.submissionInProgress
                        ? SimpleButton(
                            child: CircularProgressIndicator(
                              color: AppColorScheme.white,
                            ),
                          )
                        : SimpleButton(
                            text: 'authentication.loginPage.login',
                            onTap: context.read<LoginCubit>().send,
                          ),
                    SizedBox(height: 24),
                    Center(
                      child: AppText(
                        'authentication.loginPage.orLoginWith',
                        style: context.read<AppThemeCubit>().state.textTheme().authenticationSubTitleTextStyle(),
                      ),
                    ),
                    SizedBox(height: 8),
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
                            onTap: () =>
                                context.read<AuthenticationBloc>().add(AuthenticationSignInWithGoogleRequested()),
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
                    SizedBox(height: 59),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          'authentication.loginPage.dontHaveAnAccount',
                          style: context.read<AppThemeCubit>().state.textTheme().authenticationTextStyle(),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: onSignUp,
                          child: AppText(
                            'authentication.loginPage.signUp',
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

  void onSignUp() => sl<NavigatorService>().pushNamed(AppRoutes.singUpPage);
}