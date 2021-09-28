import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rogo/core/helpers/extentions_on_build_context.dart';

class AddLanguagesButton extends StatelessWidget {
  final Function()? onTap;
  const AddLanguagesButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 56,
        decoration: BoxDecoration(
          border: Border.all(color: context.appColors.primaryTextColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: context.appIcons.addLanguageButtonIcon,
        ),
      ),
    );
  }
}
