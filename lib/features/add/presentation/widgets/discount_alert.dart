import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injection/injection_container.dart';
import '../../../../core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/services/navigation_service.dart';

class DiscountAlert extends StatelessWidget {
  const DiscountAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: AppText(
        'Discount',
        style: context.read<AppThemeCubit>().state.textTheme.discountDialogHeaderTextStyle,
      ),
      content: AppText(
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.',
        style: context.read<AppThemeCubit>().state.textTheme.discountDialogContentTextStyle,
      ),
      actions: [
        GestureDetector(
          onTap: () => sl<NavigatorService>().pop(),
          child: AppText(
            'CLOSE',
            style: context.read<AppThemeCubit>().state.textTheme.discountDialogButtonTextStyle,
          ),
        ),
      ],
    );
  }
}
