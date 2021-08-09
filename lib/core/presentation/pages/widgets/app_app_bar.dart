import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/core/services/navigation_service.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backArrowColor;
  const AppAppbar({Key? key, this.backArrowColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.read<AppThemeCubit>().state.appColors().appBarBackgroundColor(),
      leading: sl<NavigatorService>().canPop()
          ? GestureDetector(
              onTap: () => sl<NavigatorService>().pop(),
              child: Icon(
                CupertinoIcons.arrow_left,
                color: backArrowColor ?? context.read<AppThemeCubit>().state.appColors().appBarBackArrowColor(),
              ),
            )
          : Container(),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
