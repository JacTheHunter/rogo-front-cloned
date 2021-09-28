import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rogo/core/helpers/extentions_on_build_context.dart';

class Indicator extends StatelessWidget {
  final bool isCurrent;
  const Indicator({Key? key, required this.isCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 8,
        width: isCurrent ? 32 : 8,
        decoration: BoxDecoration(
          color: isCurrent
              ? context.appColors.onboardingIndicatorSelectedColor
              : context.appColors.onboardingIndicatorColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        duration: Duration(milliseconds: 400),
        curve: Curves.bounceIn,
      ),
    );
  }
}
