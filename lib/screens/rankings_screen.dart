import 'package:flutter/material.dart';

import '../ui/app_ui.dart';
import '../widgets/president_components.dart';

class RankingsScreen extends StatefulWidget {
  const RankingsScreen({super.key});

  @override
  State<RankingsScreen> createState() => _RankingsScreenState();
}

class _RankingsScreenState extends State<RankingsScreen> {
  String _selectedTab = 'Overall';

  final List<_LeaderboardItem> _leaderboard = [
    const _LeaderboardItem(
      rank: 1,
      barangay: 'Barangay 3',
      leader: 'Pedro Santos',
      score: 2450,
      engagement: 98,
      programs: 24,
      reportStreak: 9,
      icon: '🥇',
    ),
    const _LeaderboardItem(
      rank: 2,
      barangay: 'Barangay 1',
      leader: 'Juan Dela Cruz',
      score: 2380,
      engagement: 95,
      programs: 21,
      reportStreak: 5,
      icon: '🥈',
    ),
    const _LeaderboardItem(
      rank: 3,
      barangay: 'Barangay 5',
      leader: 'Ana Reyes',
      score: 2310,
      engagement: 90,
      programs: 19,
      reportStreak: 4,
      icon: '🥉',
    ),
    const _LeaderboardItem(
      rank: 4,
      barangay: 'Barangay 2',
      leader: 'Maria Garcia',
      score: 2240,
      engagement: 88,
      programs: 18,
      reportStreak: 2,
      icon: '4️⃣',
    ),
    const _LeaderboardItem(
      rank: 5,
      barangay: 'Barangay 4',
      leader: 'Jose Lopez',
      score: 2180,
      engagement: 85,
      programs: 16,
      reportStreak: 2,
      icon: '5️⃣',
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
                    color: AppColors.primaryRed,
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
                          Icons.emoji_events_outlined,
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
                              'Rankings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Gamified engagement system',
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
              const SizedBox(height: 20),
              // Your Current Rank
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Your Current Rank',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '#2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                'Total Score',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '2380',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD54F),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          margin: const EdgeInsets.only(right: 50),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Progress to rank #1',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            '70 pts',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: ['Overall', 'Reports', 'Engagement', 'Programs']
                      .map((tab) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedTab = tab),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: _selectedTab == tab
                                      ? AppColors.primaryRed
                                      : AppColors.softPink,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  tab,
                                  style: TextStyle(
                                    color: _selectedTab == tab
                                        ? Colors.white
                                        : AppColors.darkGray,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              // Leaderboard Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Overall Leaderboard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Leaderboard Items
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: _leaderboard
                      .map((item) => _LeaderboardCard(item: item))
                      .toList(),
                ),
              ),
              const SizedBox(height: 24),
              // Achievements & Badges
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Achievements & Badges',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _AchievementBadge(
                            icon: '✅',
                            title: 'Perfect Attendance',
                            subtitle: '100% meeting attendance',
                            unlocked: true,
                          ),
                          _AchievementBadge(
                            icon: '📊',
                            title: 'Report Master',
                            subtitle: 'Submit 24 consecutive reports',
                            unlocked: true,
                          ),
                          _AchievementBadge(
                            icon: '🚀',
                            title: 'Community Hero',
                            subtitle: 'Complete 20 programs',
                            unlocked: false,
                          ),
                          _AchievementBadge(
                            icon: '🔥',
                            title: 'Engagement Leader',
                            subtitle: '90% engagement rate',
                            unlocked: true,
                          ),
                          _AchievementBadge(
                            icon: '⭐',
                            title: 'Rising Star',
                            subtitle: 'Top 3 for 3 months',
                            unlocked: false,
                          ),
                          _AchievementBadge(
                            icon: '👑',
                            title: 'Federation Top',
                            subtitle: 'Rank #1 overall',
                            unlocked: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Points System
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'How to Earn Points',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _PointsRow(
                        activity: 'Quality Documentation',
                        points: '+75 pts',
                        backgroundColor: const Color(0xFFFFF9E6),
                      ),
                      _PointsRow(
                        activity: 'On-time Report Submission',
                        points: '+50 pts',
                        backgroundColor: const Color(0xFFFFF9E6),
                      ),
                      _PointsRow(
                        activity: 'Meeting Attendance',
                        points: '+30 pts',
                        backgroundColor: const Color(0xFFFFF9E6),
                      ),
                      _PointsRow(
                        activity: 'Community Engagement',
                        points: '+25 pts',
                        backgroundColor: const Color(0xFFFFF9E6),
                      ),
                      _PointsRow(
                        activity: 'Late submission',
                        points: '-20 pts',
                        backgroundColor: const Color(0xFFFFCDD2),
                      ),
                      _PointsRow(
                        activity: 'Missed Meeting',
                        points: '-30 pts',
                        backgroundColor: const Color(0xFFFFCDD2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeaderboardCard extends StatelessWidget {
  final _LeaderboardItem item;

  const _LeaderboardCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: item.rank == 2
            ? const Color(0xFFE8F5E9)
            : Colors.white,
        border: Border.all(
          color: item.rank == 2
              ? const Color(0xFF4CAF50)
              : AppColors.borderPink,
          width: item.rank == 2 ? 2 : 0.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                item.icon,
                style: const TextStyle(fontSize: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.barangay,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                    Text(
                      item.leader,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.lightText,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                item.score.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGray,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatBadge2(label: '${item.engagement}% engagement'),
              _StatBadge2(label: '${item.programs} programs'),
              _StatBadge2(label: '${item.reportStreak} month streak'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatBadge2 extends StatelessWidget {
  final String label;

  const _StatBadge2({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.softPink,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          color: AppColors.darkGray,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final bool unlocked;

  const _AchievementBadge({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.unlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: unlocked ? 1.0 : 0.5,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF9E6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFFE082), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGray,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 9,
                color: AppColors.lightText,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: unlocked ? const Color(0xFF4CAF50) : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                unlocked ? 'Unlocked ✓' : 'Locked',
                style: const TextStyle(
                  fontSize: 9,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PointsRow extends StatelessWidget {
  final String activity;
  final String points;
  final Color backgroundColor;

  const _PointsRow({
    required this.activity,
    required this.points,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            activity,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.darkGray,
            ),
          ),
          Text(
            points,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: points.contains('+') ? Colors.green : AppColors.primaryRed,
            ),
          ),
        ],
      ),
    );
  }
}

class _LeaderboardItem {
  final int rank;
  final String barangay;
  final String leader;
  final int score;
  final int engagement;
  final int programs;
  final int reportStreak;
  final String icon;

  const _LeaderboardItem({
    required this.rank,
    required this.barangay,
    required this.leader,
    required this.score,
    required this.engagement,
    required this.programs,
    required this.reportStreak,
    required this.icon,
  });
}
