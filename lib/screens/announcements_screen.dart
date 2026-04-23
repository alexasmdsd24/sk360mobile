import 'package:flutter/material.dart';

import '../ui/app_ui.dart';
import '../widgets/president_components.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  final List<_AnnouncementData> _announcements = [
    const _AnnouncementData(
      id: 1,
      author: 'SK Federation President',
      subtitle: 'Federation · 2 hours ago',
      title: 'URGENT: Monthly Accomplishment Reports Due',
      content:
          'URGENT: Monthly accomplishment reports are due this Friday, January 31. Late submissions will be flagged in the system.',
      category: 'Deadlines',
      views: 156,
      isPinned: true,
      isPriority: true,
    ),
    const _AnnouncementData(
      id: 2,
      author: 'SK Chairman - Barangay 1',
      subtitle: 'SK Chairman · 5 hours ago',
      title: 'Youth Leadership Summit Registration Open',
      content:
          'Inviting all SK members to the Youth Leadership Summit on February 10, 2026. Registration is now open through the calendar module.',
      category: 'Events',
      views: 98,
      isPinned: false,
      isPriority: false,
    ),
    const _AnnouncementData(
      id: 3,
      author: 'System Admin',
      subtitle: 'Admin · 1 day ago',
      title: 'System Maintenance Notice',
      content:
          'System maintenance scheduled for February 1, 2026, 2:00 AM - 4:00 AM. The platform will be temporarily unavailable.',
      category: 'System',
      views: 203,
      isPinned: false,
      isPriority: false,
    ),
    const _AnnouncementData(
      id: 4,
      author: 'SK Federation President',
      subtitle: 'Federation · 2 days ago',
      title: 'Congratulations on Outstanding Performance',
      content:
          'Congratulations to all SK officers for achieving 92% on-time submission rate last month! Let\'s maintain this momentum.',
      category: 'General',
      views: 178,
      isPinned: false,
      isPriority: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrayBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PresidentHeader(
                leading: PresidentHeaderLeading.menu,
                onLeadingTap: () => Scaffold.of(context).openDrawer(),
                title: 'SK 360°',
                subtitle: 'Barangay 1',
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC107),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.campaign_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Announcements',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Official communications and updates',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => _showCreateAnnouncementDialog(context),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Create Announcement',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_announcements.any((a) => a.isPinned))
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.push_pin, color: Color(0xFFFFC107), size: 18),
                              SizedBox(width: 6),
                              Text(
                                'PINNED',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFC107),
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ..._announcements
                              .where((a) => a.isPinned)
                              .map((announcement) =>
                                  _AnnouncementCard(announcement: announcement))
                              .toList(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ..._announcements
                        .where((a) => !a.isPinned)
                        .map((announcement) =>
                            _AnnouncementCard(announcement: announcement))
                        .toList(),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  void _showCreateAnnouncementDialog(BuildContext context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    String selectedPriority = 'Normal';
    String selectedVisibility = 'Public';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Announcement'),
        content: SingleChildScrollView(
          child: StatefulBuilder(
            builder: (context, setState) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Enter announcement title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.borderPink),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Content',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: contentController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Write your announcement here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.borderPink),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Priority',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: selectedPriority,
                            items: ['Normal', 'High', 'Urgent']
                                .map((p) => DropdownMenuItem(
                                      value: p,
                                      child: Text(p),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selectedPriority = value ?? 'Normal');
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: AppColors.borderPink),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Visibility',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: selectedVisibility,
                            items: ['Public', 'Private', 'Groups']
                                .map((v) => DropdownMenuItem(
                                      value: v,
                                      child: Text(v),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() => selectedVisibility = value ?? 'Public');
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: AppColors.borderPink),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Announcement created successfully'),
                    backgroundColor: AppColors.primaryRed,
                  ),
                );
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Post',
              style: TextStyle(color: AppColors.primaryRed),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnnouncementCard extends StatelessWidget {
  final _AnnouncementData announcement;

  const _AnnouncementCard({required this.announcement});

  Color _getCategoryColor() {
    switch (announcement.category) {
      case 'Deadlines':
        return const Color(0xFFFFCDD2);
      case 'Events':
        return const Color(0xFFE1F5FE);
      case 'System':
        return const Color(0xFFF3E5F5);
      default:
        return const Color(0xFFFFF9C4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: announcement.isPinned
            ? Border.all(color: const Color(0xFFFFC107), width: 2)
            : Border.all(color: AppColors.borderPink, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.borderPink, width: 1),
                ),
                child: const Icon(
                  Icons.person,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      announcement.author,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      announcement.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.lightText,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getCategoryColor(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  announcement.category,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkGray,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (announcement.isPriority)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.softPink,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderPink, width: 1),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_rounded, color: AppColors.primaryRed, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      announcement.content,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.darkGray,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            Text(
              announcement.content,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.darkGray,
                height: 1.5,
              ),
            ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.visibility_outlined, size: 16, color: AppColors.lightText),
                  const SizedBox(width: 4),
                  Text(
                    '${announcement.views} views',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.lightText,
                    ),
                  ),
                ],
              ),
              Text(
                'View Details',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF1976D2),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnnouncementData {
  final int id;
  final String author;
  final String subtitle;
  final String title;
  final String content;
  final String category;
  final int views;
  final bool isPinned;
  final bool isPriority;

  const _AnnouncementData({
    required this.id,
    required this.author,
    required this.subtitle,
    required this.title,
    required this.content,
    required this.category,
    required this.views,
    required this.isPinned,
    required this.isPriority,
  });
}
