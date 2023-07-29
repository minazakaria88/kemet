import 'package:exlpore_egypt/chatbotcubit/chatbot_cubit.dart';
import 'package:exlpore_egypt/chatbotcubit/chatbot_state.dart';
import 'package:exlpore_egypt/shared/reuable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBot extends StatelessWidget {
  ChatBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBotCubit(),
      child: BlocConsumer<ChatBotCubit, ChatBotState>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = ChatBotCubit.get(context).messages;
          return Scaffold(
            appBar: AppBar(
              elevation: 10,
              flexibleSpace: const Image(
                image: AssetImage('images/appbar.jpg'),
                fit: BoxFit.cover,
              ),
              title: const Text(
                'ChatBot',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    if (list.isNotEmpty)
                      Expanded(
                        child: ListView.separated(
                            controller: ChatBotCubit.get(context).scrollController,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (index % 2 != 0) {
                                return chatBotListItem(
                                  text: list[index],
                                );
                              } else {
                                return userListItem(
                                  text: list[index],
                                );
                              }
                            },
                            separatorBuilder: (context, index) => Container(
                                  height: 2,
                                ),
                            itemCount: list.length),
                      ),
                    if (list.isEmpty) const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: defaultColor2,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: TextFormField(
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                  controller:
                                      ChatBotCubit.get(context).controller,
                                  decoration: InputDecoration(
                                    focusColor: Colors.teal,
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(0.9)),
                                    hintText: 'Type your Question here...',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            foregroundColor: Colors.white,
                            elevation: 5,
                            backgroundColor: defaultColor1,
                            child: const Icon(
                              Icons.send,
                              size: 30,
                            ),
                            onPressed: () {
                              ChatBotCubit.get(context).replyToMessage(
                                  ChatBotCubit.get(context).controller.text);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget userListItem({String? text}) => Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 60,right: 8,bottom: 8),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(12),
                topStart: Radius.circular(12),
                bottomStart: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$text',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      );
  Widget chatBotListItem({String? text}) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 8,right: 60,bottom: 8
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadiusDirectional.only(
                topEnd: Radius.circular(12),
                topStart: Radius.circular(12),
                bottomEnd: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$text',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      );
}
