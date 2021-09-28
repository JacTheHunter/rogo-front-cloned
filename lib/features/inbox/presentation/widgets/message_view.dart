import 'package:flutter/material.dart';
import 'package:rogo/core/helpers/formaters.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/features/authentication/presentation/blocs/authentication_cubit/authentication_cubit.dart';
import 'package:rogo/features/inbox/domain/entities/chat_message.dart';
import 'package:rogo/features/inbox/presentation/widgets/chat_avatar.dart';

class MessageView extends StatelessWidget {
  final ChatMessage message;
  const MessageView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMessageOwn = (context.read<AuthenticationCubit>().state.currentUser?.id ?? 0) == (message.author?.id ?? 0);
    return Align(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: isMessageOwn ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            if (isMessageOwn) ...[
              AppText(
                AppFormaters.chatTime(message.createdAt),
                style: context.appTextTheme.chatMessageTimeTextStyle,
              ),
              SizedBox(width: 4),
            ],
            if (!isMessageOwn) ...[
              ChatAvatar(user: message.author!),
              SizedBox(width: 8),
            ],
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: isMessageOwn
                        ? context.appColors.chatOwnMessageBackgroundColor
                        : context.appColors.chatPartnerMessageBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: isMessageOwn ? Radius.circular(16) : Radius.zero,
                      bottomRight: isMessageOwn ? Radius.zero : Radius.circular(16),
                    )),
                child: AppText(
                  message.text.isNotEmpty
                      ? message.text
                      : 'Yeah, it\'s 8:00. Hey, McFly, I thought I told you never to come in here. Well it\'s gonna cost you. How much money you got on you?',
                  style: context.appTextTheme.chatMessageTextStyle,
                ),
              ),
            ),
            if (!isMessageOwn) ...[
              SizedBox(width: 4),
              AppText(
                AppFormaters.chatTime(message.createdAt),
                style: context.appTextTheme.chatMessageTimeTextStyle,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
