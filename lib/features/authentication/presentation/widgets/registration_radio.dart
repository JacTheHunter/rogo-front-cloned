import 'package:flutter/material.dart';
import 'package:rogo/core/configs/constants/app_colors.dart';

class RegistartionRadio extends StatelessWidget {
  final bool isSelected;
  const RegistartionRadio({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        //border: Border.all(color: isSelected ? AppColors.mariner : AppColors.waterloo, width: isSelected ? 2 : 1),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  //   color: AppColors.mariner,
                ),
              ),
            )
          : Container(),
    );
  }
}
