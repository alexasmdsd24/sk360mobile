import 'package:flutter/material.dart';

import '../ui/app_ui.dart';

enum PresidentNavItem { home, calendar, chat, profile }

enum PresidentHeaderLeading { menu, back, none }

class PresidentHeader extends StatelessWidget {
  final PresidentHeaderLeading leading;
  final VoidCallback? onLeadingTap;
  final String title;
  final String subtitle;
  final List<Widget>? trailing;
  final Widget? customContent;

  const PresidentHeader({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.onLeadingTap,
    this.trailing,
    this.customContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 18),
      decoration: const BoxDecoration(
        color: AppColors.primaryRed,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leading != PresidentHeaderLeading.none)
            IconButton(
              onPressed: onLeadingTap,
              icon: Icon(
                leading == PresidentHeaderLeading.menu
                    ? Icons.menu_rounded
                    : Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            )
          else
            const SizedBox(width: 48),
          Expanded(
            child: customContent ?? _buildDefaultCenter(),
          ),
          if (trailing != null && trailing!.isNotEmpty)
            Row(children: trailing!)
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildDefaultCenter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

class PresidentBottomNavBar extends StatelessWidget {
  final PresidentNavItem activeItem;
  final ValueChanged<PresidentNavItem> onItemSelected;

  const PresidentBottomNavBar({
    super.key,
    required this.activeItem,
    required this.onItemSelected,
  });

  static const List<_BottomItem> _items = [
    _BottomItem(PresidentNavItem.home, 'Home', Icons.home_outlined),
    _BottomItem(PresidentNavItem.calendar, 'Calendar', Icons.event_note),
    _BottomItem(PresidentNavItem.chat, 'Chat', Icons.chat_bubble_outline),
    _BottomItem(PresidentNavItem.profile, 'Profile', Icons.person_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.primaryRed,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _items.map((item) {
          final bool isActive = item.item == activeItem;
          return GestureDetector(
            onTap: () => onItemSelected(item.item),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  color: isActive ? const Color(0xFFFFD54F) : Colors.white70,
                ),
                const SizedBox(height: 6),
                Text(
                  item.label,
                  style: TextStyle(
                    color: isActive ? const Color(0xFFFFD54F) : Colors.white70,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _BottomItem {
  final PresidentNavItem item;
  final String label;
  final IconData icon;

  const _BottomItem(this.item, this.label, this.icon);
}

class PresidentSideDrawer extends StatelessWidget {
  const PresidentSideDrawer({super.key});

  static final List<_DrawerItem> _menuItems = [
    _DrawerItem('View Reports', Icons.receipt_long),
    _DrawerItem('Announcements', Icons.campaign_outlined),
    _DrawerItem('Leadership Profiles', Icons.badge_outlined),
    _DrawerItem('Video Meetings', Icons.video_call),
    _DrawerItem('Rankings', Icons.emoji_events_outlined),
    _DrawerItem('Analytics', Icons.analytics_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.primaryRed,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SK 360°',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'SK Federation President',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 32),
                ..._menuItems.map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () => _handleMenuItemTap(context, item.label),
                      child: Row(
                        children: [
                          Icon(item.icon, color: Colors.white, size: 22),
                          const SizedBox(width: 16),
                          Text(
                            item.label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  'Empowering Youth Governance',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuItemTap(BuildContext context, String itemLabel) {
    // Close drawer first
    Navigator.pop(context);
    
    switch (itemLabel) {
      case 'Video Meetings':
        Navigator.pushNamed(context, '/video-meeting');
        break;
      case 'View Reports':
        Navigator.pushNamed(context, '/reports');
        break;
      case 'Announcements':
        Navigator.pushNamed(context, '/announcements');
        break;
      case 'Leadership Profiles':
        Navigator.pushNamed(context, '/leadership-profiles');
        break;
      case 'Rankings':
        Navigator.pushNamed(context, '/rankings');
        break;
      case 'Analytics':
        Navigator.pushNamed(context, '/analytics');
        break;
    }
  }
}

class _DrawerItem {
  final String label;
  final IconData icon;

  const _DrawerItem(this.label, this.icon);
}
