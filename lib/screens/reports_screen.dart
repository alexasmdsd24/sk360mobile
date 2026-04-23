import 'package:flutter/material.dart';

import '../ui/app_ui.dart';
import '../widgets/president_components.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final List<_ReportData> _reports = [
    const _ReportData(
      rank: 1,
      barangay: 'Barangay 1',
      month: 'January 2026 · Monthly',
      submissionRate: 100,
      status: 'submitted',
      views: 234,
    ),
    const _ReportData(
      rank: 2,
      barangay: 'Barangay 2',
      month: 'January 2026 · Monthly',
      submissionRate: 0,
      status: 'pending',
      views: 0,
    ),
    const _ReportData(
      rank: 3,
      barangay: 'Barangay 3',
      month: 'January 2026 · Monthly',
      submissionRate: 100,
      status: 'submitted',
      views: 198,
    ),
    const _ReportData(
      rank: 4,
      barangay: 'Barangay 4',
      month: 'Q4 2025 · Quarterly',
      submissionRate: 100,
      status: 'submitted',
      views: 156,
    ),
    const _ReportData(
      rank: 5,
      barangay: 'Barangay 5',
      month: 'January 2026 · Monthly',
      submissionRate: 100,
      status: 'submitted',
      views: 142,
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
                          Icons.receipt_long,
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
                              'Report Compilation',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'View and analyze submitted reports',
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
              // Key Metrics
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _MetricBoxSmall(
                      icon: '📊',
                      value: '145',
                      label: 'Total Reports',
                    ),
                    _MetricBoxSmall(
                      icon: '✅',
                      value: '92%',
                      label: 'On-Time Rate',
                    ),
                    _MetricBoxSmall(
                      icon: '⏱️',
                      value: '3.2 days',
                      label: 'Avg. Time',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Filters
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Filters',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.softPink,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.borderPink,
                                width: 1,
                              ),
                            ),
                            child: const Text(
                              'Period',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.darkGray,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.softPink,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.borderPink,
                                width: 1,
                              ),
                            ),
                            child: const Text(
                              'Type',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.darkGray,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Submission Rankings
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Submission Rankings',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Updated daily',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.lightText,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ..._reports.map((report) => _ReportCard(report: report)).toList(),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Analytics Insights
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
                        'Analytics Insights',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '• 80% of barangays have submitted January reports',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.darkGray,
                          height: 1.6,
                        ),
                      ),
                      Text(
                        '• Submission rate improved by 15% from last month',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.darkGray,
                          height: 1.6,
                        ),
                      ),
                      Text(
                        '• Barangay 1 maintains top ranking for 3 consecutive months',
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

class _ReportCard extends StatelessWidget {
  final _ReportData report;

  const _ReportCard({required this.report});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: report.status == 'submitted'
              ? const Color(0xFFC8E6C9)
              : const Color(0xFFFFCDD2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: report.status == 'submitted'
                      ? const Color(0xFFE8F5E9)
                      : const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    report.rank.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: report.status == 'submitted'
                          ? const Color(0xFF2E7D32)
                          : AppColors.primaryRed,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report.barangay,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      report.month,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.lightText,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: report.status == 'submitted'
                      ? const Color(0xFFC8E6C9)
                      : const Color(0xFFFFCDD2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  report.status == 'submitted' ? 'Submitted' : 'Pending',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: report.status == 'submitted'
                        ? const Color(0xFF2E7D32)
                        : AppColors.primaryRed,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Submission Rate',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.lightText,
                      ),
                    ),
                    Text(
                      '${report.submissionRate}%',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: report.submissionRate > 0
                          ? const Color(0xFFFFC107)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    margin: EdgeInsets.only(
                      right: (100 - report.submissionRate) * 0.01 * 300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Opening report details...'),
                        backgroundColor: AppColors.primaryRed,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2196F3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.visibility_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'View',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2196F3),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Downloading report...'),
                        backgroundColor: AppColors.primaryRed,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.darkGray,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.download_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Download',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricBoxSmall extends StatelessWidget {
  final String icon;
  final String value;
  final String label;

  const _MetricBoxSmall({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderPink, width: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.lightText,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReportData {
  final int rank;
  final String barangay;
  final String month;
  final int submissionRate;
  final String status;
  final int views;

  const _ReportData({
    required this.rank,
    required this.barangay,
    required this.month,
    required this.submissionRate,
    required this.status,
    required this.views,
  });
}
