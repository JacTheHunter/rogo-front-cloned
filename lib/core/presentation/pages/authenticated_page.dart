import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/configs/constants/app_routes.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/presentation/blocs/app_nav_bar_cubit/app_nav_bar_cubit.dart';
import 'package:rogo/core/presentation/pages/widgets/app_bottom_nav_bar.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/services/navigation_service.dart';
import 'package:rogo/core/services/notification_service.dart';
import 'package:rogo/features/authentication/presentation/blocs/firebase_authentication_bloc/firebase_authentication_bloc.dart';
import 'package:rogo/features/browse/presentation/bloc/cubit/top_sellers_cubit.dart';
import 'package:rogo/features/browse/presentation/pages/browse_page.dart';
import 'package:rogo/features/categories/presentation/bloc/categories_cubit/categories_cubit.dart';
import 'package:rogo/features/inbox/presentation/blocs/chat_messages_bloc/chat_messages_bloc.dart';
import 'package:rogo/features/inbox/presentation/blocs/chat_rooms_bloc/chat_rooms_bloc.dart';
import 'package:rogo/features/inbox/presentation/pages/inbox_page.dart';
import 'package:rogo/features/profile/presentation/pages/profile_page.dart';
import 'package:rogo/features/wishlists/presentation/pages/wishlists_page.dart';

class AuthenticatedPage extends StatefulWidget {
  const AuthenticatedPage({Key? key}) : super(key: key);

  @override
  _AuthenticatedPageState createState() => _AuthenticatedPageState();
}

class _AuthenticatedPageState extends State<AuthenticatedPage> {
  late PageController _pageController;

  bool _canRunOnPageChanged = true;

  late StreamSubscription<RemoteMessage> _onMessage;
  late StreamSubscription<RemoteMessage> _onMessageOpenedApp;

  @override
  void initState() {
    _pageController = PageController();

    context.read<CategoriesCubit>().fetchCategories();
    context.read<TopSellersCubit>().fetchTopSellers();
    context.read<ChatRoomsBloc>().add(FetchChatRoomsEvent());
    context.read<ChatRoomsBloc>().add(FetchUsersForChatEvent());

    _onMessage = sl<NotificationsService>().onMessage.listen((event) {
      print(event);
    });
    _onMessageOpenedApp = sl<NotificationsService>().onMessageOpenedApp.listen((event) async {
      if (event.data['chat_id'] != null) {
        context.read<ChatMessagesBloc>().add(SelectChatRoomEvent(chatRoomId: int.parse(event.data['chat_id'])));
        sl<NavigatorService>().popUNtilFirst();
        sl<NavigatorService>().pushNamed(AppRoutes.chatPage);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _onMessage.cancel();
    _onMessageOpenedApp.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              context.read<FirebaseAuthenticationBloc>().add(FirebaseAuthenticationLogoutRequested());
            },
            backgroundColor: context.appColors.primaryColor,
            child: Icon(Icons.exit_to_app),
          ),
          body: PageView.builder(
            controller: _pageController,
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

  Widget _buildPageViewBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return BrowsePage();
      case 1:
        return WhishListsPage();
      case 2:
        return Center(
          child: AppText(currentIndex.toString()),
        );
      case 3:
        return InboxPage();
      case 4:
        return ProfilePage();
      default:
        return Center(child: AppText('Coming soon'));
    }
  }

  void onPageChanged(int index) {
    final bloc = context.read<AppNavBarCubit>();
    if (_canRunOnPageChanged) {
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
    _canRunOnPageChanged = false;
    _pageController.jumpToPage(index);
    // (
    //   index,
    //   curve: Curves.ease,
    //   duration: Duration(milliseconds: milliseconds),
    // );
    _canRunOnPageChanged = true;
    setState(() {});
  }
}
