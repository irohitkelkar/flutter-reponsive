import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String chatTitle;
  final List<Map<String, String>> chatMessages;

  const ChatDetailsScreen({
    super.key,
    required this.chatTitle,
    required this.chatMessages,
  });

  @override
  ChatDetailsScreenState createState() => ChatDetailsScreenState();
}

class ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        widget.chatMessages.add({
          'sender': 'You',
          'content': _messageController.text,
        });
        _messageController.clear();
        // Scroll to the bottom
        Future.delayed(const Duration(milliseconds: 100), () {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.chatTitle,
        ),
        foregroundColor: kIsWeb
            ? Theme.of(context).hintColor
            : Theme.of(context).primaryColor,
        backgroundColor: kIsWeb
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (String item) {},
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'item1',
                  child: Text('Call'),
                ),
                const PopupMenuItem<String>(
                  value: 'item1',
                  child: Text('Profile'),
                ),
                const PopupMenuItem<String>(
                  value: 'item1',
                  child: Text('Block'),
                ),
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          // Scrollable chat content
          Positioned.fill(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(
                  bottom: 80), // Reserve space for the input area
              itemCount: widget.chatMessages.length,
              itemBuilder: (context, index) {
                final message = widget.chatMessages[index];
                final isUserMessage = message['sender'] == 'You';

                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUserMessage ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      message['content']!,
                      style: TextStyle(
                        color: isUserMessage ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Input area
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
