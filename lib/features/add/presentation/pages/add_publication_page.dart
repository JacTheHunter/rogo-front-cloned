import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';
import '../widgets/indicators.dart';
import 'cards_page.dart';
import 'create_new_ad_page_1.dart';
import 'create_new_ad_page_2.dart';
import 'create_new_ad_page_3.dart';
import 'live_search_ad_page1.dart';
import 'live_search_ad_page_2.dart';
import 'live_search_ad_page_3.dart';
import 'select_publication_type.dart';
import 'stripe_page.dart';

class AddPublicationPage extends StatefulWidget {
  const AddPublicationPage({Key? key}) : super(key: key);

  @override
  _AddPublicationPageState createState() => _AddPublicationPageState();
}

class _AddPublicationPageState extends State<AddPublicationPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPublicationCubit, AddPublicationState>(
      listenWhen: (previous, current) => previous.currentStep != current.currentStep,
      listener: (context, state) {
        _pageController.animateToPage(
          state.currentStep,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 58, 55, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    state.currentStep == 0
                        ? context.read<AppThemeCubit>().state.appIcons.closeIcon
                        : GestureDetector(
                            onTap: context.read<AddPublicationCubit>().decrementStep,
                            child: context.read<AppThemeCubit>().state.appIcons.appBarArrowLeftIcon,
                          ),
                    if (state.currentStep >= 2 && state.isFeed == true)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Indicators(total: 4, currentStep: state.currentStep - 2),
                        ),
                      ),
                    if (state.currentStep >= 1 && state.isFeed == false)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 48, right: 58),
                          child: Indicators(total: 3, currentStep: state.currentStep - 1),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: (state.isFeed == null || state.isFeed == true)
                    ? PageView(
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SelectPublicationTypePage(),
                          StripePage(),
                          CardsPage(),
                          CreateNewAdPage1(),
                          CreateNewAdPage2(),
                          CreateNewAdPage3(),
                        ],
                      )
                    : PageView(
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SelectPublicationTypePage(),
                          LiveSearchNewAdPage1(),
                          LiveSearchNewAdPage2(),
                          LiveSearchNewAdPage3(),
                        ],
                      ),
              )
            ],
          ),
        );
      },
    );
  }
}
