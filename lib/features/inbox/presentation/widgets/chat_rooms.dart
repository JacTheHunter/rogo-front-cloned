import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/configs/constants/app_routes.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/presentation/pages/widgets/app_loader.dart';
import 'package:rogo/core/services/device_info_service.dart';
import 'package:rogo/core/services/navigation_service.dart';
import 'package:rogo/core/services/notification_service.dart';
import 'package:rogo/features/inbox/presentation/blocs/chat_rooms_bloc/chat_rooms_bloc.dart';

import 'chat_rooms_item.dart';

class ChatRooms extends StatefulWidget {
  const ChatRooms({Key? key}) : super(key: key);

  @override
  State<ChatRooms> createState() => _ChatRoomsState();
}

class _ChatRoomsState extends State<ChatRooms> {
  @override
  void initState() {
    super.initState();

    context.read<ChatRoomsBloc>().add(FetchChatRoomsEvent());
    context.read<ChatRoomsBloc>().add(FetchUsersForChatEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: BlocBuilder<ChatRoomsBloc, ChatRoomsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return AppLoader();
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name:',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Flexible(child: SelectableText(sl<DeviceInfoService>().deviceName)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Type: ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Flexible(child: SelectableText(sl<DeviceInfoService>().type)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Device id: ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Flexible(child: SelectableText(sl<DeviceInfoService>().deviceId)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Registration token: ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Flexible(child: SelectableText(sl<NotificationsService>().token)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status: ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Flexible(child: SelectableText(sl<NotificationsService>().status)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.info),
                      label: Text('User Notification info')),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.chatRooms.length,
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  itemBuilder: (context, index) {
                    return ChatRoomsItem(
                      room: state.chatRooms[index],
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        sl<NavigatorService>().pushNamed(AppRoutes.usersPage);
                      },
                      icon: Icon(Icons.add),
                      label: Text('Add user to begin chat')),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
