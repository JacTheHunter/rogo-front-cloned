import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';

class ConfirmPhoneNumberCodeItem extends StatelessWidget {
  final String text;
  const ConfirmPhoneNumberCodeItem({Key? key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 50,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: text.isEmpty ? context.appColors.inputFillColor : context.appColors.primaryColor,
      ),
      child: Center(
        child: AppText(
          text,
          textAlign: TextAlign.center,
          style: context.appTextTheme.confirmPhoneSelectedNumberTextStyle,
        ),
      ),
    );
  }
}
