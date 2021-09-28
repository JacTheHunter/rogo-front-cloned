import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/features/inbox/presentation/widgets/chat_rooms.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: context.appColors.inboxChatRoomBackgroundColor,
              toolbarHeight: 70,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                title: Container(
                  width: double.infinity,
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppText(
                          'inbox.inboxPage.inbox',
                          maxLines: 1,
                          style: context.appTextTheme.sliverHeaderTitleTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverAppBar(
              backgroundColor: context.appColors.inboxChatRoomBackgroundColor,
              //  expandedHeight: 160,
              elevation: 0,
              snap: true,
              floating: true,
              toolbarHeight: 50,
              // pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                //  centerTitle: true,

                title: SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.appColors.inboxChatRoomBackgroundColor,
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TabBar(
                          indicatorColor: context.appColors.primaryColor,
                          labelStyle: context.appTextTheme.tabBarSelectedLabelTextStyle,
                          unselectedLabelStyle: context.appTextTheme.tabBarUnSelectedLabelTextStyle,
                          labelColor: context.appColors.primaryTextColor,
                          unselectedLabelColor: context.appColors.hintColor,
                          isScrollable: true,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              color: context.appColors.primaryColor,
                              width: 2,
                            ),
                            //  insets: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                          ),
                          indicatorPadding: EdgeInsets.only(right: 40),
                          labelPadding: EdgeInsets.only(right: 40),
                          tabs: [
                            Tab(
                              text: translate('inbox.inboxPage.orders'),
                            ),
                            Tab(
                              text: translate('inbox.inboxPage.requests'),
                            ),
                            Tab(
                              text: translate('inbox.inboxPage.chatRoom'),
                            ),
                          ],
                          // controller: _tabController,
                        ),

                        // AppTextFormField(
                        //   fillColor: context.appColors.sliverAppBarSearchFillolor,
                        //   prefixIconConstraints: BoxConstraints(maxHeight: 18),
                        //   prefixIcon: Padding(
                        //       padding: const EdgeInsets.only(left: 18, right: 10),
                        //       child: context.appIcons.searchIcon),
                        //   suffixIconConstraints: BoxConstraints(maxHeight: 20),
                        //   suffixIcon: Padding(
                        //       padding: const EdgeInsets.only(left: 10, right: 16),
                        //       child: context.appIcons.searchFilterIcon),
                        //   hintText: 'browse.browsePage.whatAreYouLookingFor',
                        //   hintStyle: context.appTextTheme.searchInputHintTextStyle,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          color: context.appColors.inboxChatRoomBackgroundColor,
          child: TabBarView(
            children: [
              ListView.builder(
                itemBuilder: (context, index) => Text(
                  index.toString(),
                ),
                itemCount: 100,
              ),
              ListView.builder(
                itemBuilder: (context, index) => Text(
                  index.toString(),
                ),
                itemCount: 100,
              ),
              ChatRooms(),
            ],
          ),
        ),
      ),
    );
  }
}
