import 'package:flutter/material.dart';
import 'package:rogo/core/presentation/pages/widgets/app_app_bar.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/features/authentication/presentation/widgets/create_account_page1.dart';
import 'package:rogo/features/authentication/presentation/widgets/create_account_page2.dart';
import 'package:rogo/features/authentication/presentation/widgets/create_account_page3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        backArrowColor: context.read<AppThemeCubit>().state.appColors().appBarBackArrowAlternativeColor(),
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: context.read<AppThemeCubit>().state.appColors().createAccountHeaderGradient(),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    AppText(
                      'authentication.createAccountPage.createAccount',
                      style: context.read<AppThemeCubit>().state.textTheme().createAccountTitleTextStyle(),
                    ),
                    SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppText(
                          '1',
                          style: context
                              .read<AppThemeCubit>()
                              .state
                              .textTheme()
                              .createAccountHeaderBiggerNumberTextStyle(),
                        ),
                        AppText(
                          'authentication.createAccountPage.basicDetails',
                          style: context.read<AppThemeCubit>().state.textTheme().createAccountHeaderTextStyle(),
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
                children: [
                  CreateAccountPage1(),
                  CreateAccountPage2(),
                  CreateAccountPage3(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
