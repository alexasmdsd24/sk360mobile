import 'package:flutter/material.dart';

import '../routes.dart';
import '../ui/app_ui.dart';
import '../widgets/president_components.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PresidentNavItem _activeNav = PresidentNavItem.chat;

  final List<_ChatListItemData> _chats = const [
    _ChatListItemData(
      name: 'Federation General',
      preview: 'Meeting reminder for tomorrow',
      members: 48,
      time: '5 min ago',
      unread: 3,
      isActive: true,
    ),
    _ChatListItemData(
      name: 'SK Chairman',
      preview: 'Budget documents uploaded',
      members: 15,
      time: '1 hour ago',
    ),
    _ChatListItemData(
      name: 'SK Secretary',
      preview: 'Report submission complete',
      members: 15,
      time: '3 hours ago',
      unread: 1,
    ),
    _ChatListItemData(
      name: 'SK Federation President',
      preview: 'Thanks for the update',
      members: 8,
      time: '1 day ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const PresidentSideDrawer(),
      backgroundColor: AppColors.lightGrayBg,
      bottomNavigationBar: PresidentBottomNavBar(
        activeItem: _activeNav,
        onItemSelected: _handleNavSelection,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PresidentHeader(
                leading: PresidentHeaderLeading.menu,
                onLeadingTap: () => _scaffoldKey.currentState?.openDrawer(),
                title: 'SK 360°',
                subtitle: 'Barangay 1',
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _MessagesBanner(),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _SearchField(
                  hint: 'Search conversations...',
                  icon: Icons.search,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppButton(
                  label: '+ Start New Chat',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('New chat composer coming soon!'),
                        backgroundColor: AppColors.primaryRed,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _ChatRoomsCard(
                  chats: _chats,
                  onChatTap: _openConversation,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openConversation(_ChatListItemData chat) {
    Navigator.pushNamed(context, AppRoutes.chatConversation);
  }

  void _handleNavSelection(PresidentNavItem item) {
    if (item == _activeNav) return;
    switch (item) {
      case PresidentNavItem.home:
        Navigator.pushReplacementNamed(context, AppRoutes.presidentHome);
        break;
      case PresidentNavItem.calendar:
        Navigator.pushReplacementNamed(context, AppRoutes.presidentCalendar);
        break;
      case PresidentNavItem.chat:
        break;
      case PresidentNavItem.profile:
        Navigator.pushReplacementNamed(context, AppRoutes.profile);
        break;
    }
  }
}

class _MessagesBanner extends StatelessWidget {
  const _MessagesBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [Color(0xFFE63946), Color(0xFFB4202F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE63946).withOpacity(0.4),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Messages',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Real-time communication',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  final String hint;
  final IconData icon;

  const _SearchField({
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.lightText),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              hint,
              style: const TextStyle(
                color: AppColors.lightText,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatRoomsCard extends StatelessWidget {
  final List<_ChatListItemData> chats;
  final ValueChanged<_ChatListItemData> onChatTap;

  const _ChatRoomsCard({
    required this.chats,
    required this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chat Rooms',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 16),
          ...chats.map(
            (chat) => Column(
              children: [
                GestureDetector(
                  onTap: () => onChatTap(chat),
                  child: _ChatListTile(chat: chat),
                ),
                if (chat != chats.last) const Divider(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatListTile extends StatelessWidget {
  final _ChatListItemData chat;

  const _ChatListTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.softPink,
              child: Text(
                chat.initials,
                style: const TextStyle(
                  color: AppColors.primaryRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (chat.isActive)
              Positioned(
                right: 4,
                bottom: 4,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      chat.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                  ),
                  Text(
                    chat.time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.lightText,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                chat.preview,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.lightText,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    '${chat.members} members',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.lightText,
                    ),
                  ),
                  const Spacer(),
                  if (chat.unread > 0)
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${chat.unread}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChatListItemData {
  final String name;
  final String preview;
  final int members;
  final String time;
  final int unread;
  final bool isActive;

  const _ChatListItemData({
    required this.name,
    required this.preview,
    required this.members,
    required this.time,
    this.unread = 0,
    this.isActive = false,
  });

  String get initials {
    final parts = name.split(' ');
    if (parts.length == 1) return name.substring(0, 1).toUpperCase();
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }
}
