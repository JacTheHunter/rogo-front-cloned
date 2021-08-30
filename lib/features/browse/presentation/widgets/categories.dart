import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_loader.dart';
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
            style: context.read<AppThemeCubit>().state.textTheme.browseTitleTextStyle,
          ),
          SizedBox(height: 16),
          SizedBox(
              height: 44,
              //  width: 100,
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state.isLoading) return AppLoader();
                  if (!state.isLoading && state.categories.isEmpty) return Container();
                  return ListView.builder(
                    itemBuilder: (context, index) =>
                        CategoryItem(text: state.categories[index].name, icon: state.categories[index].icon),
                    itemCount: state.categories.length,
                    scrollDirection: Axis.horizontal,
                  );
                },
              )),

          // ListView(
          //   scrollDirection: Axis.horizontal,
          // )
        ],
      ),
    );
  }
}
