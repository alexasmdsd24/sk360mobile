import 'package:flutter/material.dart';

import '../routes.dart';
import '../ui/app_ui.dart';
import '../widgets/president_components.dart';

class ChatConversationScreen extends StatefulWidget {
  const ChatConversationScreen({super.key});

  @override
  State<ChatConversationScreen> createState() => _ChatConversationScreenState();
}

class _ChatConversationScreenState extends State<ChatConversationScreen> {
  final List<_ChatMessage> _messages = [
    const _ChatMessage(
      author: 'SK Federation President',
      message:
          'Good morning everyone! Reminder that we have our monthly meeting tomorrow at 10 AM.',
      time: '9:15 AM',
      isMe: false,
    ),
    const _ChatMessage(
      author: 'You',
      message: 'Noted! Will prepare the reports.',
      time: '9:20 AM',
      isMe: true,
    ),
    const _ChatMessage(
      author: 'SK Chairman - Brgy 5',
      message: 'Can we also discuss the upcoming community event?',
      time: '9:25 AM',
      isMe: false,
    ),
    const _ChatMessage(
      author: 'SK Secretary - Brgy 2',
      message: "I've uploaded all January reports to the system.",
      time: '9:30 AM',
      isMe: false,
    ),
    const _ChatMessage(
      author: 'You',
      message: "Great work! I'll review them this afternoon.",
      time: '9:35 AM',
      isMe: true,
    ),
  ];

  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrayBg,
      bottomNavigationBar: PresidentBottomNavBar(
        activeItem: PresidentNavItem.chat,
        onItemSelected: _handleNavSelection,
      ),
      body: SafeArea(
        child: Column(
          children: [
            PresidentHeader(
              leading: PresidentHeaderLeading.back,
              onLeadingTap: () => Navigator.pop(context),
              title: 'Federation General',
              subtitle: '48 members · Active',
              trailing: const [
                Icon(Icons.videocam_outlined, color: Colors.white),
                SizedBox(width: 12),
                Icon(Icons.call_outlined, color: Colors.white),
                SizedBox(width: 12),
                Icon(Icons.more_vert, color: Colors.white),
              ],
              customContent: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: const Icon(Icons.people, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Federation General',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '48 members · Active',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _MessageBubble(message: message);
                },
              ),
            ),
            _MessageInputField(
              controller: _messageController,
              onSend: _handleSend,
            ),
          ],
        ),
      ),
    );
  }

  void _handleSend() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.add(
        _ChatMessage(
          author: 'You',
          message: _messageController.text.trim(),
          time: 'Now',
          isMe: true,
        ),
      );
      _messageController.clear();
    });
  }

  void _handleNavSelection(PresidentNavItem item) {
    if (item == PresidentNavItem.chat) return;
    switch (item) {
      case PresidentNavItem.home:
        Navigator.pushReplacementNamed(context, AppRoutes.presidentHome);
        break;
      case PresidentNavItem.calendar:
        Navigator.pushReplacementNamed(context, AppRoutes.presidentCalendar);
        break;
      case PresidentNavItem.profile:
        Navigator.pushReplacementNamed(context, AppRoutes.profile);
        break;
      case PresidentNavItem.chat:
        break;
    }
  }
}

class _MessageBubble extends StatelessWidget {
  final _ChatMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final alignment = message.isMe
        ? Alignment.centerRight
        : Alignment.centerLeft;
    final bubbleColor = message.isMe ? AppColors.primaryRed : Colors.white;
    final textColor = message.isMe ? Colors.white : AppColors.darkGray;

    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: message.isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            if (!message.isMe)
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 4),
                child: Text(
                  message.author,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.lightText,
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: message.isMe
                      ? const Radius.circular(18)
                      : Radius.zero,
                  bottomRight: message.isMe
                      ? Radius.zero
                      : const Radius.circular(18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                message.message,
                style: TextStyle(color: textColor, fontSize: 14, height: 1.4),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message.time,
              style: const TextStyle(fontSize: 11, color: AppColors.lightText),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _MessageInputField({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.softPink,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.borderPink, width: 1.5),
                ),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Type a message...',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: onSend,
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: AppColors.primaryRed,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessage {
  final String author;
  final String message;
  final String time;
  final bool isMe;

  const _ChatMessage({
    required this.author,
    required this.message,
    required this.time,
    required this.isMe,
  });
}
