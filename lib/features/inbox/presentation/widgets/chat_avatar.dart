import 'package:flutter/material.dart';
import 'package:rogo/core/helpers/user_initials_from_user.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/features/inbox/domain/entities/chat_room_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatAvatar extends StatelessWidget {
  final double height;
  final double width;
  final ChatRoomUser user;
  const ChatAvatar({Key? key, required this.user, this.height = 48, this.width = 48}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: user.avatar.isNotEmpty
          ? AppImage.network(
              user.avatar,
              width: width,
              height: height,
            )
          : Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: context.appColors.chatAvatarBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: AppText(
                  userInitialsFromUser(user),
                  style: context.appTextTheme.chatAvatarLettersTextStyle,
                ),
              ),
            ),
    );
  }
}
