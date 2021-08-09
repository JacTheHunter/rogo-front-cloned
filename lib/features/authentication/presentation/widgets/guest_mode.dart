import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/presentation/blocs/app_theme_cubit/app_theme_cubit.dart';
import 'package:rogo/features/authentication/presentation/blocs/authentication_bloc/authentication_bloc.dart';

class GuestMode extends StatelessWidget {
  const GuestMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => context.read<AuthenticationBloc>().add(AuthenticationSignInAnonimousRequested()),
          child: AppText(
            'authentication.loginPage.guestMode',
            style: context.read<AppThemeCubit>().state.textTheme().textButtonTextStyle(),
          ),
        ),
      ],
    );
  }
}
