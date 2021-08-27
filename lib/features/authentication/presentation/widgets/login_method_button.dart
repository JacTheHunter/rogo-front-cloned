import 'package:flutter/material.dart';

import '../../../../core/configs/constants/app_colors.dart';
import '../../../../core/presentation/pages/widgets/app_image.dart';

class LoginMethodButton extends StatelessWidget {
  final Function()? onTap;
  final String icon;
  const LoginMethodButton({
    Key? key,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 21),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.remi, width: 1),
        ),
        child: Center(
            child: AppImage.asset(
          icon,
          height: 28,
          width: 28,
        )),
      ),
    );
  }
}
