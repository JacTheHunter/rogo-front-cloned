import 'package:flutter/material.dart';
import 'package:rogo/features/add/presentation/widgets/indicator.dart';

class Indicators extends StatelessWidget {
  final int total;
  final int currentStep;
  const Indicators({
    Key? key,
    required this.total,
    required this.currentStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        total,
        (step) => Expanded(
          child: Indicator(
            isCurrent: (step) <= currentStep,
          ),
        ),
      ),
    );
  }
}
