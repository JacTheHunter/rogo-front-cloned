import 'package:flutter/material.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';

class MessagesDateDivider extends StatelessWidget {
  final String date;
  const MessagesDateDivider({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        date,
        style: context.appTextTheme.chatMessagesDateDividerTextStyle,
      ),
    );
  }
}
