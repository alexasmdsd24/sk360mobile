import 'package:flutter/material.dart';

import '../ui/app_ui.dart';
import '../widgets/president_components.dart';

class LeadershipProfilesScreen extends StatefulWidget {
  const LeadershipProfilesScreen({super.key});

  @override
  State<LeadershipProfilesScreen> createState() => _LeadershipProfilesScreenState();
}

class _LeadershipProfilesScreenState extends State<LeadershipProfilesScreen> {
  bool _showLeadershipHistory = false;

  final List<_LeaderData> _leaders = [
    const _LeaderData(
      name: 'Juan Dela Cruz',
      position: 'SK Federation President',
      barangay: 'Barangay 1',
      email: 'jmb@mob.com',
      phone: '+63 912 345 6789',
      address: 'Barangay 1, Lipa City',
      termStart: 'January 2024',
      termEnd: 'December 2026',
      programs: 12,
      events: 24,
      reports: 18,
      achievements: [
        'Youth Leadership Training - 2024',
        'Community Service Award - 2025',
        '100% Report Submission Rate',
      ],
    ),
  ];

  final List<_LeadershipHistoryItem> _history = [
    const _LeadershipHistoryItem(
      name: 'Maria Santos',
      position: 'SK Chairman',
      barangay: 'Barangay 1',
      termStart: '2021',
      termEnd: '2023',
      achievements: '15 programs completed',
      transitionNotes: 'Smooth transition. All records transferred digitally.',
    ),
    const _LeadershipHistoryItem(
      name: 'Jose Reyes',
      position: 'SK Chairman',
      barangay: 'Barangay 1',
      termStart: '2018',
      termEnd: '2021',
      achievements: '10 programs completed',
      transitionNotes: 'Physical records archived.',
    ),
  ];

  final List<_AllSkLeader> _allLeaders = [
    const _AllSkLeader(
      name: 'SK Federation President',
      location: 'Lipa City',
      position: 'Federation President',
      status: 'Active',
    ),
    const _AllSkLeader(
      name: 'Juan Dela Cruz',
      location: 'Barangay 1',
      position: 'SK Chairman',
      status: 'Active',
    ),
    const _AllSkLeader(
      name: 'Maria Garcia',
      location: 'Barangay 2',
      position: 'SK Chairman',
      status: 'Active',
    ),
    const _AllSkLeader(
      name: 'Pedro Santos',
      location: 'Barangay 3',
      position: 'SK Chairman',
      status: 'Active',
    ),
    const _AllSkLeader(
      name: 'Ana Reyes',
      location: 'Barangay 1',
      position: 'SK Secretary',
      status: 'Active',
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
                          Icons.badge_outlined,
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
                              'Leadership Profiles',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Manage profiles and transitions',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: _leaders
                      .map((leader) => _LeadershipCard(leader: leader))
                      .toList(),
                ),
              ),
              const SizedBox(height: 24),
              // Leadership History Section
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Leadership History',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkGray,
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                setState(() => _showLeadershipHistory = !_showLeadershipHistory),
                            child: Text(
                              _showLeadershipHistory ? 'Hide' : 'Show',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1976D2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_showLeadershipHistory) ...[
                        const SizedBox(height: 16),
                        ..._history
                            .map((item) => _HistoryCard(item: item))
                            .toList(),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // All SK Leaders Section
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
                        'All SK Leaders',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ..._allLeaders
                          .map((leader) => _AllLeadersItem(leader: leader))
                          .toList(),
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

class _LeadershipCard extends StatefulWidget {
  final _LeaderData leader;

  const _LeadershipCard({required this.leader});

  @override
  State<_LeadershipCard> createState() => _LeadershipCardState();
}

class _LeadershipCardState extends State<_LeadershipCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryRed,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.person, color: Colors.white, size: 28),
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
                              widget.leader.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.edit, color: Colors.white, size: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.leader.position,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.leader.barangay,
                        style: const TextStyle(
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
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGray,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.email_outlined, color: Color(0xFF1976D2), size: 18),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.leader.email,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.darkGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.phone_outlined, color: Color(0xFF1976D2), size: 18),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.leader.phone,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.darkGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Color(0xFF1976D2), size: 18),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.leader.address,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.darkGray,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF9E6),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFFFE082), width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Term of Office',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGray,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Start Date',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.lightText,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  widget.leader.termStart,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkGray,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'End Date',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.lightText,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  widget.leader.termEnd,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkGray,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Performance Overview',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGray,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _StatBadge(value: widget.leader.programs.toString(), label: 'Programs'),
                      _StatBadge(value: widget.leader.events.toString(), label: 'Events'),
                      _StatBadge(value: widget.leader.reports.toString(), label: 'Reports'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Achievements',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGray,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...widget.leader.achievements
                      .map(
                        (achievement) => Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF9E6),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFFFE082), width: 1),
                          ),
                          child: Row(
                            children: [
                              const Text('🏆', style: TextStyle(fontSize: 18)),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  achievement,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.darkGray,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  top: _isExpanded
                      ? BorderSide(color: AppColors.borderPink, width: 0.5)
                      : BorderSide.none,
                ),
              ),
              child: Center(
                child: Text(
                  _isExpanded ? 'Show Less' : 'Show More',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String value;
  final String label;

  const _StatBadge({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1976D2),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.lightText,
          ),
        ),
      ],
    );
  }
}

class _LeaderData {
  final String name;
  final String position;
  final String barangay;
  final String email;
  final String phone;
  final String address;
  final String termStart;
  final String termEnd;
  final int programs;
  final int events;
  final int reports;
  final List<String> achievements;

  const _LeaderData({
    required this.name,
    required this.position,
    required this.barangay,
    required this.email,
    required this.phone,
    required this.address,
    required this.termStart,
    required this.termEnd,
    required this.programs,
    required this.events,
    required this.reports,
    required this.achievements,
  });
}

class _HistoryCard extends StatelessWidget {
  final _LeadershipHistoryItem item;

  const _HistoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF1976D2).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.person_outline, color: Color(0xFF1976D2), size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.position,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.lightText,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${item.termStart} - ${item.termEnd}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.lightText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.achievements,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.transitionNotes,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.lightText,
            ),
          ),
        ],
      ),
    );
  }
}

class _AllLeadersItem extends StatelessWidget {
  final _AllSkLeader leader;

  const _AllLeadersItem({required this.leader});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF1976D2).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.person_outline, color: Color(0xFF1976D2), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  leader.name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 12, color: AppColors.lightText),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        leader.location,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.lightText,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              leader.status,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1976D2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LeadershipHistoryItem {
  final String name;
  final String position;
  final String barangay;
  final String termStart;
  final String termEnd;
  final String achievements;
  final String transitionNotes;

  const _LeadershipHistoryItem({
    required this.name,
    required this.position,
    required this.barangay,
    required this.termStart,
    required this.termEnd,
    required this.achievements,
    required this.transitionNotes,
  });
}

class _AllSkLeader {
  final String name;
  final String location;
  final String position;
  final String status;

  const _AllSkLeader({
    required this.name,
    required this.location,
    required this.position,
    required this.status,
  });
}
