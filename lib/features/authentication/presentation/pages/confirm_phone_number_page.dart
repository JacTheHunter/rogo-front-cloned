import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_app_bar.dart';
import '../../../../core/presentation/pages/widgets/app_loader.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../../../../core/theme/app_color_scheme.dart';
import '../blocs/phone_verification_cubit/phone_verification_cubit.dart';
import '../widgets/confirm_phone_number_code_item.dart';
import '../widgets/confirm_phone_number_pad_item.dart';

class ConfirmPhoneNumberPage extends StatefulWidget {
  const ConfirmPhoneNumberPage({
    Key? key,
  }) : super(key: key);

  @override
  _ConfirmPhoneNumberPageState createState() => _ConfirmPhoneNumberPageState();
}

class _ConfirmPhoneNumberPageState extends State<ConfirmPhoneNumberPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<PhoneVerificationCubit, PhoneVerificationState>(
            listener: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: AppText(state.errorMessage),
                  ),
                );
              }
            },
            builder: (context, state) {
              final val1 = (state.code.length > 0) ? state.code.substring(0, 1) : '';

              final val2 = (state.code.length > 1) ? state.code.substring(1, 2) : '';

              final val3 = (state.code.length > 2) ? state.code.substring(2, 3) : '';

              final val4 = (state.code.length > 3) ? state.code.substring(3, 4) : '';

              final val5 = (state.code.length > 4) ? state.code.substring(4, 5) : '';

              final val6 = (state.code.length > 5) ? state.code.substring(5, 6) : '';

              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // if (state.seconds != '00')
                      // AppText(
                      //   '00:${state.seconds}',
                      //   textAlign: TextAlign.center,
                      //   fontSize: 36,
                      //   fontWeight: FontWeight.w500,
                      //   color: AppColors.black,
                      // ),
                      Spacer(flex: 3),
                      AppText(
                        'authentication.confirmPhoneNumberPage.verifyYourPhonenumber',
                        style: context.appTextTheme.createAccountTitleTextStyle,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      AppText(
                        'authentication.confirmPhoneNumberPage.enterYourCodeHere',
                        style: context.appTextTheme.confirmPhoneSubtitleTextStyle,
                      ),
                      // if (state.errorMessage.isNotEmpty)
                      //   AppText(
                      //     state.errorMessage,
                      //     textAlign: TextAlign.center,
                      //     fontSize: 16,
                      //     color: AppColors.redOrange,
                      //   ),
                      Spacer(flex: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConfirmPhoneNumberCodeItem(text: val1),
                          ConfirmPhoneNumberCodeItem(text: val2),
                          ConfirmPhoneNumberCodeItem(text: val3),
                          ConfirmPhoneNumberCodeItem(text: val4),
                          ConfirmPhoneNumberCodeItem(text: val5),
                          ConfirmPhoneNumberCodeItem(text: val6),
                        ],
                      ),
                      Spacer(flex: 3),
                      if (state.seconds != '00')
                        Center(
                          child: AppText(
                            translate('authentication.confirmPhoneNumberPage.didntRecieveAnyCode') +
                                ' (00:${state.seconds})',
                            style: context.appTextTheme.confirmPhoneSubtitleTextStyle,
                          ),
                        ),
                      SizedBox(
                        height: 8,
                      ),
                      if (state.seconds == '00')
                        Center(
                          child: GestureDetector(
                            onTap: () => context.read<PhoneVerificationCubit>().resendCode(),
                            child: AppText(
                              'authentication.confirmPhoneNumberPage.resendNewCode',
                              style: context.appTextTheme.textButtonTextStyle,
                            ),
                          ),
                        ),
                      Spacer(flex: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ConfirmPhoneNumberPadItem(
                            text: '1',
                          ),
                          ConfirmPhoneNumberPadItem(
                            text: '2',
                          ),
                          ConfirmPhoneNumberPadItem(
                            text: '3',
                          ),
                        ],
                      ),
                      Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ConfirmPhoneNumberPadItem(
                            text: '4',
                          ),
                          ConfirmPhoneNumberPadItem(
                            text: '5',
                          ),
                          ConfirmPhoneNumberPadItem(
                            text: '6',
                          ),
                        ],
                      ),
                      Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ConfirmPhoneNumberPadItem(
                            text: '7',
                          ),
                          ConfirmPhoneNumberPadItem(
                            text: '8',
                          ),
                          ConfirmPhoneNumberPadItem(
                            text: '9',
                          ),
                        ],
                      ),
                      Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 75,
                            width: 75,
                          ),
                          ConfirmPhoneNumberPadItem(
                            text: '0',
                          ),
                          SizedBox(
                            width: 75,
                            height: 75,
                            child: InkWell(
                              borderRadius: BorderRadius.all(Radius.circular(75)),
                              splashColor: context.appColors.inputFillColor,
                              highlightColor: AppColorScheme.transparent,
                              onTap: context.read<PhoneVerificationCubit>().erraseCode,
                              child: context.appIcons.numberPadErraseIcon,
                            ),
                          ),
                        ],
                      ),
                      Spacer(flex: 3)
                    ],
                  ),
                  if (state.loading)
                    Center(
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColorScheme.haiti06,
                          ),
                          child: AppLoader()),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // void onResendPressed(BuildContext context) {
  //   sl<NavigatorService>().pop();
  //   if (widget.previousPage == ConfirmPhonePreviousPage.AddCardPage) {
  //     context.read<AddCardCubit>().send();
  //   } else if (widget.previousPage == ConfirmPhonePreviousPage.CreateCardPage) {
  //     context.read<CreateCardCubit>().send();
  //   }
  //   context.read<ConfirmPhoneNumberCubit>().restart();
  // }
}
