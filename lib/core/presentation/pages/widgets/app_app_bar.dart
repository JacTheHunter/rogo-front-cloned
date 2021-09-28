import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../injection/injection_container.dart';
import '../../../services/navigation_service.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backArrowColor;
  const AppAppbar({Key? key, this.backArrowColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.appColors.appBarBackgroundColor,
      leading: sl<NavigatorService>().canPop()
          ? GestureDetector(
              onTap: () => sl<NavigatorService>().pop(),
              child: Icon(
                CupertinoIcons.arrow_left,
                color: backArrowColor ?? context.appColors.appBarBackArrowColor,
              ),
            )
          : Container(),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
