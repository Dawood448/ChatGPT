import 'dart:async';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:gpt/CustomWidgets/field_widget.dart';
import 'chat_messages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  List<ChatMessage> messageList = [];
  ChatGPT? chatGPT;
  StreamSubscription? subscription;
  String token = "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";
  @override
  void initState() {
    super.initState();
    chatGPT = ChatGPT.instance.builder(token);
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  void sendMessage() {
    ChatMessage message = ChatMessage(sender: "User", text: controller.text);
    setState(() {
      messageList.insert(0, message);
    });
    controller.clear();
    final request = CompleteReq(
      prompt: message.text,
      model: kTranslateModelV3,
      max_tokens: 200,
    );
    subscription = chatGPT!
        .builder(
          token,
        )
        .onCompleteStream(request: request)
        .listen((event) {
          print( event!.choices[0].text);
          ChatMessage botMessage=ChatMessage(sender: "Bot", text: event.choices[0].text);
          setState(() {
            messageList.insert(0, botMessage);
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Chat-GPT",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 5),
              child: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("asset/me-removebg-preview.png"),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: messageList.length,
                  itemBuilder: (ctx, index) {
                    return messageList[index];
                  }),
            ),
            kField(
              text: "Ask me anything!",
              controller: controller,
              btn: IconButton(
                onPressed: () {
                  sendMessage();
                },
                icon: const Icon(Icons.send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
