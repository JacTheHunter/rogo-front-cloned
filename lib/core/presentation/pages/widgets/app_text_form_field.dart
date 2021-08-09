import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/core/theme/app_color_scheme.dart';

class AppTextFormField extends StatelessWidget {
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final String? initialValue;
  final String? hintText;
  final String? prefixText;

  final TextEditingController? controller;

  final TextInputType? keyboardType;

  final bool autofocus;
  final FocusNode? focusNode;

  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  final bool obscureText;
  final bool? enabled;

  final Function()? onTap;

  final Function(String)? onChanged;

  final TextAlign textAlign;

  final List<TextInputFormatter>? inputFormatters;

  final Color? fillColor;

  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;

  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

  final TextCapitalization textCapitalization;

  final bool isInvalid;

  const AppTextFormField({
    Key? key,
    this.textStyle,
    this.hintStyle,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.focusNode,
    this.initialValue,
    this.obscureText = false,
    this.enabled,
    this.onChanged,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.prefixText,
    this.fillColor,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.textCapitalization = TextCapitalization.none,
    this.isInvalid = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      onTap: onTap,
      keyboardType: keyboardType,
      autofocus: autofocus,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      focusNode: focusNode,
      initialValue: initialValue,
      obscureText: obscureText,
      onChanged: onChanged,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      style: textStyle ?? context.read<AppThemeCubit>().state.textTheme().inputTextStyle(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 16),
        fillColor: fillColor ?? context.read<AppThemeCubit>().state.appColors().inputFillColor(),
        counterText: '',
        hintText: translate(hintText ?? ''),
        //  isDense: true,
        prefixText: prefixText,
        prefixStyle: context.read<AppThemeCubit>().state.textTheme().inputTextStyle(),
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        suffix: suffix,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        hintStyle: hintStyle ?? context.read<AppThemeCubit>().state.textTheme().inputHintTextStyle(),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
          borderSide: isInvalid
              ? BorderSide(color: context.read<AppThemeCubit>().state.appColors().errorColor())
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
          borderSide: isInvalid
              ? BorderSide(color: context.read<AppThemeCubit>().state.appColors().errorColor())
              : BorderSide.none,
        ),
        filled: true,
      ),
    );
  }
}
