import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:rogo/core/presentation/blocs/app_nav_bar_cubit/app_nav_bar_cubit.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/core/presentation/pages/widgets/app_bottom_nav_bar.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rogo/features/authentication/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:rogo/features/authentication/presentation/pages/login_page.dart';
import 'package:rogo/features/browse/data/repositories/pages/browse_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  late PageController pageController;

  bool canRunOnPageChanged = true;

  late Box box;

  @override
  void initState() {
    pageController = PageController();
    box = Hive.box('appSettings');
    //final bool selectLangPassed = box.get('selectLangPassed') ?? false;

    WidgetsBinding.instance!.addObserver(this);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // if (!onboardingPassed) sl<NavigatorService>().pushNamed(AppRoutes.onboardingPage);
      //  if (!selectLangPassed) sl<NavigatorService>().pushNamed(AppRoutes.selectLanguagePage);
    });

    // context.read<AuthenticationCubit>().checkTokenExpiration();
    // context.read<NewsCubit>().fetchNews();
    // context.read<PromotionCubit>().fetchPromotions();

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        //  context.read<ApplockCubit>().appPaused();
        break;
      case AppLifecycleState.resumed:
        //  context.read<ApplockCubit>().appResumed();
        break;
      default:
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        print(state.status);
      },
      builder: (context, state) {
        if (state.status == AuthenticationStatus.unauthenticated) {
          return LoginPage();
        } else {
          return BlocBuilder<AppNavBarCubit, int>(
            builder: (context, state) {
              return Scaffold(
                extendBody: true,
                //backgroundColor: AppColorScheme.transparent,
                bottomNavigationBar: AppBottomNavBar(
                  currentIndex: state,
                  onNavItemTap: onNavItemTap,
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
                  },
                  backgroundColor: context.read<AppThemeCubit>().state.appColors().primaryColor(),
                  child: Icon(Icons.exit_to_app),
                ),
                body: PageView.builder(
                  controller: pageController,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _buildPageViewBody(state);
                  },
                  onPageChanged: onPageChanged,
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget _buildPageViewBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return BrowsePage();
      case 1:
        return Center(
          child: AppText(currentIndex.toString()),
        );
      case 2:
        return Center(
          child: AppText(currentIndex.toString()),
        );
      case 3:
        return Center(
          child: AppText(currentIndex.toString()),
        );
      case 4:
        return Center(
          child: AppText(currentIndex.toString()),
        );
      default:
        return Center(child: AppText('Coming soon'));
    }
  }

  void onPageChanged(int index) {
    final bloc = context.read<AppNavBarCubit>();
    if (canRunOnPageChanged) {
      if (bloc.state > index) {
        bloc.setPage(bloc.state - 1);
      } else {
        bloc.setPage(bloc.state + 1);
      }
    }
  }

  void onNavItemTap(int index) async {
    //final currentPage = context.read<AppNavBarCubit>().state;
    // final milliseconds = ((currentPage - index).abs() * 500).toInt();
    context.read<AppNavBarCubit>().setPage(index);
    canRunOnPageChanged = false;
    pageController.jumpToPage(index);
    // (
    //   index,
    //   curve: Curves.ease,
    //   duration: Duration(milliseconds: milliseconds),
    // );
    canRunOnPageChanged = true;
    setState(() {});
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ValueListenableBuilder(
  //     valueListenable: box.listenable(keys: ['appLang']),
  //     builder: (BuildContext context, Box box, Widget? widget) {
  //       return BlocConsumer<AuthenticationCubit, AuthenticationState>(
  //         listenWhen: (previous, current) => previous.bearerToken != current.bearerToken,
  //         listener: (context, state) {
  //           // context.read<NewsCubit>().fetchNews();
  //           // context.read<PromotionCubit>().fetchPromotions();
  //         },
  //         builder: (context, state) {
  //           if (state.authenticated) {
  //             return BlocBuilder<AppNavBarCubit, int>(
  //               builder: (context, state) {
  //                 return Scaffold(
  //                   bottomNavigationBar: AppBottomNavBar(
  //                     currentIndex: state,
  //                     onNavItemTap: onNavItemTap,
  //                   ),
  //                   body: PageView.builder(
  //                     controller: pageController,
  //                     itemCount: 5,
  //                     itemBuilder: (context, index) {
  //                       return _buildPageViewBody(state);
  //                     },
  //                     onPageChanged: onPageChanged,
  //                   ),
  //                 );
  //               },
  //             );
  //           } else {
  //             return RegistrationPage();
  //           }
  //         },
  //       );
  //     },
  //   );
  // }

}
