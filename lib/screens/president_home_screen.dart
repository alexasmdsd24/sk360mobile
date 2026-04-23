import 'package:flutter/material.dart';

import '../routes.dart';
import '../ui/app_ui.dart';
import '../widgets/president_components.dart';

class PresidentHomeScreen extends StatefulWidget {
  const PresidentHomeScreen({super.key});

  @override
  State<PresidentHomeScreen> createState() => _PresidentHomeScreenState();
}

class _PresidentHomeScreenState extends State<PresidentHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> _feedTabs = const [
    'All',
    'Announcements',
    'Accomplishments',
    'Events',
  ];
  final List<_PostData> _posts = const [
    _PostData(
      title: 'SK Federation President',
      subtitle: '2 hours ago',
      tag: 'Announcement',
      content:
          'Reminder: Monthly accomplishment reports are due this Friday, January 31. Please ensure all submissions are complete and uploaded to the system.',
      likes: 24,
      comments: 5,
    ),
    _PostData(
      title: 'SK Chairman - Barangay 5',
      subtitle: '5 hours ago',
      tag: 'Accomplishment',
      content:
          'Successfully completed the "Youth Leadership Training Program" with 45 participants. Full report submitted. 🎉',
      likes: 38,
      comments: 12,
    ),
    _PostData(
      title: 'SK Secretary - Barangay 2',
      subtitle: '1 day ago',
      tag: 'Event',
      content:
          'Upcoming: Community Clean-up Drive on February 5, 2026. All SK members are encouraged to participate. RSVP through the calendar.',
      likes: 19,
      comments: 8,
    ),
    _PostData(
      title: 'System Admin',
      subtitle: '2 days ago',
      tag: 'Ranking',
      content:
          "Congratulations to Barangay 3 for topping this month's engagement rankings! Keep up the excellent work in youth governance. 🏆",
      likes: 52,
      comments: 15,
    ),
  ];

  PresidentNavItem _activeNav = PresidentNavItem.home;
  int _activeFeedTab = 0;

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
                child: _buildSearchRow(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: const [
                    Expanded(
                      child: _StatCard(
                        title: 'Engagement',
                        value: '85%',
                        caption: '+12%',
                        gradientColors: [Color(0xFFE63946), Color(0xFFB4202F)],
                        icon: Icons.trending_up,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _StatCard(
                        title: 'Active Users',
                        value: '142',
                        caption: 'online',
                        gradientColors: [Color(0xFF1D8FE1), Color(0xFF0054A6)],
                        icon: Icons.people_alt_outlined,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _UpcomingMeetingsCard(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _QuickActionsGrid(),
              ),
              const SizedBox(height: 24),
              _FeedSection(
                tabs: _feedTabs,
                posts: _posts,
                activeTab: _activeFeedTab,
                onTabSelected: (index) {
                  setState(() {
                    _activeFeedTab = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
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
        Navigator.pushReplacementNamed(context, AppRoutes.presidentMessages);
        break;
      case PresidentNavItem.profile:
        Navigator.pushReplacementNamed(context, AppRoutes.profile);
        break;
    }
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
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
              children: const [
                Icon(Icons.search, color: AppColors.lightText),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Search posts, announcements...',
                    style: TextStyle(color: AppColors.lightText, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.notifications_outlined,
                color: AppColors.darkGray,
              ),
            ),
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFC107),
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: AppColors.darkGray,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String caption;
  final List<Color> gradientColors;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.caption,
    required this.gradientColors,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradientColors),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withOpacity(0.35),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.9)),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            caption,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _UpcomingMeetingsCard extends StatelessWidget {
  const _UpcomingMeetingsCard();

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
        children: const [
          _SectionHeader(title: 'Upcoming Meetings', actionLabel: 'View All'),
          SizedBox(height: 16),
          _MeetingItem(
            month: 'JAN',
            day: '29',
            title: 'Federation Monthly Meeting',
            subtitle: '10:00 AM · Virtual Meeting',
          ),
          SizedBox(height: 12),
          _MeetingItem(
            month: 'FEB',
            day: '01',
            title: 'Reports Submission Deadline',
            subtitle: 'All day · System deadline',
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionLabel;

  const _SectionHeader({required this.title, required this.actionLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.darkGray,
          ),
        ),
        const Spacer(),
        Text(
          actionLabel,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.primaryRed,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _MeetingItem extends StatelessWidget {
  final String month;
  final String day;
  final String title;
  final String subtitle;

  const _MeetingItem({
    required this.month,
    required this.day,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softPink,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderPink, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  month,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryRed,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGray,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.lightText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionsGrid extends StatelessWidget {
  const _QuickActionsGrid();

  static final List<_QuickAction> _actions = [
    _QuickAction('Submit Report', Icons.upload_file, Color(0xFFFFE5E9)),
    _QuickAction('Join Meeting', Icons.video_call, Color(0xFFE3F2FD)),
    _QuickAction('View Rankings', Icons.emoji_events, Color(0xFFFFF4E5)),
    _QuickAction('Analytics', Icons.analytics_outlined, Color(0xFFEAF7F0)),
  ];

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
            'Quick Actions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            physics: const NeverScrollableScrollPhysics(),
            children: _actions
                .map(
                  (action) => GestureDetector(
                    onTap: () => _handleActionTap(context, action.label),
                    child: Container(
                      decoration: BoxDecoration(
                        color: action.backgroundColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(action.icon, color: AppColors.primaryRed),
                          ),
                          const Spacer(),
                          Text(
                            action.label,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  void _handleActionTap(BuildContext context, String actionLabel) {
    switch (actionLabel) {
      case 'Join Meeting':
        Navigator.pushNamed(context, AppRoutes.videoMeeting);
        break;
      case 'Submit Report':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Report submission coming soon'),
            backgroundColor: AppColors.primaryRed,
          ),
        );
        break;
      case 'View Rankings':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Rankings view coming soon'),
            backgroundColor: AppColors.primaryRed,
          ),
        );
        break;
      case 'Analytics':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Analytics coming soon'),
            backgroundColor: AppColors.primaryRed,
          ),
        );
        break;
    }
  }
}

class _QuickAction {
  final String label;
  final IconData icon;
  final Color backgroundColor;

  const _QuickAction(this.label, this.icon, this.backgroundColor);
}

class _FeedSection extends StatelessWidget {
  final List<String> tabs;
  final int activeTab;
  final ValueChanged<int> onTabSelected;
  final List<_PostData> posts;

  const _FeedSection({
    required this.tabs,
    required this.activeTab,
    required this.onTabSelected,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: List.generate(tabs.length, (index) {
                final bool isActive = index == activeTab;
                return GestureDetector(
                  onTap: () => onTabSelected(index),
                  child: Container(
                    margin: EdgeInsets.only(
                      right: index == tabs.length - 1 ? 0 : 12,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.primaryRed
                          : AppColors.softPink,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: isActive ? Colors.white : AppColors.darkGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),
          ...posts.map(
            (post) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: _FeedPostCard(post: post),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeedPostCard extends StatelessWidget {
  final _PostData post;

  const _FeedPostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.softPink,
                child: Text(
                  post.title.substring(0, 2).toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.primaryRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      post.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.lightText,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.softPink,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  post.tag,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryRed,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            post.content,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.darkGray,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.thumb_up_alt_outlined,
                size: 18,
                color: AppColors.lightText,
              ),
              const SizedBox(width: 6),
              Text(
                '${post.likes}',
                style: const TextStyle(
                  color: AppColors.lightText,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(
                Icons.mode_comment_outlined,
                size: 18,
                color: AppColors.lightText,
              ),
              const SizedBox(width: 6),
              Text(
                '${post.comments}',
                style: const TextStyle(
                  color: AppColors.lightText,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(Icons.share_outlined, color: AppColors.lightText),
            ],
          ),
        ],
      ),
    );
  }
}

class _PostData {
  final String title;
  final String subtitle;
  final String tag;
  final String content;
  final int likes;
  final int comments;

  const _PostData({
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.content,
    required this.likes,
    required this.comments,
  });
}
