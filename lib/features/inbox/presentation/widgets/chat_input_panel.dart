import 'package:flutter/material.dart';
import 'package:rogo/core/configs/constants/app_images.dart';
import 'package:rogo/core/helpers/extentions_on_build_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rogo/core/presentation/pages/widgets/app_chat_text_form_field.dart';
import 'package:rogo/core/presentation/pages/widgets/app_image.dart';
import 'package:rogo/features/inbox/presentation/blocs/send_message_cubit/send_message_cubit.dart';

class ChatInputPanel extends StatefulWidget {
  const ChatInputPanel({Key? key}) : super(key: key);

  @override
  _ChatInputPanelState createState() => _ChatInputPanelState();
}

class _ChatInputPanelState extends State<ChatInputPanel> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendMessageCubit, SendMessageState>(
      listenWhen: (previous, current) =>
          previous.status == SendMessageStatus.loading && current.status == SendMessageStatus.success,
      listener: (context, state) {
        _controller.clear();
      },
      child: SafeArea(
        child: FractionallySizedBox(
            widthFactor: 1,
            child: Column(
              children: [
                Container(
                  height: 2,
                  color: context.appColors.chatInputsBorderColor,
                ),
                Container(
                  height: 64,
                  color: context.appColors.chatInputsBackgroundColor,
                  padding: const EdgeInsets.fromLTRB(13.5, 12, 8, 12),
                  child: Row(
                    children: [
                      AppImage.asset(AppImages.vector.chatImage, width: 18, height: 18),
                      SizedBox(width: 15),
                      AppImage.asset(AppImages.vector.chatMapPin, width: 15, height: 18),
                      SizedBox(width: 9.5),
                      Expanded(
                        child: AppChatTextFormField(
                          controller: _controller,
                          hintText: 'inbox.chat.writeAMessage',
                          maxLines: 1,
                          onChanged: context.read<SendMessageCubit>().updateMessageText,
                        ),
                      ),
                      SizedBox(width: 9.5),
                      GestureDetector(
                        onTap: () => context.read<SendMessageCubit>().send(),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: context.appColors.chatInputsSendButtonBackgroundColor),
                          child: AppImage.asset(
                            AppImages.vector.chatSend,
                            fit: BoxFit.scaleDown,
                            width: 16,
                            height: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
