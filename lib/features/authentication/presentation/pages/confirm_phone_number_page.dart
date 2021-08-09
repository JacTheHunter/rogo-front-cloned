import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:rogo/core/presentation/pages/widgets/app_app_bar.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/theme/app_color_scheme.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/features/authentication/presentation/widgets/confirm_phone_number_pad_item.dart';

enum ConfirmPhonePreviousPage {
  AddCardPage,
  CreateCardPage,
}

class ConfirmPhoneNumberPage extends StatefulWidget {
  final ConfirmPhonePreviousPage? previousPage;

  const ConfirmPhoneNumberPage({
    Key? key,
    this.previousPage,
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
          child: Column(
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
                style: context.read<AppThemeCubit>().state.textTheme().createAccountTitleTextStyle(),
              ),
              SizedBox(
                height: 16,
              ),
              AppText(
                'authentication.confirmPhoneNumberPage.enterYourCodeHere',
                style: context.read<AppThemeCubit>().state.textTheme().confirmPhoneSubtitleTextStyle(),
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
                  Container(
                    width: 56,
                    height: 56,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: context.read<AppThemeCubit>().state.appColors().primaryColor(),
                    ),
                    child: Center(
                      child: AppText(
                        '1',
                        textAlign: TextAlign.center,
                        style: context.read<AppThemeCubit>().state.textTheme().confirmPhoneSelectedNumberTextStyle(),
                      ),
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: context.read<AppThemeCubit>().state.appColors().inputFillColor(),
                    ),
                    child: Center(
                      child: AppText(
                        '',
                        textAlign: TextAlign.center,
                        style: context.read<AppThemeCubit>().state.textTheme().confirmPhoneSelectedNumberTextStyle(),
                      ),
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: context.read<AppThemeCubit>().state.appColors().inputFillColor(),
                    ),
                    child: Center(
                      child: AppText(
                        '',
                        textAlign: TextAlign.center,
                        style: context.read<AppThemeCubit>().state.textTheme().confirmPhoneSelectedNumberTextStyle(),
                      ),
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: context.read<AppThemeCubit>().state.appColors().inputFillColor(),
                    ),
                    child: Center(
                      child: AppText(
                        '',
                        textAlign: TextAlign.center,
                        style: context.read<AppThemeCubit>().state.textTheme().confirmPhoneSelectedNumberTextStyle(),
                      ),
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: context.read<AppThemeCubit>().state.appColors().inputFillColor(),
                    ),
                    child: Center(
                      child: AppText(
                        '',
                        textAlign: TextAlign.center,
                        style: context.read<AppThemeCubit>().state.textTheme().confirmPhoneSelectedNumberTextStyle(),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 3),
              Center(
                child: AppText(
                  translate('authentication.confirmPhoneNumberPage.didntRecieveAnyCode') + ' (0:59)',
                  style: context.read<AppThemeCubit>().state.textTheme().confirmPhoneSubtitleTextStyle(),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: AppText(
                  'authentication.confirmPhoneNumberPage.resendNewCode',
                  style: context.read<AppThemeCubit>().state.textTheme().textButtonTextStyle(),
                ),
              ),
              Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ConfirmPhoneNumberPadItem(
                    text: '1', onTap: () {},
                    // onTap: () => context.read<ConfirmPhoneNumberCubit>().updateCode('1'),
                  ),
                  ConfirmPhoneNumberPadItem(
                    text: '2', onTap: () {},
                    // onTap: () => context.read<ConfirmPhoneNumberCubit>().updateCode('1'),
                  ),
                  ConfirmPhoneNumberPadItem(
                    text: '3', onTap: () {},
                    // onTap: () => context.read<ConfirmPhoneNumberCubit>().updateCode('1'),
                  ),
                ],
              ),
              Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ConfirmPhoneNumberPadItem(
                    text: '4', onTap: () {},
                    // onTap: () => context.read<ConfirmPhoneNumberCubit>().updateCode('1'),
                  ),
                  ConfirmPhoneNumberPadItem(
                    text: '5', onTap: () {},
                    // onTap: () => context.read<ConfirmPhoneNumberCubit>().updateCode('1'),
                  ),
                  ConfirmPhoneNumberPadItem(
                    text: '6', onTap: () {},
                    // onTap: () => context.read<ConfirmPhoneNumberCubit>().updateCode('1'),
                  ),
                ],
              ),
              Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ConfirmPhoneNumberPadItem(
                    text: '7', onTap: () {},
                    // onTap: () => context.read<ConfirmPhoneNumberCubit>().updateCode('1'),
                  ),
                  ConfirmPhoneNumberPadItem(
                    text: '8', onTap: () {},
                    // onTap: () => context.read<ConfirmPhoneNumberCubit>().updateCode('1'),
                  ),
                  ConfirmPhoneNumberPadItem(
                    text: '9', onTap: () {},
                    // onTap: () => context.read<ConfirmPhoneNumberCubit>().updateCode('1'),
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
                    text: '0', onTap: () {},
                    // onTap: () => context.read<ConfirmPhoneNumberCubit>().updateCode('1'),
                  ),
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(75)),
                      splashColor: context.read<AppThemeCubit>().state.appColors().inputFillColor(),
                      highlightColor: AppColorScheme.transparent,
                      //  onTap: context.read<ConfirmPhoneNumberCubit>().erraseCode,
                      child: context.read<AppThemeCubit>().state.appIcons().numberPadErraseIcon(),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 3)
            ],
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
