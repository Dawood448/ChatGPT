import 'package:flutter/material.dart';
class ChatMessage extends StatelessWidget
{
  const ChatMessage({Key? key, required this.sender, required this.text}) : super(key: key);
  final String text;
  final String sender;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 70,
          decoration: BoxDecoration(
            color: sender=="User"?Colors.yellow.shade500:Colors.red.shade400,
            borderRadius: BorderRadius.circular(30)
          ),
          child:Center(child: Text(sender),),
      ),
      subtitle: Text(text,style: const TextStyle(color: Colors.black),),
    );
  }
}
