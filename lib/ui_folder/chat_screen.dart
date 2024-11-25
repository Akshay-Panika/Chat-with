import 'package:chat_with/auth_folder/auth_screen.dart';
import 'package:chat_with/widget_folder/hw_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Chat messages area
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                _buildChatBubble(
                  message: 'Hi there!',
                  isSentByMe: false,
                  time: '10:45 AM',
                ),
                _buildChatBubble(
                  message: 'Hello! How are you?',
                  isSentByMe: true,
                  time: '10:46 AM',
                ),
                _buildChatBubble(
                  message: 'I\'m good, thanks for asking. What about you?',
                  isSentByMe: false,
                  time: '10:47 AM',
                ),
              ],
            ),
          ),

          // Input bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 28),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      filled: true,
                      fillColor: Colors.black12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                    ),
                  ),
                ),
                10.width,

                Card(
                  elevation: 0.0,
                  color: Colors.black12,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.grey),
                    onPressed: () {
                      // Camera functionality
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble({
    required String message,
    required bool isSentByMe,
    required String time,
  }) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.black26 : Colors.black12,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
            bottomLeft: Radius.circular(isSentByMe ? 10 : 0),
            bottomRight: Radius.circular(isSentByMe ? 0 : 10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isSentByMe ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(
                color: isSentByMe ? Colors.white70 : Colors.black54,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
