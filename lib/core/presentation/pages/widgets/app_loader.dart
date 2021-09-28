import 'package:flutter/material.dart';

import '../../../theme/app_color_scheme.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';

class AppLoader extends StatelessWidget {
  final bool reverse;
  const AppLoader({Key? key, this.reverse = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: reverse ? AppColorScheme.white : context.appColors.primaryColor,
      ),
    );
  }
}
