import 'package:flutter/material.dart';

import '../routes.dart';
import '../ui/app_ui.dart';
import '../widgets/president_components.dart';

class _CalendarDayData {
  final String label;
  final bool hasEvent;
  final bool isToday;

  const _CalendarDayData({
    required this.label,
    this.hasEvent = false,
    this.isToday = false,
  });
}

class _EventData {
  final String title;
  final String date;
  final String time;
  final String label;
  final String description;

  const _EventData({
    required this.title,
    required this.date,
    required this.time,
    required this.label,
    required this.description,
  });
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PresidentNavItem _activeNav = PresidentNavItem.calendar;

  final List<_CalendarDayData> _days = const [
    _CalendarDayData(label: ''),
    _CalendarDayData(label: ''),
    _CalendarDayData(label: '1', hasEvent: true),
    _CalendarDayData(label: '2'),
    _CalendarDayData(label: '3'),
    _CalendarDayData(label: '4'),
    _CalendarDayData(label: '5'),
    _CalendarDayData(label: '6'),
    _CalendarDayData(label: '7', hasEvent: true),
    _CalendarDayData(label: '8'),
    _CalendarDayData(label: '9'),
    _CalendarDayData(label: '10'),
    _CalendarDayData(label: '11'),
    _CalendarDayData(label: '12'),
    _CalendarDayData(label: '13'),
    _CalendarDayData(label: '14'),
    _CalendarDayData(label: '15', isToday: true, hasEvent: true),
    _CalendarDayData(label: '16'),
    _CalendarDayData(label: '17'),
    _CalendarDayData(label: '18'),
    _CalendarDayData(label: '19'),
    _CalendarDayData(label: '20'),
    _CalendarDayData(label: '21'),
    _CalendarDayData(label: '22'),
    _CalendarDayData(label: '23'),
    _CalendarDayData(label: '24', hasEvent: true),
    _CalendarDayData(label: '25'),
    _CalendarDayData(label: '26'),
    _CalendarDayData(label: '27'),
    _CalendarDayData(label: '28'),
    _CalendarDayData(label: '29'),
    _CalendarDayData(label: '30'),
    _CalendarDayData(label: '31'),
  ];

  final List<_EventData> _events = const [
    _EventData(
      title: 'Federation Strategy Workshop',
      date: 'January 15, 2026',
      time: '9:00 AM - 12:00 NN',
      label: 'Workshop',
      description: 'Focus on Q1 initiatives and barangay coordination.',
    ),
    _EventData(
      title: 'Community Clean-up Drive',
      date: 'January 24, 2026',
      time: '6:00 AM - 11:00 AM',
      label: 'Community',
      description: 'Joint activity with SK councils to kick off the year.',
    ),
    _EventData(
      title: 'Monthly Federation Meeting',
      date: 'February 1, 2026',
      time: '10:00 AM - 12:00 NN',
      label: 'Meeting',
      description: 'Presentation of reports and upcoming programs.',
    ),
  ];

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
                title: 'Calendar & Events',
                subtitle: 'Plan and coordinate',
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _MonthSwitcher(),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _CalendarGrid(days: _days),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _EventListCard(events: _events),
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
        break;
      case PresidentNavItem.chat:
        Navigator.pushReplacementNamed(context, AppRoutes.presidentMessages);
        break;
      case PresidentNavItem.profile:
        Navigator.pushReplacementNamed(context, AppRoutes.profile);
        break;
    }
  }
}

class _MonthSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_left, color: AppColors.darkGray),
          ),
          const Spacer(),
          Column(
            children: const [
              Text(
                'January 2026',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGray,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Important deadlines and events',
                style: TextStyle(fontSize: 12, color: AppColors.lightText),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_right, color: AppColors.darkGray),
          ),
        ],
      ),
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  final List<_CalendarDayData> days;

  const _CalendarGrid({required this.days});

  static const List<String> _weekdays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _weekdays
                .map(
                  (day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightText,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            itemCount: days.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final day = days[index];
              if (day.label.isEmpty) {
                return const SizedBox.shrink();
              }
              final Color borderColor = day.isToday
                  ? AppColors.primaryRed
                  : AppColors.borderPink;
              final Color textColor = day.isToday
                  ? AppColors.primaryRed
                  : AppColors.darkGray;
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor, width: 1.2),
                  color: day.hasEvent ? AppColors.softPink : Colors.white,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        day.label,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                    if (day.hasEvent)
                      const Positioned(
                        right: 10,
                        top: 8,
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: AppColors.primaryRed,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _EventListCard extends StatelessWidget {
  final List<_EventData> events;

  const _EventListCard({required this.events});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
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
            'Upcoming Highlights',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 12),
          ...events.map(
            (event) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: _EventTile(event: event),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  final _EventData event;

  const _EventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softPink,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderPink, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryRed,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  event.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                event.time,
                style: const TextStyle(
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            event.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGray,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            event.date,
            style: const TextStyle(fontSize: 13, color: AppColors.lightText),
          ),
          const SizedBox(height: 8),
          Text(
            event.description,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.darkGray,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
