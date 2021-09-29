import 'package:flutter/material.dart';

import '../../../../core/theme/app_color_scheme.dart';

class AddCardButton extends StatelessWidget {
  final Function()? onTap;

  const AddCardButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 155),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColorScheme.hollywoodCerise,
              width: 2,
            )),
        child: Icon(
          Icons.add,
          color: AppColorScheme.hollywoodCerise,
        ),
      ),
    );
  }
}
