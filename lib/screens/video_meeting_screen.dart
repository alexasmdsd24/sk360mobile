import 'package:flutter/material.dart';

import '../ui/app_ui.dart';

class VideoMeetingScreen extends StatefulWidget {
  const VideoMeetingScreen({super.key});

  @override
  State<VideoMeetingScreen> createState() => _VideoMeetingScreenState();
}

class _VideoMeetingScreenState extends State<VideoMeetingScreen> {
  bool _isMicOn = true;
  bool _isVideoOn = true;
  bool _isScreenSharing = false;

  final List<_Participant> _participants = [
    const _Participant(
      name: 'SK Federation President',
      position: 'President',
      isMe: true,
      isSelected: true,
    ),
    const _Participant(
      name: 'SK Chairman - Brgy 1',
      position: 'Chairman',
      isMe: false,
      isSelected: false,
    ),
    const _Participant(
      name: 'SK Chairman - Brgy 2',
      position: 'Chairman',
      isMe: false,
      isSelected: false,
      hasMutedIndicator: true,
    ),
    const _Participant(
      name: 'SK Secretary - Brgy 3',
      position: 'Secretary',
      isMe: false,
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1f2e),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: AppColors.primaryRed,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Federation Monthly Meeting',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '24 participants · 15:32',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),
            // Participants Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: _participants.map((participant) {
                    return _ParticipantCard(participant: participant);
                  }).toList(),
                ),
              ),
            ),
            // Meeting Controls
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF0f1419),
              ),
              child: Column(
                children: [
                  // Main info bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1a1f2e),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Federation Monthly Meeting',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '24 participants',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Control buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _ControlButton(
                        icon: _isMicOn ? Icons.mic : Icons.mic_off,
                        label: _isMicOn ? 'Mic' : 'Mic Off',
                        isActive: _isMicOn,
                        onTap: () => setState(() => _isMicOn = !_isMicOn),
                      ),
                      const SizedBox(width: 16),
                      _ControlButton(
                        icon: _isVideoOn ? Icons.videocam : Icons.videocam_off,
                        label: _isVideoOn ? 'Video' : 'Video Off',
                        isActive: _isVideoOn,
                        onTap: () => setState(() => _isVideoOn = !_isVideoOn),
                      ),
                      const SizedBox(width: 16),
                      // End call button (red circle in center)
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('End Meeting'),
                              content: const Text(
                                'Are you sure you want to end this meeting for all participants?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'End Meeting',
                                    style: TextStyle(color: AppColors.primaryRed),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryRed,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.call_end, color: Colors.white, size: 28),
                        ),
                      ),
                      const SizedBox(width: 16),
                      _ControlButton(
                        icon: _isScreenSharing ? Icons.stop_screen_share : Icons.screen_share,
                        label: _isScreenSharing ? 'Stop Share' : 'Share',
                        isActive: _isScreenSharing,
                        onTap: () => setState(() => _isScreenSharing = !_isScreenSharing),
                      ),
                      const SizedBox(width: 16),
                      _ControlButton(
                        icon: Icons.chat_bubble_outline,
                        label: 'Chat',
                        isActive: false,
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Chat feature coming soon')),
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      _ControlButton(
                        icon: Icons.more_vert,
                        label: 'More',
                        isActive: false,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.person_add),
                                    title: const Text('Invite Participants'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Invite feature coming soon')),
                                      );
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.settings),
                                    title: const Text('Meeting Settings'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Settings coming soon')),
                                      );
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.info),
                                    title: const Text('Meeting Info'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('Meeting Information'),
                                          content: const Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('Title: Federation Monthly Meeting'),
                                              SizedBox(height: 8),
                                              Text('Participants: 24'),
                                              SizedBox(height: 8),
                                              Text('Duration: 15:32'),
                                              SizedBox(height: 8),
                                              Text('Status: Active'),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context),
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ParticipantCard extends StatelessWidget {
  final _Participant participant;

  const _ParticipantCard({required this.participant});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1a1f2e),
        borderRadius: BorderRadius.circular(20),
        border: participant.isSelected
            ? Border.all(color: const Color(0xFFFFC107), width: 3)
            : Border.all(color: Colors.transparent, width: 1),
      ),
      child: Stack(
        children: [
          // Background placeholder
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF243447),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Colors.white.withOpacity(0.3),
                  size: 48,
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  participant.position,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  participant.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // Muted indicator
          if (participant.hasMutedIndicator)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.primaryRed,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.mic_off, color: Colors.white, size: 14),
              ),
            ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _ControlButton({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFF3a4250)
                  : const Color(0xFF2a2f38),
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive
                    ? Colors.white.withOpacity(0.2)
                    : Colors.transparent,
              ),
            ),
            child: Icon(
              icon,
              color: isActive ? Colors.white : Colors.white54,
              size: 20,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white54,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _Participant {
  final String name;
  final String position;
  final bool isMe;
  final bool isSelected;
  final bool hasMutedIndicator;

  const _Participant({
    required this.name,
    required this.position,
    required this.isMe,
    required this.isSelected,
    this.hasMutedIndicator = false,
  });
}
