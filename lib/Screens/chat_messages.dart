import 'package:flutter/material.dart';
class ChatMessage extends StatelessWidget
{
  const ChatMessage({Key? key, required this.sender, required this.text}) : super(key: key);
  final String text;
  final String sender;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(sender[0]),),
      title:Text(sender,style: const TextStyle(color: Colors.green),),
      subtitle: Text(text),
    );
  }
}
