import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import '../../../../core/presentation/pages/widgets/app_text.dart';
import '../blocs/firebase_authentication_bloc/firebase_authentication_bloc.dart';

class GuestMode extends StatelessWidget {
  const GuestMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => context.read<FirebaseAuthenticationBloc>().add(FirebaseAuthenticationSignInAnonimousRequested()),
          child: AppText(
            'authentication.loginPage.guestMode',
            style: context.appTextTheme.textButtonTextStyle,
          ),
        ),
      ],
    );
  }
}
