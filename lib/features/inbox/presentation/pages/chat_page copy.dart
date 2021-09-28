import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/configs/constants/app_images.dart';
import 'package:rogo/core/helpers/chat_divider_string_from_date.dart';
import 'package:rogo/core/injection/injection_container.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'package:rogo/core/presentation/pages/widgets/app_app_bar.dart';
import 'package:rogo/core/presentation/pages/widgets/app_chat_text_form_field.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/core/presentation/pages/widgets/app_loader.dart';
import 'package:rogo/features/authentication/presentation/blocs/authentication_cubit/authentication_cubit.dart';
import 'package:rogo/features/inbox/presentation/blocs/chat_messages_bloc/chat_messages_bloc.dart';
import 'package:rogo/features/inbox/presentation/blocs/send_message_cubit/send_message_cubit.dart';
import 'package:rogo/features/inbox/presentation/widgets/chat_input_panel.dart';
import 'package:rogo/features/inbox/presentation/widgets/message_view.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'package:rogo/features/inbox/presentation/widgets/messages_date_divider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.chatBackgroundColor,
      appBar: AppAppbar(),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatMessagesBloc, ChatMessagesState>(
              builder: (context, state) {
                if (state.messages.isEmpty) return Container();
                return SafeArea(
                  bottom: false,
                  child: Scrollbar(
                    controller: _scrollController,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final reversedList = List.from(state.messages.reversed);

                        return Column(
                          children: [
                            if (index == reversedList.length - 1 && state.loadingTop)
                              Container(height: 40, margin: const EdgeInsets.all(10), child: AppLoader()),
                            if (reversedList.isNotEmpty &&
                                (index == reversedList.length - 1 ||
                                    reversedList[index]
                                        .createdAt
                                        .isAfter(reversedList[index + 1].createdAt.add(Duration(days: 1)))))
                              MessagesDateDivider(
                                date: chatDividerStringFromDate(reversedList[index].createdAt),
                              ),
                            MessageView(
                              message: reversedList[index],
                            ),
                            if (index == 0 && state.loadingBottom)
                              Container(height: 40, margin: const EdgeInsets.all(10), child: AppLoader())
                          ],
                        );
                      },
                      padding: const EdgeInsets.fromLTRB(8, 70, 8, 0),
                      reverse: true,
                    ),
                  ),
                );
              },
            ),
          ),
          ChatInputPanel()
        ],
      ),
    );
  }

  void _onScroll() {
    if (_isTop) {
      context.read<ChatMessagesBloc>().add(ScrolllUpEvent());
      print('up');
    }

    if (_isBottom) {
      context.read<ChatMessagesBloc>().add(ScrolllDownEvent());
      debugPrint('down');
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final minScrollExtent = _scrollController.position.minScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll <= (minScrollExtent * 0.7);
  }

  bool get _isTop {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
