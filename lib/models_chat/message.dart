import 'package:graduated_project/Consts_chat/consts.dart';

class Message {
  final String message;
  final dynamic id;
  final String userName;
  Message(this.message, this.id, this.userName);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage], jsonData['id'], jsonData['userName']);
  }
}
