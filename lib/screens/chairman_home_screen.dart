import 'package:flutter/material.dart';

import '../ui/app_ui.dart';
import '../widgets/president_components.dart';

class ChairmanHomeScreen extends StatefulWidget {
  const ChairmanHomeScreen({super.key});

  @override
  State<ChairmanHomeScreen> createState() => _ChairmanHomeScreenState();
}

class _ChairmanHomeScreenState extends State<ChairmanHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrayBg,
      drawer: const PresidentSideDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              PresidentHeader(
                leading: PresidentHeaderLeading.menu,
                onLeadingTap: () => Scaffold.of(context).openDrawer(),
                title: 'SK 360°',
                subtitle: 'Barangay 1',
              ),
              const SizedBox(height: 20),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.borderPink),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search posts, announcements...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: AppColors.lightText),
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          const Icon(Icons.notifications, color: Colors.white, size: 20),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFC107),
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // KPIs Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryRed,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.trending_up, color: Colors.white, size: 20),
                                const SizedBox(width: 8),
                                const Text(
                                  'Engagement',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '85%',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '+12%',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4CAF50),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1976D2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.people, color: Colors.white, size: 20),
                                const SizedBox(width: 8),
                                const Text(
                                  'Active Users',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '142',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'online',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Budget Utilization Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_balance_wallet, color: AppColors.primaryRed),
                              const SizedBox(width: 8),
                              const Text(
                                'Budget Utilization',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkGray,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF9E6),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'FY 2026',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF9F00),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '63%',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryRed,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Utilized',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.lightText,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: AppColors.borderPink,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 8,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppColors.borderPink,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      Container(
                                        height: 8,
                                        width: double.infinity * 0.63,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryRed,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryRed,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Used',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.lightText,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '₱312,500',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkGray,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE0E0E0),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Remaining',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.lightText,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '₱187,500',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkGray,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Allocation',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.lightText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '₱500,000',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkGray,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: _BudgetCategory(
                                    label: 'Programs & Activities',
                                    percentage: '40%',
                                    color: AppColors.primaryRed,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _BudgetCategory(
                                    label: 'Equipment & Supplies',
                                    percentage: '25%',
                                    color: const Color(0xFF1976D2),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _BudgetCategory(
                                    label: 'Administrative',
                                    percentage: '15%',
                                    color: const Color(0xFFFF9F00),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _BudgetCategory(
                                    label: 'Training & Dev',
                                    percentage: '12%',
                                    color: const Color(0xFF4CAF50),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Upcoming Meetings & Quick Actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Upcoming Meetings',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGray,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View All',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF1976D2),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _MeetingCard(
                            month: 'JAN',
                            day: '29',
                            title: 'Federation Monthly Meeting',
                            time: '10:00 AM • Virtual Meeting',
                            borderColor: AppColors.primaryRed,
                          ),
                          const Divider(height: 12),
                          _MeetingCard(
                            month: 'FEB',
                            day: '01',
                            title: 'Reports Submission Deadline',
                            time: 'All day • System deadline',
                            borderColor: const Color(0xFF1976D2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Quick Actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        _QuickActionCard(
                          icon: Icons.assignment,
                          title: 'Submit Report',
                          color: AppColors.borderPink,
                          onTap: () {},
                        ),
                        _QuickActionCard(
                          icon: Icons.video_call,
                          title: 'Join Meeting',
                          color: const Color(0xFFE3F2FD),
                          onTap: () {},
                        ),
                        _QuickActionCard(
                          icon: Icons.trending_up,
                          title: 'View Rankings',
                          color: const Color(0xFFFFF9E6),
                          onTap: () {},
                        ),
                        _QuickActionCard(
                          icon: Icons.analytics,
                          title: 'Analytics',
                          color: const Color(0xFFE8F5E9),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Announcements Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFC107),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'All',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _TabButton(label: 'Announcements', isActive: true),
                                _TabButton(label: 'Accomplishments', isActive: false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _AnnouncementCard(
                      avatar: Icons.person,
                      name: 'SK Federation President',
                      badge: 'Announcement',
                      badgeColor: AppColors.primaryRed,
                      message:
                          'Reminder: Monthly accomplishment reports are due this Friday, January 31. Please ensure all submissions are complete and uploaded to the system.',
                      likes: 24,
                      comments: 5,
                      timeAgo: '2 hours ago',
                    ),
                    const SizedBox(height: 12),
                    _AnnouncementCard(
                      avatar: Icons.person,
                      name: 'SK Chairman - Barangay 5',
                      badge: 'Accomplishment',
                      badgeColor: const Color(0xFFFFC107),
                      message:
                          'Successfully completed the "Youth Leadership Training Program" with 45 participants. Full report submitted. 🎉',
                      likes: 38,
                      comments: 12,
                      timeAgo: '5 hours ago',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PresidentBottomNavBar(
        activeItem: PresidentNavItem.home,
        onItemSelected: (item) {
          // Handle navigation
        },
      ),
    );
  }
}

class _BudgetCategory extends StatelessWidget {
  final String label;
  final String percentage;
  final Color color;

  const _BudgetCategory({
    required this.label,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 9,
            color: AppColors.lightText,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          percentage,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: AppColors.darkGray,
          ),
        ),
      ],
    );
  }
}

class _MeetingCard extends StatelessWidget {
  final String month;
  final String day;
  final String title;
  final String time;
  final Color borderColor;

  const _MeetingCard({
    required this.month,
    required this.day,
    required this.title,
    required this.time,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: borderColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Column(
            children: [
              Text(
                month,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: borderColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                day,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: borderColor,
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
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.lightText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primaryRed, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isActive;

  const _TabButton({required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.white : Colors.white70,
        ),
      ),
    );
  }
}

class _AnnouncementCard extends StatelessWidget {
  final IconData avatar;
  final String name;
  final String badge;
  final Color badgeColor;
  final String message;
  final int likes;
  final int comments;
  final String timeAgo;

  const _AnnouncementCard({
    required this.avatar,
    required this.name,
    required this.badge,
    required this.badgeColor,
    required this.message,
    required this.likes,
    required this.comments,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: badgeColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(avatar, color: badgeColor, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      timeAgo,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.lightText,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.darkGray,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.thumb_up_outlined, size: 16, color: AppColors.lightText),
              const SizedBox(width: 4),
              Text(
                likes.toString(),
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.lightText,
                ),
              ),
              const SizedBox(width: 12),
              Icon(Icons.chat_bubble_outline, size: 16, color: AppColors.lightText),
              const SizedBox(width: 4),
              Text(
                comments.toString(),
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.lightText,
                ),
              ),
              const Spacer(),
              Icon(Icons.share, size: 16, color: AppColors.lightText),
            ],
          ),
        ],
      ),
    );
  }
}
