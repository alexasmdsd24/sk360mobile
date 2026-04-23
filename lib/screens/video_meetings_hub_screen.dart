import 'package:flutter/material.dart';

import '../routes.dart';
import '../ui/app_ui.dart';
import '../widgets/president_components.dart';

class VideoMeetingsHubScreen extends StatefulWidget {
  const VideoMeetingsHubScreen({super.key});

  @override
  State<VideoMeetingsHubScreen> createState() => _VideoMeetingsHubScreenState();
}

class _VideoMeetingsHubScreenState extends State<VideoMeetingsHubScreen> {
  final TextEditingController _meetingCodeController = TextEditingController();
  
  final List<_UpcomingMeeting> _meetings = [
    const _UpcomingMeeting(
      title: 'Federation Monthly Meeting',
      time: 'Today, 10:00 AM',
      duration: '1 hour',
      host: 'SK Federation President',
      participants: 24,
      meetingCode: 'FED-2026-001',
    ),
    const _UpcomingMeeting(
      title: 'Budget Review Session',
      time: 'Tomorrow, 2:00 PM',
      duration: '45 minutes',
      host: 'SK Chairman - Brgy 1',
      participants: 8,
      meetingCode: 'BRY1-2026-002',
    ),
    const _UpcomingMeeting(
      title: 'Youth Leadership Planning',
      time: 'Feb 1, 3:00 PM',
      duration: '2 hours',
      host: 'SK Federation President',
      participants: 15,
      meetingCode: 'YLP-2026-003',
    ),
  ];

  @override
  void dispose() {
    _meetingCodeController.dispose();
    super.dispose();
  }

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
                    color: const Color(0xFF1976D2),
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
                          Icons.videocam_outlined,
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
                              'Video Meetings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Virtual conferences and collaboration',
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
              const SizedBox(height: 24),
              // Quick Join Section
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
                        'Quick Join',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkGray,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _meetingCodeController,
                              decoration: InputDecoration(
                                hintText: 'Enter meeting code...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE3F2FD),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                filled: true,
                                fillColor: const Color(0xFFE3F2FD),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: () {
                              if (_meetingCodeController.text.isNotEmpty) {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.videoMeeting,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter a meeting code'),
                                    backgroundColor: AppColors.primaryRed,
                                  ),
                                );
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryRed,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Join',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Start New Meeting Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.videoMeeting),
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
                        Icon(Icons.videocam, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Start New Meeting',
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
              const SizedBox(height: 24),
              // Upcoming Meetings Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upcoming Meetings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ..._meetings
                        .map((meeting) => _MeetingCard(meeting: meeting))
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
}

class _MeetingCard extends StatelessWidget {
  final _UpcomingMeeting meeting;

  const _MeetingCard({required this.meeting});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFBBDEFB), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meeting.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      meeting.time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.lightText,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1976D2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  meeting.duration,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.person, size: 14, color: AppColors.lightText),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  meeting.host,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.lightText,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.people, size: 14, color: AppColors.lightText),
              const SizedBox(width: 6),
              Text(
                '${meeting.participants} participants',
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.lightText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.videoMeeting),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1976D2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.videocam, color: Colors.white, size: 16),
                        SizedBox(width: 6),
                        Text(
                          'Join Meeting',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Details for: ${meeting.title}'),
                      backgroundColor: AppColors.primaryRed,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFF1976D2),
                      width: 1.5,
                    ),
                  ),
                  child: const Text(
                    'Details',
                    style: TextStyle(
                      color: Color(0xFF1976D2),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _UpcomingMeeting {
  final String title;
  final String time;
  final String duration;
  final String host;
  final int participants;
  final String meetingCode;

  const _UpcomingMeeting({
    required this.title,
    required this.time,
    required this.duration,
    required this.host,
    required this.participants,
    required this.meetingCode,
  });
}
