import 'package:flutter/material.dart';
import 'package:rogo/features/onboarding/presentation/widgets/indicator.dart';

class Indocators extends StatelessWidget {
  final int total;
  final int current;
  const Indocators({
    Key? key,
    required this.total,
    required this.current,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          total,
          (page) => Indicator(
                isCurrent: page == current,
              )),
    );
  }
}
