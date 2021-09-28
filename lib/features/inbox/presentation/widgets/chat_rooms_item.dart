import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/configs/constants/app_routes.dart';
import 'package:rogo/core/helpers/formaters.dart';
import 'package:rogo/core/helpers/string_from_last_message.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'package:rogo/core/presentation/pages/widgets/app_text.dart';
import 'package:rogo/core/services/navigation_service.dart';
import 'package:rogo/features/inbox/domain/entities/chat_room.dart';
import 'package:rogo/features/inbox/presentation/blocs/chat_messages_bloc/chat_messages_bloc.dart';
import 'package:rogo/features/inbox/presentation/blocs/chat_rooms_bloc/chat_rooms_bloc.dart';
import 'package:rogo/features/inbox/presentation/blocs/send_message_cubit/send_message_cubit.dart';
import 'package:rogo/features/inbox/presentation/widgets/chat_avatar.dart';

class ChatRoomsItem extends StatelessWidget {
  final ChatRoom room;
  const ChatRoomsItem({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.read<ChatMessagesBloc>().add(SelectChatRoomEvent(chatRoomId: room.id));
        context.read<SendMessageCubit>().updateSelectedChatRoomId((room.id));

        await sl<NavigatorService>().pushNamed(AppRoutes.chatPage);
        context.read<ChatRoomsBloc>().add(FetchChatRoomsEvent());
        context.read<ChatRoomsBloc>().add(FetchUsersForChatEvent());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: context.appColors.inboxChatRoomItemBackgroundColor,
          //  border: Border.all(color: context.appColors.inboxChatRoomItemBorderColor),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ChatAvatar(user: room.partner),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    room.partner.fullName,
                    style: context.appTextTheme.chatRoomItemNameTextStyle,
                  ),
                  SizedBox(height: 6),
                  SizedBox(
                    height: 16,
                    child: AppText(
                      stringFromLastMessage(room.lastMessage),
                      style: context.appTextTheme.chatRoomItemLastMessageTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  AppFormaters.chatRoomTime(room.lastMessage?.createdAt),
                  style: context.appTextTheme.chatRoomItemLastDateTextStyle,
                ),
                SizedBox(height: 4.5),
                if (room.unreadMessagesCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.appColors.inboxChatRoomItemNewMessagesBackgroundColor,
                    ),
                    child: AppText(
                      room.unreadMessagesCount.toString(),
                      style: context.appTextTheme.chatRoomItemMesagesCountTextStyle,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
