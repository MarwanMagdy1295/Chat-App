import 'package:chat_app/src/core/utils/app_colors.dart';
import 'package:chat_app/src/core/utils/app_theme.dart';
import 'package:chat_app/src/core/utils/assets/translations/keys.dart';
import 'package:chat_app/src/core/utils/constants.dart';
import 'package:chat_app/src/modules/chat_screen/presentation/components/receiver_massege.dart';
import 'package:chat_app/src/modules/chat_screen/presentation/components/sender_massege.dart';
import 'package:chat_app/src/modules/chat_screen/presentation/controller/cubit/chat_cubit.dart';
import 'package:chat_app/widget/chat_screen_appbar.dart';
import 'package:chat_app/widget/chat_screen_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.watch<ChatCubit>();
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(48.0.h),
                child: ChatScreenAppBar(
                  image: '',
                  name: 'Sebastian',
                  status: chat_screen.last_seen_recently.tr(),
                ),
              ), //
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
              floatingActionButton: InputTextField(cubit: cubit),
              body: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SenderMassege(
                    massege: '',
                    time: '',
                  ),
                  ReciverMassege(
                    massege: '',
                    time: '',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
