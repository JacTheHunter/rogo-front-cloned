import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/presentation/pages/widgets/app_app_bar.dart';
import 'package:rogo/core/presentation/pages/widgets/app_loader.dart';
import 'package:rogo/features/authentication/domain/entities/user.dart';
import 'package:rogo/features/authentication/presentation/blocs/authentication_cubit/authentication_cubit.dart';
import 'package:rogo/features/inbox/presentation/blocs/chat_rooms_bloc/chat_rooms_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('choose users to start chat'),
      ),
      body: BlocBuilder<ChatRoomsBloc, ChatRoomsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return AppLoader();
          } else {
            List<User> availableUsers = List.from(state.users);
            final int currentUserId = context.read<AuthenticationCubit>().state.currentUser!.id;
            final List<int> exhistingChatRooms = List.from(state.chatRooms.map((e) => e.partner.id));
            availableUsers.removeWhere((element) => element.id == currentUserId);
            exhistingChatRooms.forEach((roomUserId) {
              availableUsers.removeWhere((element) => element.id == roomUserId);
            });
            if (availableUsers.isEmpty) {
              return Text('No available users');
            } else {
              return ListView.builder(
                itemCount: availableUsers.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<ChatRoomsBloc>()
                          .add(CreateChatEvent(companionId: availableUsers[index].id, publicationId: 1));
                    },
                    child: ListTile(
                      title: Text(
                        availableUsers[index].firstName + ' ' + availableUsers[index].lastName,
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
