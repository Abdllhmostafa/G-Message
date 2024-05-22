import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:graduated_project/Consts_chat/consts.dart';
import 'package:graduated_project/models_chat/message.dart';
import 'package:graduated_project/chat_views/loading_from_login.dart';
import 'package:graduated_project/widgets_chat/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = "chat page";
  final _controller = ScrollController();
  //اضافة كوليكشن جديد للداتا بيز اسمها ماسيجس و بخزن فيها محتوي الرساله
  // عن طريق ال اون سابميتد اللي فال تيكست فيلد
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kCollectionMassages);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text("Chat Room"),
                ),
                centerTitle: true,
              ),
              body: Column(children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(
                              message: messagesList[index],
                            )
                          : ChatBubleForFriend(message: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add(
                        {
                          kMessage: data,
                          kCreatedAt: DateTime.now(),
                          'id': email
                        },
                      );
                      controller.clear();
                      _controller.animateTo(
                        0,
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        )),
                  ),
                ),
              ]),
            );
          } else {
            return Loading_page();
          }
        });
  }
}
