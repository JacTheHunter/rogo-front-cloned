import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../categories/presentation/bloc/categories_cubit/categories_cubit.dart';
import 'category_item.dart';

class Catogies extends StatelessWidget {
  const Catogies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'browse.browsePage.categories',
            style: context
                .read<AppThemeCubit>()
                .state
                .textTheme()
                .browseTitleTextStyle(),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 44,
            //  width: 100,
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                return AppText(state.errorMessage);
              }
              if (state.isLoading) {
                //TODO: replace this widget with AppLoader
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (context, i) {
                      return CategoryItem(
                        text: state.categories[i].name,
                        icon: state.categories[i].icon,
                      );
                    });
              }
            }),
          ),
        ],
      ),
    );
  }
}
