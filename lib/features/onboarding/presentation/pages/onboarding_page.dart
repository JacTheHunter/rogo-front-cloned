import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:rogo/core/configs/constants/app_images.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/features/onboarding/presentation/blocs/onboarding_page_cubit/onboarding_page_cubit.dart';
import 'package:rogo/features/onboarding/presentation/widgets/indicators.dart';

extension StringExtension on String {}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool canRunOnPageChanged = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingPageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(),
                            AppText(
                              'onboarding.title$state',
                              style: context.read<AppThemeCubit>().state.textTheme.onboardingTitleTextStyle,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            state == 1
                                ? Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: translate('onboarding.text1.1'),
                                        style:
                                            context.read<AppThemeCubit>().state.textTheme.onboardingCrossedTextStyle),
                                    TextSpan(text: translate('onboarding.text1.2')),
                                    TextSpan(
                                        text: translate('onboarding.text1.3'),
                                        style:
                                            context.read<AppThemeCubit>().state.textTheme.onboardingCrossedTextStyle),
                                    TextSpan(text: translate('onboarding.text1.4'))
                                  ], style: context.read<AppThemeCubit>().state.textTheme.onboardingTextStyle))
                                : AppText(
                                    'onboarding.text$state',
                                    style: context.read<AppThemeCubit>().state.textTheme.onboardingTextStyle,
                                  ),
                            Spacer(),
                            AppImage.asset(
                              AppImages.raster.onboarding(state),
                              width: double.infinity,
                            ),
                            Spacer(),
                          ],
                        );
                      },
                      onPageChanged: onPageChanged,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Indocators(
                        current: state - 1,
                        total: 3,
                      ),
                      GestureDetector(
                        onTap: () => onNext(context),
                        child: Row(
                          children: [
                            AppText(
                              state == 3 ? 'onboarding.start' : 'onboarding.next',
                              style: context.read<AppThemeCubit>().state.textTheme.textButtonTextStyle,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            context.read<AppThemeCubit>().state.appIcons.textButtonArrowRightIcon,
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 66,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onPageChanged(int index) {
    final bloc = context.read<OnboardingPageCubit>();
    if (canRunOnPageChanged) {
      if (bloc.state > index) {
        bloc.decrement();
      } else {
        bloc.increment();
      }
    }
  }

  void onNext(BuildContext context) async {
    if (context.read<OnboardingPageCubit>().state == 2) {
      onSkip();
    } else {
      context.read<OnboardingPageCubit>().increment();
      canRunOnPageChanged = false;
      await pageController.animateToPage(
        pageController.page!.toInt() + 1,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
      canRunOnPageChanged = true;
      setState(() {});
    }
  }

  void onSkip() {
    //  sl<NavigatorService>().pop();
  }
}
