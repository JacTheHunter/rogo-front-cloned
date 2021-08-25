import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:rogo/core/presentation/pages/widgets/app_app_bar.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/features/authentication/presentation/blocs/create_account_cubit/create_account_cubit.dart';
import 'package:rogo/features/authentication/presentation/blocs/phone_verification_cubit/phone_verification_cubit.dart';
import 'package:rogo/features/authentication/presentation/widgets/create_account_page1.dart';
import 'package:rogo/features/authentication/presentation/widgets/create_account_page2.dart';
import 'package:rogo/features/authentication/presentation/widgets/create_account_page3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        backArrowColor: context.read<AppThemeCubit>().state.appColors.appBarBackArrowAlternativeColor,
      ),
      extendBodyBehindAppBar: true,
      body: MultiBlocListener(
        listeners: [
          BlocListener<CreateAccountCubit, CreateAccountState>(
            listenWhen: (previous, current) => previous.verificationId != current.verificationId,
            listener: (context, state) {
              context.read<PhoneVerificationCubit>().updateVerificationId(state.verificationId);
            },
          ),
          BlocListener<CreateAccountCubit, CreateAccountState>(
            listenWhen: (previous, current) => previous.errorMessage != current.errorMessage,
            listener: (context, state) {
              if (state.status == FormzStatus.submissionFailure && state.errorMessage.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: AppText(state.errorMessage),
                  ),
                );
              }
            },
          ),
          BlocListener<CreateAccountCubit, CreateAccountState>(
            listenWhen: (previous, current) => previous.step != current.step,
            listener: (context, state) {
              _pageController.animateToPage(
                state.step - 1,
                curve: Curves.ease,
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
        ],
        child: BlocBuilder<CreateAccountCubit, CreateAccountState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: context.read<AppThemeCubit>().state.appColors.createAccountHeaderGradient,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(28),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100),
                          AppText(
                            'authentication.createAccountPage.createAccount',
                            style: context.read<AppThemeCubit>().state.textTheme.createAccountHeaderTitleTextStyle,
                          ),
                          SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AppText(
                                state.step.toString(),
                                style: context
                                    .read<AppThemeCubit>()
                                    .state
                                    .textTheme
                                    .createAccountHeaderBiggerNumberTextStyle,
                              ),
                              AppText(
                                'authentication.createAccountPage.basicDetails',
                                style: context.read<AppThemeCubit>().state.textTheme.createAccountHeaderTextStyle,
                              ),
                              SizedBox(height: 25),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        CreateAccountPage1(state: state),
                        CreateAccountPage2(state: state),
                        CreateAccountPage3(state: state),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
