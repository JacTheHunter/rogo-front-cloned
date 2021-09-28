import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'app_text.dart';

class AppDropdown<T> extends StatelessWidget {
  final List<T>? items;
  final Function(T?)? onChanged;
  final T? value;
  const AppDropdown({Key? key, this.items, this.onChanged, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: context.appColors.inputFillColor,
        ),
        padding: const EdgeInsets.fromLTRB(20, 4, 8, 2),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            itemHeight: 50,
            value: value,
            icon: context.appIcons.dropDownIcon,
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: onChanged,
            //  onChanged: (String? newValue) {},
            items: items?.map<DropdownMenuItem<T>>((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: AppText(
                  value.toString(),
                  style: context.appTextTheme.inputTextStyle,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
