import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injection/injection_container.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/presentation/pages/widgets/app_text_form_field.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../../../languages/presentation/blocs/languages_cubit/languages_cubit.dart';
import 'language_list_item.dart';

class LanguagesSheet extends StatelessWidget {
  const LanguagesSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: BoxDecoration(
                color: AppColorScheme.white, borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            child: BlocBuilder<LanguagesCubit, LanguagesState>(
              builder: (context, state) {
                return CustomScrollView(
                  controller: scrollController,
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      delegate: AppSliverPersistentHeaderDelegate(
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => sl<NavigatorService>().pop(),
                                  child: SizedBox(
                                    child: Align(
                                        alignment: Alignment.centerLeft, child: context.appIcons.appBarArrowLeftIcon),
                                    width: 46,
                                  ),
                                ),
                                Flexible(
                                  child: AppText(
                                    'authentication.createAccountPage.addLanguage',
                                    style: context.appTextTheme.bottomSheetTitleTextStyle,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => sl<NavigatorService>().pop(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      context.appIcons.textButtonCheckboxIcon,
                                      SizedBox(
                                        width: 6,
                                      ),
                                      AppText(
                                        'authentication.createAccountPage.accept',
                                        style: context.appTextTheme.bottomSheetButtonTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            AppTextFormField(
                              // fillColor: context.appColors.sliverAppBarSearchFillolor,
                              prefixIconConstraints: BoxConstraints(maxHeight: 18),
                              prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 18, right: 10),
                                  child: context.appIcons.searchIcon),

                              // suffixIconConstraints: BoxConstraints(maxHeight: 20),
                              // suffixIcon: context.read<LanguagesCubit>().state.searchPhrase.isNotEmpty
                              //     ? GestureDetector(
                              //         onTap: context.read<LanguagesCubit>().clearSearch,
                              //         child: Padding(
                              //             padding: const EdgeInsets.only(left: 10, right: 16),
                              //             child: context.appIcons.searchClearIcon),
                              //       )
                              //     : Container(),

                              hintText: 'authentication.createAccountPage.searchLanguages',
                              hintStyle: context.appTextTheme.searchInputHintTextStyle,
                              onChanged: context.read<LanguagesCubit>().updateSearchPhrase,
                            ),
                          ],
                        ),
                        height: 112,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => LanguageListItem(
                          state.filteredLanguages[index],
                          isSelected: state.selectedLanguages.contains(state.languages[index]),
                        ),
                        childCount: state.filteredLanguages.length,
                      ),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class AppSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  AppSliverPersistentHeaderDelegate(this.child, {this.height = 50});

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
