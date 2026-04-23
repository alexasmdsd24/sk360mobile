import 'package:flutter/material.dart';

import '../ui/app_ui.dart';
import '../widgets/president_components.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
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
                          Icons.analytics_outlined,
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
                              'Analytics Dashboard',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Performance tracking and insights',
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
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.softPink,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderPink, width: 1),
                  ),
                  child: const Text(
                    'This Month',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkGray,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _MetricCard(
                      icon: '📊',
                      label: 'Total Reports',
                      value: '145',
                      change: '+12%',
                      changeColor: Colors.green,
                    ),
                    _MetricCard(
                      icon: '✅',
                      label: 'On-Time Rate',
                      value: '92%',
                      change: '+5%',
                      changeColor: Colors.green,
                    ),
                    _MetricCard(
                      icon: '👥',
                      label: 'Active Users',
                      value: '142',
                      change: '+8',
                      changeColor: Colors.green,
                    ),
                    _MetricCard(
                      icon: '📈',
                      label: 'Programs Done',
                      value: '38',
                      change: '+16',
                      changeColor: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
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
                        'Submission Trend (Last 7 Months)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderPink, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Chart: Submission Rate Over 7 Months\n[Jul, Aug, Sep, Oct, Nov, Dec, Jan]',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
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
                        'Barangay Performance Comparison',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _BarChart(
                        label: 'Brgy 1',
                        percentage: 95,
                        color: const Color(0xFFFFC107),
                      ),
                      const SizedBox(height: 12),
                      _BarChart(
                        label: 'Brgy 2',
                        percentage: 88,
                        color: const Color(0xFF2196F3),
                      ),
                      const SizedBox(height: 12),
                      _BarChart(
                        label: 'Brgy 3',
                        percentage: 98,
                        color: const Color(0xFFFFC107),
                      ),
                      const SizedBox(height: 12),
                      _BarChart(
                        label: 'Brgy 4',
                        percentage: 82,
                        color: const Color(0xFFFFC107),
                      ),
                      const SizedBox(height: 12),
                      _BarChart(
                        label: 'Brgy 5',
                        percentage: 90,
                        color: const Color(0xFFE0BEE7),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
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
                        'Engagement Breakdown',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _EngagementItem(
                        label: 'Report Submissions',
                        percentage: 35,
                        color: const Color(0xFFE91E63),
                      ),
                      _EngagementItem(
                        label: 'Event Participation',
                        percentage: 25,
                        color: const Color(0xFF9C27B0),
                      ),
                      _EngagementItem(
                        label: 'Meeting Attendance',
                        percentage: 25,
                        color: const Color(0xFFFFC107),
                      ),
                      _EngagementItem(
                        label: 'Program Completion',
                        percentage: 20,
                        color: const Color(0xFFE74C3C),
                      ),
                      _EngagementItem(
                        label: 'Chat Activity',
                        percentage: 12,
                        color: const Color(0xFF2196F3),
                      ),
                      _EngagementItem(
                        label: 'Other',
                        percentage: 8,
                        color: const Color(0xFF607D8B),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF9E6),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFFFE082), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Key Insights',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '• Overall performance improved by 5% this month compared to last month',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.darkGray,
                          height: 1.6,
                        ),
                      ),
                      Text(
                        '• Barangay 3 shows consistent top performance with 98% completion rate',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.darkGray,
                          height: 1.6,
                        ),
                      ),
                      Text(
                        '• Report submissions account for the highest engagement activity (35%)',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.darkGray,
                          height: 1.6,
                        ),
                      ),
                      Text(
                        '• Steady upward trend in submission rates over the past 7 months',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.darkGray,
                          height: 1.6,
                        ),
                      ),
                      Text(
                        '• Active user count increased by 8 users compared to previous period',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.darkGray,
                          height: 1.6,
                        ),
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

class _MetricCard extends StatelessWidget {
  final String icon;
  final String label;
  final String value;
  final String change;
  final Color changeColor;

  const _MetricCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.change,
    required this.changeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderPink, width: 0.5),
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
              Text(
                icon,
                style: const TextStyle(fontSize: 24),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: changeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  change,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: changeColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGray,
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
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  final String label;
  final int percentage;
  final Color color;

  const _BarChart({
    required this.label,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGray,
              ),
            ),
            Text(
              '$percentage%',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 8,
              width: (percentage / 100) * (MediaQuery.of(context).size.width - 80),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _EngagementItem extends StatelessWidget {
  final String label;
  final int percentage;
  final Color color;

  const _EngagementItem({
    required this.label,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.darkGray,
              ),
            ),
          ),
          Text(
            '$percentage%',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
