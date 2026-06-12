import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(padding: const EdgeInsets.all(4.0), child: CircleAvatar(backgroundImage: NetworkImage('https://content.emarket.pe/common/collections/standard/e6/c7/e6c7d2be-59e7-481c-aa7a-096185770e8e.jpg'),)),
        title: const Text('POKEMON'),
      ),
      body: _Chatview(),
    );
  }
}

class _Chatview extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                  ? const MyMessageBubble()
                  :
                  const HerMessageBubble();
                },
              )
                
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}