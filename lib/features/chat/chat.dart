import 'package:flutter/material.dart';
import 'package:flutter_poc/shared/utils/responsive_widget.dart';
import 'chat_details_screen.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> dummyChats = [
    {
      'title': 'Alice',
      'messages': [
        {'sender': 'You', 'content': 'Hey Alice, how are you?'},
        {'sender': 'Alice', 'content': 'I’m good! How about you?'},
        {'sender': 'You', 'content': 'I’m doing great, thanks for asking!'},
        {'sender': 'Alice', 'content': 'What’s new with you?'},
        {
          'sender': 'You',
          'content': 'Not much, just working on some projects.'
        },
        {'sender': 'Alice', 'content': 'Sounds interesting! Tell me more.'},
        {'sender': 'You', 'content': 'Sure! I’m working on a new app.'},
        {'sender': 'Alice', 'content': 'That’s cool. What does it do?'},
        {'sender': 'You', 'content': 'It’s a chat application.'},
        {'sender': 'Alice', 'content': 'Wow, nice! Can’t wait to see it.'},
      ],
    },
    {
      'title': 'Bob',
      'messages': [
        {'sender': 'You', 'content': 'Hi Bob, what’s up?'},
        {'sender': 'Bob', 'content': 'Hey! Not much, just relaxing.'},
        {
          'sender': 'You',
          'content': 'Sounds good. Want to grab coffee sometime?'
        },
        {'sender': 'Bob', 'content': 'Sure, let’s do it.'},
        {'sender': 'You', 'content': 'How about tomorrow at 3 PM?'},
        {'sender': 'Bob', 'content': 'Perfect, see you then!'},
        {'sender': 'You', 'content': 'Great! Looking forward to it.'},
        {'sender': 'Bob', 'content': 'Me too. Have a good day!'},
        {'sender': 'You', 'content': 'You too!'},
        {'sender': 'Bob', 'content': 'Catch you later.'},
      ],
    },
    {
      'title': 'Charlie',
      'messages': [
        {
          'sender': 'You',
          'content': 'Hey Charlie, any updates on the project?'
        },
        {'sender': 'Charlie', 'content': 'Yes, we’ve made some progress.'},
        {
          'sender': 'You',
          'content': 'That’s great to hear. Can you share the details?'
        },
        {
          'sender': 'Charlie',
          'content': 'Sure. We’ve completed the initial phase.'
        },
        {'sender': 'You', 'content': 'Awesome! What’s the next step?'},
        {'sender': 'Charlie', 'content': 'We’ll start testing next week.'},
        {
          'sender': 'You',
          'content': 'Perfect. Let me know if you need any help.'
        },
        {'sender': 'Charlie', 'content': 'Will do. Thanks!'},
        {'sender': 'You', 'content': 'No problem.'},
        {'sender': 'Charlie', 'content': 'Talk soon.'},
      ],
    },
  ];

  Map<String, dynamic>? selectedChat;

  @override
  void initState() {
    selectedChat = dummyChats.elementAt(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        mobile: _ChatList(
          dummyChats: dummyChats,
          onChatSelected: (index) {
            final chat = dummyChats.elementAt(index);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailsScreen(
                  chatTitle: chat['title'],
                  chatMessages: (chat['messages'] as List<Map<String, dynamic>>)
                      .map((message) {
                    return {
                      'sender': message['sender'] as String,
                      'content': message['content'] as String,
                    };
                  }).toList(),
                ),
              ),
            );
          },
        ),
        web: Row(
          children: [
            SizedBox(
              width: 400,
              child: _ChatList(
                dummyChats: dummyChats,
                onChatSelected: (index) {
                  selectedChat = dummyChats[index];
                  setState(() {});
                },
              ),
            ),
            const SizedBox(width: 10),
            if (selectedChat != null)
              Expanded(
                child: ChatDetailsScreen(
                  chatTitle: selectedChat!['title'],
                  chatMessages:
                      (selectedChat!['messages'] as List<Map<String, dynamic>>)
                          .map((message) {
                    return {
                      'sender': message['sender'] as String,
                      'content': message['content'] as String,
                    };
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ChatList extends StatelessWidget {
  const _ChatList({
    super.key,
    required this.dummyChats,
    required this.onChatSelected,
  });

  final List<Map<String, dynamic>> dummyChats;
  final ValueChanged<int> onChatSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyChats.length,
      itemBuilder: (context, index) {
        final chat = dummyChats[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text(chat['title']),
            subtitle: Text(chat['messages'].last['content']),
            onTap: () => onChatSelected(index),
          ),
        );
      },
    );
  }
}
